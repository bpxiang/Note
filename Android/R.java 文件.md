# R.java 文件
>time: 2017-12-12 14:30:28

为了在 Java 代码中使用资源， AAPT 会为 Android 项目自动生成一份 R.java 文件，R 类里为每份资源分别定义了一个内部类，其中每个资源对应于内部类里的一个 int 类型的 field。例如，上面的字符串资源文件对应与 R.java 里如下内容：
```java
// 对应于一份资源
public static final class string {
    // 对应于一项资源
    public static final int action0=0x7f0b005b;
    public static final int action_bar=0x7f0b0047;
    public static final int action_bar_activity_content=0x7f0b0000;
    public static final int action_bar_container=0x7f0b0046;
    public static final int action_bar_root=0x7f0b0042;
}
```
借助于 AAPT 自动生成 R 类的帮助，在 Java 代码中可通过 R.string.app_name 引用到 “Hello World” 字符串常量。