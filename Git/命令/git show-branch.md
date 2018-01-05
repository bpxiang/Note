# git show-branch

>当前开发分支简洁的单行摘要

```
$ git show-branch --more=10

[master] Convert to HTML
[master^] Initial contents of public_html
```

参数`—more=10`表示额外 10 个版本，但是因为只有两个版本，所以显示了两行（这种情况下，默认只列出最新的提交）。master 这个名字是默认的分支名。
