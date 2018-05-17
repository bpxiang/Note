# 安装 shadowsocks-libev
>time: 2018-05-17 14:56:08

## 配置文件

```
vim /etc/shadowsocks-libev/redir.json

{
    "server":"<server_ip>",
    "server_port":8388,
    "local_address":"0.0.0.0",
    "local_port":7777,
    "password":"<server_password>",
    "timeout":600,
    "method":"aes-256-cfb"
}
```

启动：

```
ss-redir -u -c /etc/shadowsocks-libev/redir.json
```

## 设置路由表

```
# Create new chain
iptables -t nat -N SHADOWSOCKS

# Ignore your shadowsocks server's addresses
# It's very IMPORTANT, just be careful.
iptables -t nat -A SHADOWSOCKS -d [SS_SERVER_IP] -j RETURN

# Ignore LANs and any other addresses you'd like to bypass the proxy
# See Wikipedia and RFC5735 for full list of reserved networks.
# See ashi009/bestroutetb for a highly optimized CHN route list.
iptables -t nat -A SHADOWSOCKS -d 0.0.0.0/8 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 10.0.0.0/8 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 127.0.0.0/8 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 169.254.0.0/16 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 172.16.0.0/12 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 192.168.0.0/16 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 224.0.0.0/4 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 240.0.0.0/4 -j RETURN

# China IPs
curl http://ftp.apnic.net/apnic/stats/apnic/delegated-apnic-latest | grep 'apnic|CN|ipv4' | awk -F\| '{ printf("iptables -t nat -A SHADOWSOCKS -d %s/%d -j RETURN\n", $4, 32-log($5)/log(2)) }' > cn_rules.conf
sh cn_rules.conf

# Anything else should be redirected to shadowsocks's local port
iptables -t nat -A SHADOWSOCKS -p tcp -j REDIRECT --to-port 7777

# SNAT
iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -j MASQUERADE

# Apply the rules
iptables -t nat -A PREROUTING -p tcp -j SHADOWSOCKS
iptables -t nat -A OUTPUT -p tcp -j SHADOWSOCKS
```

## 安装成systemd service

```
vim /etc/systemd/system/ss-redir.service

[Unit]
Description=Shadowsocks Redir Client
After=network.target

[Service]
Type=forking
PIDFile=/run/shadowsocks/redir.pid
PermissionsStartOnly=true
ExecStartPre=/bin/mkdir -p /run/shadowsocks
ExecStart=/usr/local/bin/ss-redir -u -f /var/run/shadowsocks/redir.pid -c /etc/shadowsocks-libev/redir.json
Restart=on-abort
UMask=0027

[Install]
WantedBy=multi-user.target
```