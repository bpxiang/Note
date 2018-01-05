# centos7安装httpd服务

## 安装httpd服务

apache在centos7中是Apache HTTP server。如下对httpd的解释就是Apache HTTP Server。所以想安装apache其实是要安装httpd。  
`httpd.x86_64 : Apache HTTP Server`

安装：
```
# yum install httpd
```

设置httpd服务开机启动

```
# /sbin/chkconfig httpd on
```

启动httpd服务

```
# /sbin/service httpd start
```

## 配置
```
# cd /etc/httpd/
# ls
conf  conf.d  conf.modules.d  logs  modules  run
```

主配置文件是`/etc/httpd/conf/httpd.conf`。

配置存储在的`/etc/httpd/conf.d/`目录。

## 主配置文件
看一下主配置文件httpd.conf里有用的配置项
```
#服务器根目录
ServerRoot "/etc/httpd"

#端口
#Listen 12.34.56.78:80
Listen 80

#域名+端口来标识服务器，没有域名用ip也可以
#ServerName www.example.com:80

#不许访问根目录
<Directory />
    AllowOverride none
    Require all denied
</Directory>

# 文档目录
DocumentRoot "/var/www/html"

# 对 /var/www目录访问限制
<Directory "/var/www">
    AllowOverride None
    # Allow open access:
    Require all granted
</Directory>

# 对/var/www/html目录访问限制
<Directory "/var/www/html">
　　 Options Indexes FollowSymLinks
　　 AllowOverride None
 　　Require all granted
</Directory>

# 默认编码
AddDefaultCharset UTF-8

#EnableMMAP off
EnableSendfile on

# include进来其它配置文件

IncludeOptional conf.d/*.conf
```
