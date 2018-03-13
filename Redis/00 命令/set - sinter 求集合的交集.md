# sinter 求集合的交集
>time: 2018-03-13 11:11:04

```
sinter key [kye ...]
```

求 `user:1:follow` 和 `user:2:follow` 的交集。
```
127.0.0.1:6379> smembers user:1:follow
1) "it"
2) "sports"
3) "his"
4) "music"
127.0.0.1:6379> smembers user:2:follow
1) "ent"
2) "it"
3) "sports"
4) "news"
127.0.0.1:6379> sinter user:1:follow user:2:follow
1) "it"
2) "sports"
```