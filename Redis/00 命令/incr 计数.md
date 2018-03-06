# incr 计数
>time: 2018-02-28 14:09:18

```
incr key
```

incr 命令用于对值做自增操作，返回结果分为三种情况：
1. 值不是整数，返回错误
1. 值是整数，返回自增后的结果
1. 键不存在，按照值为 0 自增，返回结果为 1

## decr (自减)、incrby (自增指定数字)、decrby (自减指定数字)

```
decr key
incrby key increment
decrby key decrement
incrbyfloat key increment
```

很多存储系统和编程语言内部使用 CAS 机制实现计数功能，会有一定的 CPU 开销，但在 Redis 中完全不存在这个问题，因为 Redis 是单线程架构，任何命令到了 Redis 服务端都要顺序执行。



