# setrange 设置指定位置的字符
>time: 2018-02-28 14:32:06

```
setrange key offset value
```

```
127.0.0.1:6379> set redis pest
OK
127.0.0.1:6379> setrange redis 0 b
(integer) 4
127.0.0.1:6379> get redis
"best"
127.0.0.1:6379> setrange redis 0 bpx
(integer) 4
127.0.0.1:6379> get redis
"bpxt"
```