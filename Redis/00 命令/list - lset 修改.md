# lset 修改
>time: 2018-03-06 15:08:00

```
lset key index newValue
```

修改列表 listkey 中的第 3 个元素设置为 python：
```
127.0.0.1:6379> lrange listkey 0 -1
1) "java"
2) "b"
3) "a"
127.0.0.1:6379> lset listkey 2 python
OK
127.0.0.1:6379> lrange listkey 0 -1
1) "java"
2) "b"
3) "python"
```