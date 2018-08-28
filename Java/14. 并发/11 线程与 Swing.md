# 线程与 Swing
>time: 2018-08-21 09:48:20

在程序中使用线程的理由之一是提高程序的相应性能。当程序需要做某些耗时的工作时，应该启动另一个工作器线程而不是阻塞用户接口。

但是，必须认真考虑工作器线程在做什么，因为这或许令人惊讶，Swing 不是线程安全的。如果你试图在多个线程中操纵用户界面的元素，那么用户界面可能崩溃。

Swing 的设计者决定不再付出更多的努力实现 Swing 线程安全，有两个原因：
1. 同步需要时间，而且，已经没有人想要降低 Swing 的速度。
2. 更重要的是，Swing 小组调查了其他小组在线程安全的用户界面工具包方面的经验。他们的发现并不令人鼓舞。使用线程安全包的程序员被同步命令搞昏了头，常常编写出容易造成死锁的程序。

# 1. 运行耗时的任务
将线程与 Swing 一起使用时，必须遵循两个简单的原则
1. 如果一个动作需要花费很长时间，在一个独立的工作器线程中做这些事不要在事件分配线程中做。
2. 除了事件分配线程，不要在任何线程中接触 Swing 组件。

事件分配线程应该永远不要进行 `input/output` 调用，这有可能会阻塞，并且应该永远不要调用 sleep。（如果需要等待指定的时间，使用定时器时间。）

第二条规则在 Swing 编程中通常称为单一线程规则（single-thread rule）。

这两条规则看起来彼此冲突。假定要启动一个独立的线程运行一个耗时的任务。线程工作的时候，通常要更新用户界面中指示执行的进度。任务完成的时候，要再一次更新 GUI 界面。但是，不能从自己的线程接触 Swing 组件。例如，如果要更新进度条或标签文本，不能从线程中设置它的值。

要解决这一个问题，在任何线程中，可以使用两种有效的方法向事件队列添加任意的动作。例如，假定想在一个线程中周期性地更新标签来表明进度。

不可以从自己的线程中调用 label.setText，而应该使用 EventQueue 类的 invokeLater 方法和 invokeAndWait 方法使所调用的方法在事件分配线程中执行。

应该将 Swing 代码放置到实现 Runnable 接口的类的 run 方法中，然后，创建该类的一个对象，将其传递给静态的 invokeLater 或 invokeAndWait 方法。例如，下面是如何更新标签内容的代码：
```java
EventQueue.invokeLater(() -> {
    label.setText(parcentage + "% complete");
});
```
当事件放入事件队列时，invokeLater 方法立即返回，而 run 方法被异步执行。invokeAndWait 方法等待直到 run 方法确实被执行过为止。

在更新进度标签时，invokeLater 方法更适宜。用户更希望让工作器线程有更快完成工作而不是得到更加精确的进度指示器。

