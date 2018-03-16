# sunionstore 集合并集结果保存
>time: 2018-03-15 10:54:03

```
sunionstore destination key [key ...]
```
例：
```bash
127.0.0.1:6379> smembers user:1:follow
1) "music"
2) "it"
3) "his"
4) "sports"
127.0.0.1:6379> smembers user:2:follow
1) "news"
2) "it"
3) "ent"
4) "sports"
127.0.0.1:6379> sunionstore user:1_2:union user:1:follow user:2:follow
(integer) 6
127.0.0.1:6379> smembers user:1_2:union
1) "music"
2) "news"
3) "it"
4) "ent"
5) "his"
6) "sports"
```