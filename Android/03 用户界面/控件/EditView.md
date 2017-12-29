# EditView
>time: 2017-12-29 11:45:47

程序用于和用户进行交互的一个重要控件，允许用户在控件里输入和编辑内容，并可以在程序中对这些内容进行处理。

```xml
<EditText
    android:id="@+id/edit_text"
    android:layout_width="match_parent"
    android:layout_height="wrap_content"
    android:hint="Type something here"
    android:maxLines="2"/>
```
```java
public class MainActivity extends AppCompatActivity implements View.OnClickListener {
    private static final String TAG = "MainActivity";
    private EditText editText;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Button button = (Button) findViewById(R.id.button);
        editText = (EditText) findViewById(R.id.edit_text);
        button.setOnClickListener(this);

    }

    @Override
    public void onClick(View view) {
        switch (view.getId()) {
            case R.id.button:
                Log.d(TAG, "onClick: " + view.getId());
                String inputText = editText.getText().toString();
                Toast.makeText(MainActivity.this, inputText,
                        Toast.LENGTH_LONG).show();
                break;
            default:
                Log.d(TAG, "onClick: default");
                break;
        }
    }
}
````