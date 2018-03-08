# ltrim 按照索引范围修剪列表
>time: 2018-03-06 15:01:55

```
ltrim key start end
```
保留列表 listkey 第 2 个到第 4 个元素
```
127.0.0.1:6379> lrange listkey 0 -1
1) "a"
2) "java"
3) "b"
4) "a"
5) "c"
127.0.0.1:6379> ltrim listkey 1 3
OK
127.0.0.1:6379> lrange listkey 0 -1
1) "java"
2) "b"
3) "a"
```