# man page
>time: 2017-12-05 15:44:33  
>显示命令的说明内容。

man 是 manual(操作说明) 的简写。只要执行 "man command" 马上就会有清楚的命令说明出现。

## $ man date
```
DATE(1)                   BSD General Commands Manual                  DATE(1)

NAME
     date -- display or set date and time

SYNOPSIS
     date [-jRu] [-r seconds | filename] [-v [+|-]val[ymwdHMS]] ... [+output_fmt]
     date [-jnu] [[[mm]dd]HH]MM[[cc]yy][.ss]
     date [-jnRu] -f input_fmt new_date [+output_fmt]
     date [-d dst] [-t minutes_west]

DESCRIPTION

```

## “DATE(1) ”，DATE 是命令的名称，(1) 代表？
| 代号 | 代表内容 |
| --- | --- |
| 1 | 用户在 shell 环境中可以操作的命令或可执行文件 |
| 2 | 系统内核可调用的函数与工具等 |
| 3 | 一些常用的函数（function）与函数库（library），大部分为 C 的函数库（libc） |
| 4 | 设备文件的说明，通常在 /dev 下的文件 |
| 5 | 设备文件或者是某些文件的格式 |
| 6| 游戏（games） |
| 7 | 惯例与协议等，例如 Linux 文件系统，网络协议、ASCll code 等说明 |
| 8 | 系统管理员可用的管理命令 |
| 9 | 跟 kernel 有关的文件 |

## man page 大致分成下面几个部分

| 代号 | 内容说明 |
| --- | --- |
| NAME | 简短的命令，数据名称说明 |
| SYNOPSIS | 简短的命令执行语法（syntax） 简介 |
| DESCRIPTION | 较为完整的说明，这部分最好仔细看看 |
| OPTIONS | 针对 SYNOPSIS 部分中，有列举的所有可用的选项说明 |
| COMMANDS | 当这个程序（软件）在执行的时候，可以在此程序（软件）中执行命令 |
| FILES | 这个程序或数据所使用或参考或链接到的某些文件 |
| SEE ALSO | 这个命令或数据有相关的其他说明 |
| EXAMPLE | 一些可以参考的范例 |
| BUGS | 是否有相关的错误 |

## man page 中常用按键

| 按键 | 进行工作 |
| --- | --- |
| 空格键 | 向下翻一页 |
| [Page Down] | 向下翻一页 |
| [Page Up] | 向上翻一页 |
| [Home] | 去到第一页 |
| [End] | 去到最后一页 |
| /string | 向下查询 string 字符串，如果要查询 vbird 的话，就输入 /vbird |
| ?string | 向上查询 string 字符串 |
| n,N | 利用 / 或 ? 来查询字符串时，可以用 n 来继续下一个查询（不论是 / 或 ?），可以利用 N 来进行反向查询。举例来说，我以 /bpx 查询 bpx 字符串，那么可以 n 继续往下查询，用 N 往上查询。若以 ?bpx 向上查询 bpx 字符串，那我可以用 n 继续向上查询，用 N 反向查询 |
| q | 结束这次的 man page |

有 man page，是因为有一些文件数据，所以才能够以 man page 读出来。这些文件数据通常放在 `/usr/share/man` 这个目录里。我们可以通过修改 man page 查询路径，修改 `/etc/man.config` (有的版本为 man.conf 或 manpath.conf).

## 查询跟 `man` 有关的说明文件
```
$ man -f man
groff_man(7)             - groff `man' macros to support generation of man pages
groffer(1)               - display groff files and man~pages on X and tty
man(1)                   - format and display the on-line manual pages
man.conf(5)              - configuration data for man
zshall(1)                - the Z shell meta-man page
```

```
man 1 man <== 这里是用 man(1) 的文件数据
man 5 man.conf <== 这里是用 man.conf(5) 的文件数据
```

```
man -k man # 在系统的说明文件中，只要有 man 这个关键字就将该说明列出来
whatis [命令或者是数据] <== 相当于 man -f [命令或者是数据]
apropos [命令或者数据 ] <== 相当于 man -k [命令或者是数据] 
```

要想使用 whatis、apropos 命令，必须创建 whatis 数据库，创建数据库需要以 root 的身份执行如下命令：
```
makewhatis
```