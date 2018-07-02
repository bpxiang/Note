# android:visibility
>time: 2018-01-04 16:55:08

Android 控件的可见属性。
* visible: 表示控件可见。
* invisible: 表示控件不可见，但是它仍然占据着原来的位置和大小，可以理解成控件编程透明状态了。
* gone: 表示控件不仅不可见，而且不再占用任何屏幕控件。

Java 设置控件可见性的方法是 setVisibility()。可以传入 View.VISIBLE、View.INVISIBLE 和 View.GONE。
