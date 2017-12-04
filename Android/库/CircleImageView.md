# CircleImageView
>time: 2017-11-30 09:54:13  
>实现图片圆形化效果  

[CircleImageView 链接](https://github.com/hdodenhof/CircleImageView)


## Gradle

```
dependencies {
    ...
    compile 'de.hdodenhof:circleimageview:2.1.0'
}
```

## Usage
````
<de.hdodenhof.circleimageview.CircleImageView
    xmlns:app="http://schemas.android.com/apk/res-auto"
    android:id="@+id/profile_image"
    android:layout_width="96dp"
    android:layout_height="96dp"
    android:src="@drawable/profile"
    app:civ_border_width="2dp"
    app:civ_border_color="#FF000000"/>
```