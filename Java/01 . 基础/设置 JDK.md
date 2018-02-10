# 设置 JDK
>key: 2017-11-15 17:36:33  
>keyword: JDK

* 在 Windows 上，启动安装程序。会询问你要在哪里安装 JDK。最好不要接受路径名中包含空格的默认位置，如 `c:\Proram File\Java\jdk1.8.0_version`。取出路径名中的`Program File`部分就可以了。
* 在 Mac 上，运行安装程序。这会把软件安装到` Library/Java/JavaVirtualMachines/jdk1.8.0_version.jdk/Contents/Home`
* 在 Linux 上，只需要把 .tar.gz 文件解压缩到你选择的摸个位置，如你的主目录，或者 /opt。如果从 PRM 文件安装，则要反复检查是否安装在 `usr/java/jdk1.8.0_version`。

在 Windows 或 Linux 上安装 JDK 时，还需要另外完成一个步骤: 将`jdk/bin`目录增加到执行路径中——执行路径是操作系统查找可执行文件时所遍历的目录列表。

* 在 Linux 上，需要 `~/.bashrc` 或 `~/.bash_profile` 文件的最后增加这样一行: `export PATH=jak/bin:$PATH`
* 在 Windows 上，滚动“系统变量”（System Variables）列表，直到找到名为 Path 的变量。点击“编辑”（Edit）按钮。将 `jdk\bin` 目录增加到路径最前面，并用一个分号分隔新增的这一项，如下所示: `jdk\bin;other stuff`
