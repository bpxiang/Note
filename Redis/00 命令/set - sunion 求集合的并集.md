# sunion 求集合的并集
>time: 2018-03-13 11:15:37
```
sunion key [key ...]
```
求 `user:1:follow` 和 `user:2:follow` 两个集合的并集。
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
127.0.0.1:6379> sunion user:1:follow user:2:follow
1) "music"
2) "it"
3) "ent"
4) "sports"
5) "news"
6) "his"
```