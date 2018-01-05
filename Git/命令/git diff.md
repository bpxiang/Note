# git diff

>查看两个版本之间的差异
>git diff ID ID

```bash
$ git diff 3b6c8ced29e0bf0265c796098f411d94ec59948e 65d637eb4530dc1af876420a72d0214e4fab43b8
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
