查看当前机器的路由表：`route -n`

```
sudo route del default gw 192.168.168.100
sudo route add -net 192.168.122.0 netmask 255.255.254.0  gw 192.168.168.168 dev eth0


sudo route del -net 192.168.122.0 netmask 255.255.254.0 gw 192.168.168.168 dev eth0
```
