# NavigationView
>key: 2017-11-10 17:51:39   
>keyword: Materical Design, NavigationView  
>NavigationView 是 Design Support 库中提供的一个控件，它不仅仅是严格按照 Material Design 的要求来进行设计的。而且还可以将滑动菜单页面的实现变得非常简单。

## 1. 添加依赖
`app/build.gradle` 添加依赖关系
```
dependencies {
    ...
    compile 'com.android.support:design:26.1.0'
    compile 'de.hdodenhof:circleimageview:2.2.0'
}
```

`build.gradle`  添加 maven (不加出现 “failed to resolve design”)
```
allprojects {
    repositories {
        jcenter()
        maven {
            url "https://maven.google.com"
        }
    }
}
```

## 2. 代码
### 2.1 活动布局文件
```xml
<?xml version="1.0" encoding="utf-8"?>
<android.support.v4.widget.DrawerLayout
    xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    android:id="@+id/drawer_layout"
    android:layout_width="match_parent"
    android:layout_height="match_parent">

    <android.support.constraint.ConstraintLayout
        ...
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
`menu` 在 NavigationView 中显示具体的菜单项。

`headerLayout` 在 NavigationView 中显示头部布局。

### 2.2 menu

右击 menu 文件夹 -> New -> Menu resource file，创建一个 nav_menu.xml 文件。
```xml
<?xml version="1.0" encoding="utf-8"?>
<menu xmlns:android="http://schemas.android.com/apk/res/android">
    <group android:checkableBehavior="single">
        <item
            android:id="@+id/nav_call"
            android:icon="@mipmap/ic_launcher_round"
            android:title="Call" />
        <item
            android:id="@+id/nav_friends"
            android:icon="@mipmap/ic_launcher_round"
            android:title="Friends" />
        <item
            android:id="@+id/nav_location"
            android:icon="@mipmap/ic_launcher_round"
            android:title="Location" />
        <item
            android:id="@+id/nav_mail"
            android:icon="@mipmap/ic_launcher_round"
            android:title="Mail" />
        <item
            android:id="@+id/nav_task"
            android:icon="@mipmap/ic_launcher_round"
            android:title="Task" />
    </group>
</menu>
```

group 表示一个组，`checkableBehavior` 属性指定为 `single` 表示组中的所有菜单项只能单选。

### 2.3 headerLayout

右击 layout 文件夹->New->Layout resource file，创建一个 nav_header.xml 文件。

```xml
<?xml version="1.0" encoding="utf-8"?>
<RelativeLayout xmlns:android="http://schemas.android.com/apk/res/android"
                android:layout_width="match_parent"
                android:layout_height="180dp"
                android:padding="10dp"
                android:background="?attr/colorPrimary">
    <de.hdodenhof.circleimageview.CircleImageView
        android:id="@+id/icon_image"
        android:layout_width="70dp"
        android:layout_height="70dp"
        android:src="@mipmap/ic_launcher"
        android:layout_centerInParent="true" />

    <TextView
        android:id="@+id/username"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_alignParentBottom="true"
        android:text="bupuxiang@qq.com"
        android:textColor="#FFF"
        android:textSize="14sp"/>

    <TextView
        android:id="@+id/mail"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_above="@id/username"
        android:text="Bu Puxiang"
        android:textColor="#FFF"
        android:textSize="14sp"/>
</RelativeLayout>
```

### 2.4 活动

```java
@Override
protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    setContentView(R.layout.activity_main);
    Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
    setSupportActionBar(toolbar);

    mDrawerLayout = (DrawerLayout) findViewById(R.id.drawer_layout);
    // +
    NavigationView navView = (NavigationView) findViewById(R.id.nav_view);

    ActionBar actionBar = getSupportActionBar();
    if(actionBar != null) {
        actionBar.setDisplayHomeAsUpEnabled(true);
        actionBar.setHomeAsUpIndicator(R.mipmap.ic_launcher_round);
    }
    // +
    navView.setCheckedItem(R.id.nav_call);
    // +
    navView.setNavigationItemSelectedListener(new NavigationView.OnNavigationItemSelectedListener() {

        @Override
        public boolean onNavigationItemSelected(@NonNull MenuItem item) {
            mDrawerLayout.closeDrawers();
            return true;
        }
    });
}
```

NavigationView.setCheckedItem() 方法设置菜单项默认选中。

NavigationView.setNavigationItemSelectedListener() 方法来设置一个菜单项选中事件的监听器，当用户点击了任意菜单项时，就会回调到 OnNavigationItemSelected() 方法中。

DrawerLayout.closeDrawers() 方法将滑动菜单关闭。