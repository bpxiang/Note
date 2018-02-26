# 查看键剩余时间
>time: 2018-02-26 15:02:19  

ttl 命令会返回键的剩余过期时间，它有 3 种返回值：
* 大于等于 0 的整数：键剩余的过期时间。
* -1：键没设置过期时间。
* -2：键不存在

```bash
127.0.0.1:6379> get hello
"world"
127.0.0.1:6379> ttl hello
(integer) -1
127.0.0.1:6379> expire hello 10
(integer) 1
# 还剩 7 秒
127.0.0.1:6379> ttl hello
(integer) 7
127.0.0.1:6379> ttl hello
# 还剩 5 秒
(integer) 5
127.0.0.1:6379> ttl hello
(integer) 0
127.0.0.1:6379> ttl hello
(integer) -2
127.0.0.1:6379> get hello
(nil)
```