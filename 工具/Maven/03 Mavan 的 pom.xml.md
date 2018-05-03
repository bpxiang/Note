# Mavan 的 pom.xml
>time: 2018-05-03 10:21:40  

Maven 是基于项目对象模型的概念运作的，所以 Maven 的项目都有衣蛾 `pom.xml` 用来管理项目的依赖以及项目的编译等功能。

## 1. dependencies 元素
`<dependencies></dependencies>`，此元素包含多个项目依赖需要使用得`<dependency></dependency>`。
## 2. dependency 元素
`<dependency></dependency>` 内部通过 groupId、artifactId 以及 version 确定唯一的依赖，有人称这三个为坐标。
* groupId：组织的唯一标识。
* artifactId：项目的唯一标识。
* version：项目的版本。
```xml
<dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-webmvc</artifactId>
    <version>4.3.10.RELEASE</version>
</dependency>
```

## 3. 变量定义
变量定义：`<properties></properties>` 可定义变量在 `dependency` 中引用。

```xml
<properties>
    <spring-framework.version>4.3.10.RELEASE</spring-framework.version>
</properties>

<dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-webmvc</artifactId>
    <version>${spring-framework.version}</version>
</dependency>
```

## 4. 编译插件
Maven 提供了编译插件，可在编译插件中涉及 Java 的编译级别。
```xml
<properties>
    <java.version>1.8</java.version>
</properties>


<build>
    <plugins>
        <plugin>
            <groupId>org.apache.maven.plugins</groupId>
            <artifactId>maven-compiler-plugin</artifactId>
            <version>2.3.2</version>
            <configuration>
                <source>${java.version}</source>
                <target>${java.version}</target>
            </configuration>
        </plugin>
    </plugins>
</build>
```


## 5. Maven 运作方式
Maven 会自动根据 dependency 中的以来配置，直接通过互联网在 Maven 中心库下载相关依赖包到 .m2 目录下，.m2 目录下是你本地地 Maven 库。

若 Maven 中心库中没有你需要的 jar 包（如 Oracle），你需要通过下面的 Maven 命令打到本地 Maven 库后应用即可，如安装 Oracle 驱动到本地库：
```shell
mvn install:install-file -DgroupId=com.oracle "-DartifactId=ojdbc14" "-Dversion=10.2.0.2.0" "-Dpackaging=jar" "-Dfile=D:\ojdbc14.jar"
```