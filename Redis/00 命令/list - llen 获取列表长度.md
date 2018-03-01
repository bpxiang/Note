# llen 获取列表长度
>time: 2018-03-01 14:37:13
```
llen key
```

```
127.0.0.1:6379> lrange listkey 0 -1
1) "c"
2) "java"
3) "b"
4) "a"
127.0.0.1:6379> llen listkey
(integer) 4
```