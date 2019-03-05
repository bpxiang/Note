# mvn package

mvn package: 编译并打包工程，根据 `pox.xml` 中元素 packaging 是 jar 还是 war 进行打包，会在 target 目录下生成一个 jar 或 war 包。

```bash
mvn package

[INFO]
[INFO] --- maven-jar-plugin:3.1.0:jar (default-jar) @ test-boot-2 ---
[INFO] Building jar: D:\Workplace\J2EE\test-boot-2\target\test-boot-2-0.0.1-SNAPSHOT.jar
[INFO]
[INFO] --- spring-boot-maven-plugin:2.1.0.RELEASE:repackage (repackage) @ test-boot-2 ---

[INFO] Replacing main artifact D:\Workplace\J2EE\test-boot-2\target\test-boot-2-0.0.1-SNAPSHOT.jar
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time: 03:34 min
[INFO] Finished at: 2018-12-05T15:18:06+08:00
[INFO] ------------------------------------------------------------------------
```

