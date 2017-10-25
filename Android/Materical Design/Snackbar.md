# Snackbar

Snackbar 允许在提示中加入一个可交互按钮，当用户点击按钮的时候可以执行一些额外的逻辑操作。

Snackbar 不是 Toast 的替代品，它们两者之间有着不同的应用场景。Toast 的作用时告诉用户现在发生了什么事情，但同时用户只能被动接收这个事情，因为没有什么办法能让用户进行选择。

```java
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
```