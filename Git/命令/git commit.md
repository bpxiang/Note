# git commit
>key: 2017-11-29 16:33:28  
>除了目录和文件内容的实际变化，Git 还会在每次提交的时候记录其他一些元数据，包括日志消息和做出本次变化的作者。一条完全限定的 git commit 命令必须可以提供日志消息和作者。

```bash
git commit index.php -m "initial contents of public index.php"
[master (root-commit) 30a82d2] initial contents of public index.php
 1 file changed, 1 insertion(+)
 create mode 100644 index.php
```

完全限定的`git commit`命令必须提供日志消息和作者。

`git commit -m "Initial contents of public_html" --author="Puxiang Bu<bupuxiang@qq.com>"`

可以在命令行中提供一条日志消息，但是更经典的做法是在交互式编辑器会话期间创建消息。这样，你将能够在你最喜欢的的编辑器里编写一条完整而详细的日志消息。为了在`git commit`期间让 Git 打开你最爱的编辑器，要设置你的 GIT_EDITOR 环境变量

```bash
# 在 tcsh 中
$ setenv GIT_EDITOR emacs

# 在 bash 中
$ export GIT_EDITOR=vim
```