这两种方法都是在事件分配线程中执行 run 方法。没有新的线程被创建。
```java
import java.awt.*;
import java.util.*;

import javax.swing.*;

public class SwingTreadTest {

    public static void main(String[] args) {
        EventQueue.invokeLater(() -> {
            JFrame frame = new SwingThreadFrame();
            frame.setTitle("SwingThreadTest");
            frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
            frame.setVisible(true);
        });

    }
}

class SwingThreadFrame extends JFrame
{
    public SwingThreadFrame() {
        final JComboBox<Integer> combo = new JComboBox<>();
        combo.insertItemAt(Integer.MAX_VALUE, 0);
        combo.setPrototypeDisplayValue(combo.getItemAt(0));
        combo.setSelectedIndex(0);
        
        JPanel panel = new JPanel();
        
        JButton goodButton = new JButton("Good");
        goodButton.addActionListener(event -> 
                new Thread(new GoodWorkerRunnable(combo)).start());
        
        panel.add(goodButton);
        
        JButton badButton = new JButton("Bad");
        badButton.addActionListener(event -> 
                new Thread(new BadWorkerRunnable(combo)).start());
        panel.add(badButton);
        
        panel.add(combo);
        add(panel);
        pack();
    }
}

class BadWorkerRunnable implements Runnable
{
    private JComboBox<Integer> combo;
    private Random generator;

    public BadWorkerRunnable(JComboBox<Integer> aCombo) {
        this.combo = aCombo;
        this.generator = new Random();
    }
    @Override
    public void run() {
        try {
            while (true) {
                int i = Math.abs(generator.nextInt());
                if (i % 2 == 0) {
                    combo.insertItemAt(i, 0);
                }else if (combo.getItemCount() > 0) {
                    combo.removeItemAt(i % combo.getItemCount());
                }
                
                Thread.sleep(1);
            }
        } catch (InterruptedException e) {
        }
    }
    
}

class GoodWorkerRunnable implements Runnable
{
    private JComboBox<Integer> combo;
    private Random generator;
    
    public GoodWorkerRunnable(JComboBox<Integer> aCombo) {
        this.combo = aCombo;
        generator = new Random();
    }
    @Override
    public void run() {
        try {
            while (true) {
                EventQueue.invokeLater(()-> {
                    int i = Math.abs(generator.nextInt());
                    if (i % 2 == 0) {
                        combo.insertItemAt(i, 0);
                    }else if (combo.getItemCount() > 0) {
                        combo.removeItemAt(i % combo.getItemCount());
                    }
                });
                
                Thread.sleep(1);
            }
        } catch (InterruptedException e) {
        }
    }
    
}
```

#### java.awt.EventQueue 1.1
* static void invokeLater(Runnable runnable) 1.2
    >在待处理的线程被处理之后，让 runnable 对象的 run 方法在事件分配线程中执行。
* static void invokeAndWait(Runnable runnable) 1.2
    >在待处理的线程被处理之后，让 runnable 对象的 run 方法在事件分配线程中执行。该调用会阻塞，直到 run 方法终止。
* static boolean isDispatchThread() 1.2
    >如果执行这一方法的线程是事件分配线程，返回 true。

## 2. 使用 Swing 工作线程
当用户发布一条处理过程很耗时的命令时，你可能打算启动一个新的线程来完成这个工作。如同上面，线程应该使用 EventQueue.invokeLater 方法来更新用户界面。

SwingWorker 类使后台任务的实现不那么繁琐。

#### 典型的 UI 活动
* 在每一工作单位完成之后，更新 UI 来显示进度。
* 整个工作完成之后，对 UI 做最后的更新。

SwingWorker 类使得实现这一任务轻而易举。覆盖 doInBackground 方法来完成耗时的工作，不是地调用 publish 来报告工作进度。这一方在工作器线程中执行。publish 方法使得 process 方法在事件分配线程执行来处理进度的数据。当工作完成时，done 方法在事件分配线程中被调用以便完成 UI 的更新。

每当要在工作器线程中做一些工作时，构建一个新的工作器（每一个工作器对象只能被使用一次）。然后调用 execute 方法。典型的方式是在事件分配线程中调用 execute，但没有这样的需求。

假定工作器产生某种类型的结果；因此，`SwingWorker<T, V>` 实现 `Future<T>`。这一结果可以通过 Future 接口的 get 方法获得。由于 get 方法阻塞直到结果完成可用。因此不要在调用 execute 之后马上调用它。只在已经直到工作完成时调用它，是最为明智的。典型地，可以从 done 方法调用 get。（有时，没有调用 get 的需求，处理进度数据就是你所需要的。）


中间的进度数据以及最终的结果可以是任何类型。SwingWorker 类有 3 中类型作为操作类型参数。`SwingWorker<T, V>` 产生类型为 T 的结果以及类型为 V 的进度数据。

要取消正在进行的工作，使用 Future 接口的 cancel 方法。当该工作被取消的时候，get 方法抛出 CancellationException 异常。

