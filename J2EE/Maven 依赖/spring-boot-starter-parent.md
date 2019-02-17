# spring-boot-starter-parent
>time: spring-boot-starter-parent

>提供相关的 Maven 默认依赖，使用它之后，常用的包依赖可以省去 version 标签，关于 Spring Boot 提供了那些 jar 包的依赖，可以查看 `~/.m2/repository/org/springframework/boot/spring-boot-dependencies/2.0.6.RELEASE/spring-boot-dependencies-2.0.6.RELEASE.pom` 文件中的声明。

```xml
<parent>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-parent</artifactId>
    <version>2.0.6.RELEASE</version>
    <relativePath/>
</parent>
```