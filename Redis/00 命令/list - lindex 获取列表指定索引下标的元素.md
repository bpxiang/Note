# lindex 获取列表指定索引下标的元素
>time: 2018-03-01 14:35:47

```
127.0.0.1:6379> lrange listkey 0 -1
1) "c"
2) "java"
3) "b"
4) "a"
127.0.0.1:6379> lindex listkey 1
"java"
```