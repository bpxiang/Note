# git log
>git log 命令会产生版本库里一系列单独提交的历史

条目按照从最新的到最老的顺序罗列出来（严格来说，它们不是按照时间顺序，而是提交的拓扑顺序排列）；每个条目显示了提交作者的名字和 email 地址，提交日期，变更的日志和提交的内部识别码。

```
$ git log
commit 65d637eb4530dc1af876420a72d0214e4fab43b8
Author: “Puxiang <“bupuxiang@qq.com”>
Date:   Sat Jun 24 17:48:21 2017 +0800

    Convert to HTML

commit 3b6c8ced29e0bf0265c796098f411d94ec59948e
Author: Puxiang Bu <bupuxiang@qq.com>
Date:   Sat Jun 24 12:10:42 2017 +0800

    Initial contents of public_html
```
