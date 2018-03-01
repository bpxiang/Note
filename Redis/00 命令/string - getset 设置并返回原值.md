## getset 设置并返回原值
```
getset key value
```

getset 和 set 一样会设置值，但是不同的是，它同时会返回键的原来值。
```
127.0.0.1:6379> getset hello world
(nil)
127.0.0.1:6379> getset hello redis
"world"
```