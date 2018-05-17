# 树莓派安装 shadowsock-libev

## 安装 shadowsocks-libev
```
sudo apt-get install shadowsocks-libev
```

## /etc/shadowsocks-libev/client.json
```json
{
	"server":"***",
	"server_port":8989,
	"local_address":"0.0.0.0",
	"local_port":1080,
	"password":"***",
	"timeout":300,
	"method":"aes-256-cfb"
}
```

## 启动
```
sudo ss-redir -u -c /etc/shadowsocks-libev/client.json
```