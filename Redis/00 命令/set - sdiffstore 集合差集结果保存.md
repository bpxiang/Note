# sdiffstore 集合差集结果保存
>time: 2018-03-15 10:58:24

```
sdiffstore destination key [key ...]
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
127.0.0.1:6379> sdiffstore user:1_2:diff user:1:follow user:2:follow 
(integer) 2
127.0.0.1:6379> smembers user:1_2:diff
1) "music"
2) "his"
```