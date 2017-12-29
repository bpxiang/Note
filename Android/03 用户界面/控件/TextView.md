# TextView
>time: 2017-12-29 10:08:44  

TextView 可以说是 Android 中最简单的一个控件。
```xml
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:orientation="vertical"
    android:layout_width="match_parent"
    android:layout_height="match_parent">

    <TextView
        android:id="@+id/text_view"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:text="This is TextView"/>
</LinearLayout>
```