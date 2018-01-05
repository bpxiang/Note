# 开启Linux 路由转发功能
如何使用iptables的NAT功能把红帽企业版Linux作为一台路由器使用？

方法:

提示: 以下方法只适用于红帽企业版Linux 3 以上。

1. 打开包转发功能:
`echo "1" > /proc/sys/net/ipv4/ip_forward`

1. 修改/etc/sysctl.conf文件，让包转发功能在系统启动时自动生效:
`# Controls IP packet forwarding`
`net.ipv4.ip_forward = 1`

1. 打开iptables的NAT功能:
`/sbin/iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE`
说明：上面的语句中eth0是连接外网或者连接Internet的网卡. 执行下面的命令，保存iptables的规则: service iptables save

1. 查看路由表:
`netstat -rn 或   route -n`

1. 查看iptables规则:
`iptables -L`
