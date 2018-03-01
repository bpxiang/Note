# hmset 批量设置 field-value
>time: 2018-02-28 17:54:54

```
hmset key field value [field value ...]
```
#### 例：
```
127.0.0.1:6379> hset user:2 name mike age 12 city tianjing
(integer) 3
```