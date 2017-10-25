# DrawerLayout

DrawerLayout 由 support-v4 库提供的。DrawerLayout 中放置了两个直接子控件，第一个子控件是 FrameLayout，用于作为主屏幕中显示的内容，第二个子控件作为滑动菜单中显示的内容，DrawerLayout 并没有限制只能使用固定的控件。

第二个子控件中需要注意，layout_gravity 这个属性是必须指定的，因为我们需要告诉菜单是在屏幕的左边还是右边，指定 left 表示滑动菜单在左边，指定 right 表示滑动菜单在右边。制定了 start，表示会根据系统语言进行判断，如果系统语言是从左往右，比如英语、汉语，滑动菜单就在左边，如果系统语言是从右往左，比如阿拉伯语言，滑动菜单就在右边。
```xml
<?xml version="1.0" encoding="utf-8"?>
<android.support.v4.widget.DrawerLayout
    xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    android:id="@+id/drawer_layout"
    android:layout_width="match_parent"
    android:layout_height="match_parent">

    <android.support.constraint.ConstraintLayout
        android:layout_width="match_parent"
        android:layout_height="match_parent">

        <android.support.v7.widget.Toolbar
            android:id="@+id/toolbar"
            android:layout_width="match_parent"
            android:layout_height="?attr/actionBarSize"
            android:background="?attr/colorPrimary"
            android:theme="@style/ThemeOverlay.AppCompat.Dark.ActionBar"
            app:popupTheme="@style/ThemeOverlay.AppCompat.Light"
            app:layout_constraintLeft_toLeftOf="parent"
            app:layout_constraintRight_toRightOf="parent"/>

        <TextView
            android:layout_width="310dp"
            android:layout_height="52dp"
            android:text="Hello World!"

            app:layout_constraintBottom_toBottomOf="parent"
            app:layout_constraintLeft_toLeftOf="parent"
            app:layout_constraintRight_toRightOf="parent"
            app:layout_constraintTop_toTopOf="parent"
            android:layout_marginLeft="8dp"
            android:layout_marginRight="8dp"
            android:layout_marginStart="8dp"
            android:layout_marginEnd="8dp"/>

    </android.support.constraint.ConstraintLayout>
    <TextView
        android:layout_width="match_parent"
        android:layout_height="match_parent"
        android:layout_gravity="start"
        android:text="This is menu"
        android:textSize="30sp"
        android:background="#FFF"/>
</android.support.v4.widget.DrawerLayout>
```


```java
@Override
protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    setContentView(R.layout.activity_main);
    Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
    setSupportActionBar(toolbar);

    mDrawerLayout = (DrawerLayout) findViewById(R.id.drawer_layout);
    ActionBar actionBar = getSupportActionBar();
    if(actionBar != null) {
        actionBar.setDisplayHomeAsUpEnabled(true);
        actionBar.setHomeAsUpIndicator(R.mipmap.ic_launcher_round);
    }
}

@Override
public boolean onOptionsItemSelected(MenuItem item) {
    switch (item.getItemId()) {
        ...
        case android.R.id.home:
            mDrawerLayout.openDrawer(GravityCompat.START);
            break;
        default:
    }
    return true;
}
```

Material Design 建议的做法是在 ToolBar 的最左边加入一个导航按钮，点击了按钮也会将滑动菜单的内容展示出来。这样就相当于给用于提供了两种打开滑动菜单的方式，防止一些用户不知道屏幕的左侧边缘是可以拖动的。

getSupportActionBar() 方法得到了 Action 的示例，虽然这个 ActionBar 的具体实现由 Toolbar 来完成的。

ActionBar.setDisplayHomeAsUpEnabled() 方法让导航按钮显示出来。

ActionBar.setHomeAsUpIndicator() 方法来设置一个导航按钮图标。

ToolBar 最左侧的这个按钮叫做 HomeAsUp 按钮，它默认的图标是一个返回的箭头，含义是返回上一个活动。

onOptionsItemSelected() 方法中对 HomeAsUp 按钮的点击事件进行处理，HomeAsUp 按钮的 id 永远都是 android.R.id.home。然后调用 DrawerLayout 的 openDrawer() 方法将滑动菜单展示出来。openDrawer() 方法要求传入一个 Gravity 参数，为了保证这里的行为和 XML 中定义的一致。