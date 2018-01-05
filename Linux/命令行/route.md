# linux route命令的使用详解

>route命令用于显示和操作IP路由表。要实现两个不同的子网之间的通信，需要一台连接两个网络的路由器，或者同时位于两个网络的网关来实现。在Linux系统中，设置路由通常是 为了解决以下问题：该Linux系统在一个局域网中，局域网中有一个网关，能够让机器访问Internet，那么就需要将这台机器的IP地址设置为 Linux机器的默认路由。要注意的是，直接在命令行下执行route命令来添加路由，不会永久保存，当网卡重启或者机器重启之后，该路由就失效了；要想永久保存，有如下方法：

1. 在/etc/rc.local里添加
2. 在/etc/sysconfig/network里添加到末尾
3. /etc/sysconfig/static-router : `any net x.x.x.x/24 gw y.y.y.y`

格式：`route`
格式：`/sbin/route`
用于打印路由表（display the current routing table）。

在非root用户使用时需要使用完整路径执行route命令。
