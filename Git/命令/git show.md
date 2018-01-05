# git show [提交码]
>查看特定提交的更加详细的信息。如果在执行 `git show` 命令的时候没有显式指定提交码，它将只显示最近一次提交的详细信息

```
$ git show 65d637eb4530dc1af876420a72d0214e4fab43b8
commit 65d637eb4530dc1af876420a72d0214e4fab43b8
Author: “Puxiang <“bupuxiang@qq.com”>
Date:   Sat Jun 24 17:48:21 2017 +0800

    Convert to HTML

diff --git a/index.html b/index.html
index 34217e9..fac83b4 100644
--- a/index.html
+++ b/index.html
@@ -1 +1,5 @@
-My website is alive!
+<html>
+       <body>
+       My website is alive!
+       </body>
+</html>

```
