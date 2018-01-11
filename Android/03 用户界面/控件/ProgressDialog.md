# ProgressDialog
>time: 2018-01-11 16:19:23

## Android 8 已弃用

ProgressDialog 可以在页面上弹出一个对话框，能够屏蔽掉其他控件的交互能力。ProgressDialog 会在对话框中显示一个进度条，一般用于表示当前操作比较耗时，让用户耐心等待。

setCancelable() 中传入了 false，表示 ProgressDialog 是不能通过 Back 键取消掉的，这时你就一定要在代码中做好控制，当数据加载完成后必须要调用 ProgressDialog 的 dismiss() 方法来关闭对话框，否则 ProgressDialog 将会一直存在。

```java
public class MainActivity extends AppCompatActivity implements View.OnClickListener{
    ...

    @Override
    public void onClick(View view) {
        switch(view.getId()) {
            case R.id.button:
                ProgressDialog progressDialog = new ProgressDialog(MainActivity.this);
                progressDialog.setTitle("This is ProgressDialog");
                progressDialog.setMessage("Loading...");
                progressDialog.setCancelable(true);
                progressDialog.show();
                break;
            default:
                break;
        }
    }
}
```