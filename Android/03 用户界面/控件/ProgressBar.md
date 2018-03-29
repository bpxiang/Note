# ProgressBar
>time: 2018-01-04 16:51:43

ProgressBar 用于在界面上显示一个进度条，表示我们的程序正在加载一些数据。
## 1. 圆形进度条
```xml
<ProgressBar
    android:id="@+id/progress_bar"
    android:layout_width="match_parent"
    android:layout_height="wrap_content"/>

<Button
    android:id="@+id/button"
    android:layout_width="wrap_content"
    android:layout_height="wrap_content"
    android:gravity="center"
    android:text="点击"/>
```

```java
public class MainActivity extends AppCompatActivity implements View.OnClickListener{
    private ProgressBar progressBar;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Button button = (Button) findViewById(R.id.button);
        progressBar = (ProgressBar) findViewById(R.id.progress_bar);
        button.setOnClickListener(this);

    }

    @Override
    public void onClick(View view) {
        switch(view.getId()) {
            case R.id.button:
                if (progressBar.getVisibility() == View.GONE) {
                    progressBar.setVisibility(View.VISIBLE);
                }else {
                    progressBar.setVisibility(View.GONE);
                }

                break;
            default:
                break;
        }
    }
}
```

## 2. 水平进度条

style 属性可以将它指定成水平进度条。
```xml
<ProgressBar
    android:id="@+id/progress_bar"
    android:layout_width="match_parent"
    android:layout_height="wrap_content"
    style="?android:attr/progressBarStyleHorizontal"
    android:max="100"/>

<Button
    android:id="@+id/button"
    android:layout_width="wrap_content"
    android:layout_height="wrap_content"
    android:gravity="center"
    android:text="点击"/>
```

```java
public class MainActivity extends AppCompatActivity implements View.OnClickListener{
    private ProgressBar progressBar;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Button button = (Button) findViewById(R.id.button);
        progressBar = (ProgressBar) findViewById(R.id.progress_bar);
        button.setOnClickListener(this);

    }

    @Override
    public void onClick(View view) {
        switch(view.getId()) {
            case R.id.button:
                int progress = progressBar.getProgress();
                progress += 10;
                if(progress > 100) {
                    progress = 0;
                }
                progressBar.setProgress(progress);

                break;
            default:
                break;
        }
    }
}
```