# 线程与 Swing
>time: 2018-8-21 09:48:20

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

***
**注释**： 从工作器线程来更新文本区可以使这个程序的处理相当顺畅，但是，对大多数 Swing 组件来说不可能做到这一点。这里，给出一种通用的方法，其中所有组件的更新都出现在事件分配线程中。
***


