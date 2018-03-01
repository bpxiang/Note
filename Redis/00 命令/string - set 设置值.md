# set 设置 string 值
>time: 2018-02-27 14:19:06

```
set key value [ex seconds] [px milliseconds] [nx|xx]
```

* ex seconds： 为键设置秒级过期时间。
* px milliseconds： 为键设置毫秒级过期时间。
* nx：键必须不存在，才可以设置成功，用于添加。
* xx： 与 nx 相反，键必须存在，才可以设置成功，用于更新。

除了 set 选项，Redis 还提供了 setex 和 setnx 两个命令：
```
setex key seconds value
setnx key value
```


当前 键 hello 不存在：
```
127.0.0.1:6379> exists hello
(integer) 0
```

设置键为 hello， 值为 world 的键值对：
```
127.0.0.1:6379> set hello world
OK
```

因为键 hello 已存在， 所以 setnx 失败， 返回结果为 0：
```
127.0.0.1:6379> setnx hello redis
(integer) 0
```

因为键 hello 已存在， 所以 set xx 成功， 返回结果为 OK：
```
127.0.0.1:6379> set hello jedis xx
OK
```

setnx 和 setxx 在实际使用中有什么应用场景吗？以 setnx 命令为例子，由于 Redis 的单线程命令处理机制，如果有多个客户端同时执行 `setnx key value`，根据 setnx 的特性只有一个客户端能设置成功，setnx 可以作为分布式锁的一种实现方案，Redis 官方给出了使用 setnx 实现分布式锁的方法：http://redis.io/topics/distlock。