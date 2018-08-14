# Callable 与 Future
>time: 2018-08-13 17:32:54

Runnable 封装一个异步运行的任务，可以把它想象成为一个没有参数和返回值的异步方法。Callable 与 Runnable 类似，但是有返回值。Callable 接口是一个参数化的类型，只有一个方法 call。
```java
public interface Callable<V>
{
    V call() throws Exception;
}
```
类型参数是返回值的类型。例如，`Callable<Integer>` 表示一个最终返回 Integer 对象的异步计算。  
Future 保存异步计算的结果。可以启动一个计算，将 Future 对象交给某个线程，然后忘掉它。Future 对象的所有者在结果计算后之后就可以获得它。

Future 接口具有下面的方法
```java
public interface Future`<V>` 
{
    V  get() throws ...;
    V  get(long timeout, TimeUnit unit) throws ...;
    void cancel(boolean mayInterrupt);
    boolean isCancelled();
    boolean isDone();
}
```
第一个 get 方法的调用被阻塞，知道计算完成。如果在计算完成之前，第二个方法调用超时，抛出一个 TimeoutException 异常。如果运行该计算的线程被中断，两个方法都将抛出 IterruptedException。如果计算已经完成，那么 get 方法立即返回。  
如果计算还在进行，isDone 方法返回 false；如果计算完成了，则返回 true。  
可以用 cancel 方法取消该计算。如果计算还没有开始，它被取消且不再开始。如果计算处于运行之中，那么如果 mayInterrupt 参数为 true，它就被中断。  
FutureTask 包装器是一种非常便利的机制，可将 Callable 转换成 Future 和 Runnable，它同时实现二者的接口。
```java
Callable<Integer> myComputation = ...;
FutureTask<Integer> task = new FutureTask<Integer>(myComputation);
Thread t = new Thread(task); // it's a Runnable
t.start();
...
Integer result = task.get(); // It's a Future
```

#### FutureTest.java
```java
import java.io.File;
import java.util.Scanner;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.FutureTask;

public class FutureTest {
    public static void main(String[] args) {
        try (Scanner in = new Scanner(System.in)) {
            System.out.println("Enter base directory (e.g. /usr/local/jdk5.0/src): ");
            String directory = in.nextLine();
            System.out.println("Enter keyword (e.g. volatile): ");
            String keyword = in.nextLine();
            
            MatchCounter counter = new MatchCounter(new File(directory), keyword);
            FutureTask<Integer> task = new FutureTask<>(counter);
            Thread t = new Thread(task);
            t.start();
            try {
                System.out.println(task.get() + " matching files.");
            }catch(ExecutionException e) {
                e.printStackTrace();
            } catch (InterruptedException e) {
            }
        }
    }
}
```

#### MatchCounter.java
```java
import java.io.File;
import java.io.IOException;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import java.util.concurrent.FutureTask;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class MatchCounter implements Callable<Integer> {

    private File directory;
    private String keyword;
    
    public MatchCounter(File directory, String keyword) {
        this.directory = directory;
        this.keyword = keyword;
    }
    @Override
    public Integer call() throws Exception {
        int count = 0;
        try {
            File[] files = directory.listFiles();
            List<Future<Integer>> results = new ArrayList<>();
            
            for (File file : files) {
                if (file.isDirectory()) {
                    MatchCounter counter = new MatchCounter(file, keyword);
                    FutureTask<Integer> task = new FutureTask<>(counter);
                    results.add(task);
                    Thread t = new Thread(task);
                    t.start();
                }else {
                    if (search(file)) count++;
                }
            }
            
            for(Future<Integer> result: results) {
                try {
                    count += result.get();
                }catch(ExecutionException e) {
                    e.printStackTrace();
                }               
            }
        } catch (InterruptedException e) {}
        
        return count;
    }
    
    public boolean search(File file) {
        try {
            try(Scanner in = new Scanner(file, "UTF-8")) {
                boolean found = false;
                while(!found && in.hasNextLine()) {
                    String line = in.nextLine();
                    if (line.contains(keyword)) {
                        found = true;
                    }
                }
                return found;
            }
        }catch(IOException e) {
            return false;
        }
    }
}
```

#### java.util.concurrent.Callable`<V>` 5.0
* V call()
    >运行一个将产生结果的任务。

#### java.util.concurrent.Future`<V>` 5.0
* V get()
* V get(long time, TimeUnit unit)
    >获取结果，如果没有结果可用，则阻塞直到真正得到结果超过指定的时间为止。 如果不成功，第二个方法会拋出 TimeoutException 异常。
* boolean cancel(boolean mayInterrupt)
    >尝试取消这一任务。如果任务已经开始，并且 MayInterrupt 参数值为 true，它就会被中断。如果成功执行了取消操作，返回 true。
* boolean isCancelled()
    >如果任务在完成前被取消了，则返回 true。
* boolean isDone()
    >如果任务结束，无论是正常结束、中途取消或发生异常，都返回 true。

#### java.util.concurrent.FutureTask`<V>` 5.0
* FutureTask(Callable`<V>` task)
* FutureTask(Runnable task, V result)
    >构造一个即是 `Future<V>` 有是 Runnable 的对象。