工作线程对 publish 的调用会导致在事件分配线程上的 process 的调用。为了提供效率，几个对 publish 的调用结果，可用对 process 的一次调用成批处理。process 方法接收一个包含所有中间结果的列表`<v>`。


***
**注释**： 从工作器线程来更新文本区可以使这个程序的处理相当顺畅，但是，对大多数 Swing 组件来说不可能做到这一点。这里，给出一种通用的方法，其中所有组件的更新都出现在事件分配线程中。
***


```java
import java.awt.BorderLayout;
import java.awt.EventQueue;
import java.io.File;
import java.io.FileInputStream;
import java.util.List;
import java.util.Scanner;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutionException;

import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.SwingWorker;

public class SwingWorkerTest {

    public static void main(String[] args) {
        EventQueue.invokeLater(() -> {
            JFrame frame = new SwingWorkerFrame();
            frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
            frame.setVisible(true);
        });
    }

}

class SwingWorkerFrame extends JFrame
{
    private JFileChooser chooser;
    private JTextArea textArea;
    private JLabel statusLine;
    private JMenuItem openItem;
    private JMenuItem cancelItem;
    private SwingWorker<StringBuilder, ProgressData> textReader;
    public static final int TEXT_ROWS = 20;
    public static final int TEXT_COLUMNS = 60;
    
    public SwingWorkerFrame() {
        chooser = new JFileChooser();
        chooser.setCurrentDirectory(new File("."));
        
        textArea = new JTextArea(TEXT_ROWS, TEXT_COLUMNS);
        add(new JScrollPane(textArea));
        
        statusLine = new JLabel("");
        add(statusLine, BorderLayout.SOUTH);
        
        JMenuBar menuBar = new JMenuBar();
        setJMenuBar(menuBar);
        
        JMenu menu = new JMenu("File");
        menuBar.add(menu);
        
        openItem = new JMenuItem("Open");
        menu.add(openItem);
        openItem.addActionListener(event -> {
            int result = chooser.showOpenDialog(null);
            
            if(result == JFileChooser.APPROVE_OPTION) {
                textArea.setText("");
                openItem.setEnabled(false);
                textReader = new TextReader(chooser.getSelectedFile());
                textReader.execute();
                cancelItem.setEnabled(true);
            }
        });
    
        cancelItem = new JMenuItem("Cancel");
        menu.add(cancelItem);
        cancelItem.setEnabled(false);
        cancelItem.addActionListener(event -> textReader.cancel(true));
        pack();
    }
    
    private class ProgressData
    {
        public int number;
        public String line;
    }
    
    private class TextReader extends SwingWorker<StringBuilder, ProgressData> {

        private File file;
        private StringBuilder text = new StringBuilder();
        
        public TextReader(File file) {
            this.file = file;
        }

        @Override
        protected StringBuilder doInBackground() throws Exception {
            int lineNumber = 0;
            try(Scanner in = new Scanner(new FileInputStream(file), "UTF-8")) {
                while(in.hasNextLine()) {
                    String line = in.nextLine();
                    lineNumber++;
                    text.append(line).append("\n");
                    ProgressData data = new ProgressData();
                    data.number = lineNumber;
                    data.line = line;
                    publish(data);
                    Thread.sleep(1);
                }
            }
            return text;
        }
        
        @Override
        public void process(List<ProgressData> data) {
            if (isCancelled()) return;
            StringBuilder b = new StringBuilder();
            statusLine.setText("" + data.get(data.size() - 1).number);
            for (ProgressData d : data) {
                b.append(d.line).append("\n");
            }
            textArea.append(b.toString());;
        }
        @Override
        public void done() {
            try {
                StringBuilder result = get();
                textArea.setText(result.toString());
                statusLine.setText("Done");
            } catch (InterruptedException e) {
            } catch (CancellationException e) {
                textArea.setText("");
                statusLine.setText("Cancelled");
            } catch (ExecutionException e) {
                statusLine.setText("" + e.getCause());
            }
            
            cancelItem.setEnabled(false);
            openItem.setEnabled(true);
        }
    }
}
```

