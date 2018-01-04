# ImageView
>time: 2018-01-04 16:35:55  

ImageView 是用于在界面上展示图片的一个控件，它可以让我们的程序界面变得更加丰富多彩。图片通常都是放在以 “drawable” 开头的目录下的。
```xml
<ImageView
    android:id="@+id/image_view"
    android:layout_width="wrap_content"
    android:layout_height="wrap_content"
    android:src="@mipmap/ic_launcher"/>
```

android:src: 为 ImageView 制定了一张图片。

```java
public class MainActivity extends AppCompatActivity implements View.OnClickListener{
    private int flag = 0;
    private ImageView imageView;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Button button = (Button) findViewById(R.id.button);
        imageView = (ImageView) findViewById(R.id.image_view);
        button.setOnClickListener(this);

    }

    @Override
    public void onClick(View view) {
        switch(view.getId()) {
            case R.id.button:
                int img = R.mipmap.ic_launcher;
                if(flag % 2 == 0){
                    img = R.mipmap.ic_launcher_round;
                }
                flag++;
                System.out.println(flag);
                System.out.println(img);
                System.out.println();
                imageView.setImageResource(img);

                break;
            default:
                break;
        }
    }
}
```