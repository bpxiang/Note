# hset 设置值
>time: 2018-02-28 17:40:56

如果设置成功会返回 1，反之会返回 0。此外 Redis 提供了 hsetnx 命令，它们的关系就像 set 和 setnx 命令一样，只不过作用域由键变为 field。
```
hset key field value
```

#### 例：
```
127.0.0.1:6379> hset user:1 name tom
(integer) 1
```