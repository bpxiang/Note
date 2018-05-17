# ss-redir 全局透明代理
>time: 2018-05-17 14:54:54 

```bash
cd
# 获取大陆ip地址段
curl -sL http://f.ip.cn/rt/chnroutes.txt | egrep -v '^$|^#' > chnroutes

# ipset
sudo apt-get -y install ipset

sudo ipset -N chnroutes hash:net
for i in `cat chnroutes`; do echo ipset -A chnroutes $i >> ipset.sh; done
chmod +x ipset.sh && ./ipset.sh

# 持久化 ipset 地址列表至文件
sudo ipset save chnroutes > ~/chnroutes.ipset
# 从文件恢复到 ipset
sudo ipset destroy chnroutes
sudo ipset restore < ~/chnroutes.ipset

# 新建一条链 shadowsocks
sudo iptables -t nat -N shadowsocks

# 保留地址、私有地址、回环地址 不走代理
sudo iptables -t nat -A shadowsocks -d 0.0.0.0/8 -j RETURN
sudo iptables -t nat -A shadowsocks -d 10.0.0.0/8 -j RETURN
sudo iptables -t nat -A shadowsocks -d 127.0.0.0/8 -j RETURN
sudo iptables -t nat -A shadowsocks -d 169.254.0.0/16 -j RETURN
sudo iptables -t nat -A shadowsocks -d 172.16.0.0/12 -j RETURN
sudo iptables -t nat -A shadowsocks -d 192.168.0.0/16 -j RETURN
sudo iptables -t nat -A shadowsocks -d 224.0.0.0/4 -j RETURN
sudo iptables -t nat -A shadowsocks -d 240.0.0.0/4 -j RETURN

# 1234 是 ss 代理服务器的端口，即远程 shadowsocks 服务器提供服务的端口
# 如果你有多个 ip 可用,但端口一致，就设置这个
sudo iptables -t nat -A shadowsocks -p tcp --dport 1234 -j RETURN

# your_server 是 ss 代理服务器的 ip
# 如果你只有一个 ss 服务器的 ip，却能选择不同端口,就设置此条
sudo iptables -t nat -A shadowsocks -d your_server -j RETURN

# 大陆地址不走代理
sudo iptables -t nat -A shadowsocks -m set --match-set chnroutes dst -j RETURN

# 其余的全部重定向至 ss-redir 监听端口
sudo iptables -t nat -A shadowsocks -p tcp -j REDIRECT --to-ports 1080

# OUTPUT 和 PREROUTING 链添加一条规则，重定向至 shadowsocks 链
sudo iptables -t nat -A OUTPUT -p tcp -j shadowsocks
sudo iptables -t nat -I PREROUTING -p tcp -j shadowsocks

# 持久化 iptables 规则到文件
sudo iptables-save > ~/iptables.shadowsocks
# 从文件恢复到 iptables
sudo iptables-restore < ~/iptables.shadowsocks
```