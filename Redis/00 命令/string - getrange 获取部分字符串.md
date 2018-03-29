# getrange 获取部分字符串
>time: 2018-02-28 14:35:57

```
getrange key start end
```

start 和 end 分别是开始和结束的偏移量，偏移量从 0 开始计算。
```
127.0.0.1:6379> get redis
"best"
127.0.0.1:6379> getrange redis 0 1
"be"
```