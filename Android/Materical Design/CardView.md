# CardView
>time: 2017-11-10 17:48:19  
>key: Materical Design, CardView  
>CardView 是用于实现卡片式布局效果的重要控件，由 appcompat-v7 库提供。实际上，CardView 也是一个 FrameLayout，而是额外提供了圆角和阴影等效果，看上去会有立体效果。

```xml
<android.support.v7.widget.CardView
    android:layout_width="match_parent"
    android:layout_height="wrap_content"
    android:layout_margin="4dp"
    app:cardCornerRadius="5dp">

    <TextView
        android:id="@+id/info_text"
        android:layout_width="match_content"
        android:layout_height="wrap_content"
        android:textSize="16sp"/>
</android.support.v7.widget.CardView>
```

`app:cardCornerRadius` 属性指定卡片圆角的弧度，数值越大，圆角的弧度也越大。

`app:elevation` 属性指定卡片的高度，高度值越大，投影范围也越大，但是投影效果越淡，高度值越小，投影范围也越小，但是投影效果越浓。