#### javax.swing.SwingWorker`<T, V>` 6
* abstract T doInBackground()
    >覆盖这一方法来执行后台的任务并返回这一工作的结果。
* void process(List`<V>` data)
    >覆盖这一方法来处理事件分配线程中的中间进度数据。
* void publish(V... data)
    >传递中间进度数据到事件分配线程。从 doInBackground 调用这一方法。
* void execute()
    >为工作线程的执行预定这个工作器。
* SwingWorker.StateValue getState()
    >得到这个工作器线程的状态，值为 PENDING、STATEND 或 DONE 之一。


## 3. 单一线程规则
每一个 Java 应用程序都开始于主线程中的 main 方法。在 Swing 程序中，main 方法的生命周期是很短的。它在事件分配线程中规划用户界面的构造然后退出。在用户界面构造之后，事件分配线程会处理事件通知，例如调用 actionPerformed 或 paintComponent。其他线程在后台运行，例如将事件放入事件队列的进程，但是那些线程对应用程序员是不可见的。

**单一线程规则**： 除了事件分配线程，不要在任何线程中接触 Swing 组件。

#### 单一线程规则存在一些例外情况
* 可在任一个线程里添加或移除事件监听器。当然该监听器的方法会在事件分配线程中被触发。
* 只有很少的 Swing 方法是安全的。在 API 文档中用这样的句子特别标明：*“尽管大多数 Swing 方法不是线程安全的，但这个方法是。”* 在这些线程安全的方法中最有用的是：
    ```
    JTextComponent.setText
    JTextArea.insert
    JTextArea.append
    JTextArea.replaceRange
    JComponent.repaint
    JComponent.revalidate
    ```

***
**注释**：在本书中多次使用 repaint 方法，但是，revalidate 方法不怎么常见。这样做的目的是在内容改变之后强制执行组件布局。传统的 AWT 有一个 validate 方法强制执行组件布局。对于 Swing 组件，应该调用 revalidate 方法。（但是，要强制执行 JFrame 的布局，仍然要调用 validate 方法，因为 JFrame 是一个 Component 不是一个 JComponent。）
***

历史上，单一线程规则是更加随意的。任何线程都可以构建组件，设置优先级，将它们添加到容器中，只要这些组件没有一个是已经被实现的（realized）。如果组件可以接收 paint 事件或 validation 事件，组件被实现。一旦调用组件的 setVisible(true) 或 pach(!) 方法或者组件已经被添加到已经被实现的容器中，就出现这样的情况。

单一线程规则的这一版本是便利的。它允许在 main 方法中创建 GUI，然后，在应用程序的顶层架构调用 setVisible(true)。在事件分配线程上没有令人讨厌的 Runnable 的安排。

遗憾的是，一些组件的实现者没有注意原来的单一线程规则的微妙之处。他们在事件分配线程启动活动，而没有检查组件是否是被实现的。例如，如果在 JTextComponent 上调用 setSelectionStart 或 setSelectionEnd，在事件分配线程中安排了一个插入符号的移动，即使该组件不是可见的。

检测并定位这些问题可能会好些，但是 Swing 的设计者没有走这条轻松地路。他们认定除了使用事件分配线程之外，从任何其他线程访问组件永远都是不安全的。因此，你需要在事件分配线程构建用户界面。像程序实例中那样调用 EventQueue.invokeLater。

有不少程序使用旧版的单一线程规则，在主线程初始化用户界面。那些程序有一定的风险，某些用户界面的初始化会引起事件分配线程的动作与主线程的动作发生冲突。不要让自己成为少数不幸的人之一，为时有时无的线程 bug 烦恼并花费时间。因此，一定要遵循严谨的单一线程规则。