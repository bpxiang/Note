# sdiff 求集合的差集
>time: 2018-03-13 11:20:39

```
sdiff key [key ...]
```
求 `user:2:follow` 和 `user:2:follow` 两个集合的差集。
```bash
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
127.0.0.1:6379> sdiff user:1:follow user:2:follow
1) "music"
2) "his"
127.0.0.1:6379> sdiff user:2:follow user:1:follow
1) "ent"
2) "news"
```