# Callable 与 Future
>time: 2018-08-13 17:32:54

Runnable 封装一个异步运行的任务，可以把它想象成为一个没有参数和返回值的异步方法。Callable 与 Runnable 类似，但是有返回值。Callable 接口是一个参数化的类型，只有一个方法 call。
```java
public interface Callable<V>
{
    V call() throws Exception;
}
```