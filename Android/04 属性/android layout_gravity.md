# android:layout_gravity
>time: 2018-01-11 16:54:49

指定控件在布局中的对齐方式。android:layout_gravity 的可选值和 android:gravity 差不多，但需要注意，当 LinearLayout 的排列方向是 horizontal 时，只有垂直方向的对齐方式才会生效，因为此时水平方向上的长度是不固定，每添加一个控件，水平方向上的长度都会改变，因而无法指定该方向上的对齐方式。同样的道理，当 LinearLayout 的排列方向是 vertical 时，只有水平方向上的对齐方式才会生效。
```xml
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout
    xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:orientation="horizontal">

    <Button
        android:id="@+id/button1"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_gravity="top"
        android:text="Button 1"/>

    <Button
        android:id="@+id/button2"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_gravity="center_vertical"
        android:text="Button 2"/>

    <Button
        android:id="@+id/button3"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_gravity="bottom"
        android:text="Button 3"/>

</LinearLayout>

```
