# adb 调试

## 电脑端
```bash
adb connect ip:port 
```

## 手机端
```bash
su //获取root权限  
setprop service.adb.tcp.port 5555 //设置监听的端口，端口可以自定义，如5554，5555是默认的
stop adbd //关闭adbd  
start adbd //重新启动adbd  
```