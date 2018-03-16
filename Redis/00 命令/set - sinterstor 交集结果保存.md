# sinterstore 交集结果保存
>time: 2018-03-15 10:47:48

```
sinterstore destincation key [key ...]
```
例：
```
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
127.0.0.1:6379> sinterstore user:1_2:inter user:1:follow user:2:follow
(integer) 2
127.0.0.1:6379> smembers user:1_2:inter
1) "it"
2) "sports"
```