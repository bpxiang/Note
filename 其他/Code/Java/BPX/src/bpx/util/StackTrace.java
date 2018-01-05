package bpx.util;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.Map;

public class StackTrace {

    public static String getStackTrace() {
        // Throwable 类的 printStackTrace 方法访问堆栈轨迹的文本描述信息
        Throwable t = new Throwable();
        StringWriter out = new StringWriter();
        t.printStackTrace(new PrintWriter(out));
        String description = out.toString();
        return description;
    }
    public static String getStackTraces() {
        // StackTraceElement 类包有能够获得文件名和当前执行的代码行号的方法
        // 含有能够获得类名和方法名的方法。
        // toString 方法将产生一个格式化的字符串，其中包含所获得的信息
        Throwable t = new Throwable();
        StackTraceElement[] frames = t.getStackTrace();
        StringBuilder builder = new StringBuilder();
        for(StackTraceElement frame : frames) {
            String description = frame.toString();
            builder.append(description);
            builder.append("\n");
        }
        return builder.toString();
    }
    public static String getAllStackTrace() {
        // 静态的 Thread.getAllStackTraces 方法，它可以产生所有线程的堆栈轨迹。
        Map<Thread, StackTraceElement[]> map = Thread.getAllStackTraces();
        StringBuilder builder = new StringBuilder();
        for(Thread t : map.keySet()) {
            StackTraceElement[] frames = map.get(t);
            builder.append("\n");
            for(StackTraceElement frame : frames) {
                String description = frame.toString();
                builder.append(description);
                builder.append("\n");
            }
        }
        return builder.toString();
    }

    public static void main(String[] args) {
        String stackTrace = StackTrace.getStackTraces();
        System.out.println(stackTrace);
    }

}
