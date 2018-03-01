# lrem 删除指定元素
>time: lrem 删除指定元素

```
lrem key count value
```

lrem 命令会从列表中找到等于 value 的元素进行删除，根据 count 的不同分为三种情况：
1. `count>0`，从左到右，删除最多 count 个元素
1. `count<0`，从右到左，删除最多 count 绝对值个元素
1. `count=0`，删除所有

```
127.0.0.1:6379> lrange listkey 0 -1
1) "a"
2) "a"
3) "a"
4) "a"
5) "a"
6) "java"
7) "b"
127.0.0.1:6379> lrem listkey 4 a
(integer) 4
127.0.0.1:6379> lrange listkey 0 -1
1) "a"
2) "java"
3) "b"
```