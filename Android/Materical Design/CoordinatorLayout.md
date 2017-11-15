# CoordinatorLayout
>key: 2017-11-10 17:49:45  
>keyword: Materical Design, CoordinatorLayout  
>CoordinationLayour 可以说是一个加强版的 FrameLayout，这个布局也是由 Design Support 库提供的，在普通情况下的作用和 FrameLayout 基本一致。

CoordinatorLayout 可以监听其所有子控件的各种事件，然后自动帮助我们做出最为合理的响应。

```xml
<?xml version="1.0" encoding="utf-8"?>
<android.support.v4.widget.DrawerLayout
    xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:id="@+id/drawer_layout"
    android:layout_width="match_parent"
    android:layout_height="match_parent">

    <android.support.design.widget.CoordinatorLayout
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
            android:layout_margin="16dp"
            android:src="@mipmap/ic_launcher"/>

    </android.support.design.widget.CoordinatorLayout>
    <android.support.design.widget.NavigationView
        android:id="@+id/nav_view"
        android:layout_width="match_parent"
        android:layout_height="match_parent"
        android:layout_gravity="start"
        app:menu="@menu/nav_menu"
        app:headerLayout="@layout/nav_header" />
</android.support.v4.widget.DrawerLayout>
```

```java
FloatingActionButton fab = (FloatingActionButton) findViewById(R.id.fab);
fab.setOnClickListener(new View.OnClickListener() {

    @Override
    public void onClick(View view) {
        Snackbar.make(view, "Data deleted", Snackbar.LENGTH_SHORT)
                .setAction("undo", new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        Toast.makeText(MainActivity.this, "Data restored",
                                Toast.LENGTH_SHORT).show();
                    }
                })
                .show();
        Log.d(TAG, "onClick: FloatingActionButton - onClick");
    }
});
```

Snackbar 的 make() 方法中传入的第一个参数就是用来指定 Snackbar 基于哪个 View 来触发的，刚才我们传入的是 FloatingActionButton 本身，而 FloatingActionButton 时 CoordinatorLayout 中的子控件，因此这个事件就理所应当能被监听到了。
