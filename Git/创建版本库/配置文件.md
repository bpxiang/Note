## git config

Git 的配置文件都是简单的 `.ini`文件风格的文本文件。它们记录了很多 Git 命令使用的各种选项和设置。有的设置表示纯个人偏好（否则要用到 color.parer？）；有些则是对版本库的正常运作非常重要的（如 core.repositoryformatversion）;再之外的一些设置会稍微改变命令的行为（如 gc.auto）。

和很多工具一样，Git 支持不同层次的配置文件。按照优先级递减的顺序，它们如下所示。
* .git/config
>版本库特定的配置设置，可用`--file`选项修改，是默认选项。这些设置拥有最高优先级。
* ~/.gitconfig
>用户特定的配置设置，可用`--global`选项修改（Windows 下是 %USERPROFILE%/.gitconfig）
* /etc/gitconfig
>这是系统范围内的配置设置，如果你有它的 UNIX 文件写权限，你就可以用 `--system`选项修改它。这些设置的优先级最低。根据你的实际安装情况，这个系统设置文件可能在其他位置（也许在 /usr/local/etc/gitcofig），也可能完全不存在。


要建立一个作者名盒 email 地址，用于你对所有版本库的所有提交，可以用 `git config --global`	命令给在 $HOME/.gitconfig 文件里的 user.name 和 user.email 赋值。
```
$ git config --global user.name "Jon Loeliger"
$ git config --global user.email "jdl@example.com"
```

或者，为了设置一个版本库特定的名字和 email 地址，覆盖 --global 的设置，只需要省略 --global 标志。
```
$ git config user.name "Jon Loeliger"
$ git config user.email "jdl@special-project.example.org"
```

## git config -l
>使用 `git config -l`列出在整组配置文件里共同查找的所有变量的设置值。

查看版本库特定设置
```
$ cat .git/config
```

查看用户特定配置
```
$ cat ~/.gitconfig
```
## -unset
>移除设置

```
git config --unset --global user.email
```

多个配置选项和环境变量常常是为了同一个目的的出现的。例如，在编写提交日志消息的时候，编辑器的选择按照以下步骤的顺序确定：
* GIT_EDITOR 环境变量；
* core.editor 配置选项
* VISUAL 环境变量；
* EDITOR 环境变量
* vi 命令

## 配置别名

对于初学者来说，这有一个设置命令别名的提示。如果你经常输入一条常用而复杂的 Git 命令，可以考虑为它设置一个简单的 Git 别名。
```
$ git config --global alias.show-graph 'log --graph --abbrev-commit --pretty=oneline'
```