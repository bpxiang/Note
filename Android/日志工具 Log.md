# 日志工具 Log
>key: 2017-11-13 09:46:19  
  
Log（android.util.Log）,提供了 5 个方法：
* Log.v()。 用于打印哪些最为繁琐的、意义最小的日志信息。对应级别 verbose，是 Android 日志里面级别最低的一种。
* Log.d()。用于打印一些调试信息，这些信息对你调试程序和分析问题应该是有帮助的。对应级别 debug，比 verbose 高一级。
* Log.i()。用于打印一些比较重要的数据，这些数据应该是你非常想看到的、可以帮你分析用户行为数据。对应级别 info，比 debug 高一级。
* Log.w()。用于打印一些警告信息，提示程序在这个地方可能会有潜在的风险，最好去修复一下这些出现警告的地方。对应级别 warn，比 info 高一级。
* Log.e()。用于打印程序中的错误信息，比如程序进入到 catch 语句当中。当有错误信息打印出来的时候，一般都代表你的程序出现了严重问题了，必须尽快修复。对应级别 error，比 warn 高一级。

logd + Tab 键，自动生成 Log.d()。  
logt + Tab 键，自动生成 TAG 变量。
```java
private static final String TAG = "HelloWorldActivity";
```
