# android:layout_height
>time: 2017-12-29 10:19:09  

Android 中的所有控件都有这个属性。使用比例的方式来指定控件的大小，它在手机屏幕的适配方面可以起到非常重要的作用。

使用 android:layout_weight 属性，此时控件的宽度就不应该再由 android:layout_width 来决定，这里指定成 0dp 使一种比较规范的写法。

* match_parent: (官方推荐)控件的大小和父布局的大小一致。
* fill_parent: 控件的大小和父布局的大小一致。
* match_parent: 控件的大小和父布局的大小一致。
* wrap_parent: 表示让当前控件的大小能够刚好包含住里面的内容，控件的内容决定当前控件的大小。