# webpack-dev-server
>time: 2018-01-31 15:56:14  

## 安装命令
```bash
npm install --save-dev webpack-dev-server
```

## 自动刷新命令
```bash
webpack-dev-server --hot --inline 
```

webpack-dev-server 的默认端口号是8080。

## webpack-dev-server有以下可选参数：

 

* --content-base //设定webpack-dev-server的director根目录。如果不进行设定的话，默认是在当前目录下。
* --quiet: //控制台中不输出打包的信息，开发中一般设置为false，进行 打印，这样查看错误比较方面
* --no-info: // 不显示任何信息
* --colors: //对信息进行颜色输出
* --no-colors: //对信息不进行颜色输出
* --compress: //开启gzip压缩
* --host <hostname/ip>: //设置ip
* --port <number>: //设置端口号，默认是:8080
* --inline: //webpack-dev-server会在你的webpack.config.js的入口配置文件中再添加一个入口,
* --hot: //开发热替换
* --open: //启动命令，自动打开浏览器
* --history-api-fallback: //查看历史url



