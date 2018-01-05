## 设置route命令
代码如下:

```
route -n add defalut  10.13.31.1
route -n add -net 10.0.0.0/8  10.13.31.1
route -n add -net 210.32.0.0/20   10.13.31.1
route -n add -net 222.205.0.0/17 10.13.31.1
```

提示路由存在时可以通过下面方法删除后再添加,代码如下
```
route -n delete defalut  10.13.31.1
```

## 查看路由(route)
很简单的，一条命令就能查看,代码如下:
```
netstat –nr
```

## 设置DNS命令
代码如下:
```
networksetup -listallnetworkservices
```

## 得到所有接口（interfaces）.
代码如下:
```
networksetup -setdnsservers {INTERFACE NAME} {YOUR DNS SERVER}
```

## 设置DNS.
代码如下
```
networksetup -setdnsservers {INTERFACE NAME} {YOUR DNS SERVER} {YOUR DNS SERVER}
```

如果有多个DNS，那么用空格隔开。

之后就可以用ifconfig查看修改了。

 一直都没有找到mac命令行配置DNS的方法

今日特别发现，记录下：

列出所有的网络连接方式

 代码如下

networksetup -listallnetworkservices


给指定的网络连接方式设定DNS服务器

 代码如下

sudo networksetup -setdnsservers AirPort 192.168.10.200


清空DNS缓存

 代码如下 复制代码

dscacheutil –flushcache
