# git commit
>key: 2017-11-29 16:33:28  
>除了目录和文件内容的实际变化，Git 还会在每次提交的时候记录其他一些元数据，包括日志消息和做出本次变化的作者。一条完全限定的 git commit 命令必须可以提供日志消息和作者。

```bash
git commit index.php -m "initial contents of public index.php"
[master (root-commit) 30a82d2] initial contents of public index.php
 1 file changed, 1 insertion(+)
 create mode 100644 index.php
```
