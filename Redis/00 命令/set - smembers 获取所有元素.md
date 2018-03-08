# smembers 获取所有元素
>time: 2018-03-08 16:02:46

```
smembers key
```
返回的结果是无序的：
```
127.0.0.1:6379> sadd myset a b c
(integer) 3
127.0.0.1:6379> smembers myset
1) "c"
2) "b"
3) "a"
```

smembers 和 lrange、hgetall 都属于比较重的命令，如果元素过多存在阻塞 Redis 的可能性，这时候可以使用 sscan 来完成。