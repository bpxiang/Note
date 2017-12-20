# 使用 mksdcard 管理虚拟 sk 卡
>time: 2017-12-19 16:31:30

正如前面在 Android SDK 和 AVD 管理器中所见到的，我们可以在创建 AVD 设备时创建一个虚拟 SD 卡。实际上还可以使用 mksdcard 命令来单独创建一个虚拟存储卡。

mksdcard 命令的语法格式如下：  
`mksdcard [-l lable] <size> <file>`

上面的命令格式中 `<size>` 制定虚拟 SD 卡的大小，`<file>` 制定保存虚拟 SD 卡的文件镜像。例如如下命令：
```
mksdcard 64M D:\advs\.android\avd\leegang.avd\sdcard.img
```
上面命令创建了一个大小为 64MB 的虚拟 SD 卡，该 SD 卡对应的镜像文件为 `D:\advs\.android\avd\leegang.avd\sdcard.img`。

如果希望在启动模拟器时使用制定的虚拟 SD 卡，则在启动模拟器时增加 `-sdcard <file>` 选项，其中 `<file>` 代表虚拟 SD 卡的文件镜像。例如如下命令：
```bash
emulator -avd crazyit -sdcard d:\sdcard.img
```