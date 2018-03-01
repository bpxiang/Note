# rpop 从列表右侧弹出
>time: 2018-03-01 14:43:30

```
rpop key
```

```
127.0.0.1:6379> lrange listkey 0 -1
1) "java"
2) "b"
3) "a"
127.0.0.1:6379> rpop listkey
"a"
127.0.0.1:6379> lrange listkey 0 -1
1) "java"
2) "b"
```