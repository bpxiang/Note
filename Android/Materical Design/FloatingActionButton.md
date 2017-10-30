# FloatingActionButton

FloatingActionButton 是 Design Support 库中提供的一个控件，这个控件可以帮助我们比较轻松地实现悬浮按钮的效果，默认使用 colorAccent 来作为按钮的颜色。

FloatingActionButton 和普通的 Button 没什么两样。

```xml
<?xml version="1.0" encoding="utf-8"?>
<android.support.v4.widget.DrawerLayout
    xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:id="@+id/drawer_layout"
    android:layout_width="match_parent"
    android:layout_height="match_parent">

    <android.support.constraint.ConstraintLayout
        android:layout_width="match_parent"
        android:layout_height="match_parent">

        <android.support.v7.widget.Toolbar
            android:id="@+id/toolbar"
            android:layout_width="0dp"
            android:layout_height="56dp"
            android:background="?attr/colorPrimary"
            android:theme="@style/ThemeOverlay.AppCompat.Dark.ActionBar"
            app:popupTheme="@style/ThemeOverlay.AppCompat.Light"
            app:layout_constraintLeft_toLeftOf="parent"
            app:layout_constraintRight_toRightOf="parent"
            tools:layout_editor_absoluteY="25dp"/>

        <android.support.design.widget.FloatingActionButton
            android:id="@+id/fab"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_gravity="bottom|end"
            android:src="@mipmap/ic_launcher"
            android:layout_margin="16dp"
            app:elevation="8dp"
            app:layout_constraintRight_toRightOf="parent"
            app:layout_constraintBottom_toBottomOf="parent"/>

    </android.support.constraint.ConstraintLayout>
    <android.support.design.widget.NavigationView
        android:id="@+id/nav_view"
        android:layout_width="match_parent"
        android:layout_height="match_parent"
        android:layout_gravity="start"
        app:menu="@menu/nav_menu"
        app:headerLayout="@layout/nav_header" />
</android.support.v4.widget.DrawerLayout>
```

app:elevation 属性给 FloatingActionButton 指定一个高度值，高度值越大，投影范围也越大，但是投影效果越淡，高度值越小，投影范围也越小，但是投影效果越nong。FloatingAction 效果就已经足够了。

```java

@Override
protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    setContentView(R.layout.activity_main);
    ...
    FloatingActionButton fab = (FloatingActionButton) findViewById(R.id.fab);
    fab.setOnClickListener(new View.OnClickListener() {

        @Override
        public void onClick(View view) {
            Toast.makeText(MainActivity.this, "FAB clicked", Toast.LENGTH_SHORT).show();
        }
    });
}

```
