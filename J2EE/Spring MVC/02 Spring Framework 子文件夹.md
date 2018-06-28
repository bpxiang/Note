# Spring Framework 子文件夹

* docs。该文件夹下存放 Spring 的相关文档，包含开发指南、API 参考文档。
* libs。该文件夹下的 JAR 分为三类：1）Spring 框架 class 文件的 JAR 包；2）Spring 框架源文件的压缩包，文件名以 -source 结尾；3）Spring 框架 API 文档压缩包，文件名以 -javadoc 结尾。
* schemas。该文件下包含了 Spring 各种配置文件的 XML Schema 文档。
* readme.txt、notice.txt、license.txt 等说明性文档。

Spring 的核心容器必须依赖于 common-logging 的 JAR 包。

默认情况下，应用会去应用程序文件夹的 WEB-INF 下查找对应的 `[servlet-name]-servlet.xml` 文件，例如 `<servlet-name>` 是 `springmvc`，默认查找的就是 `/WEB-INF/springmvc-servlet.xml`。

也可以把 Spring MVC 的配置文件放到应用程序文件夹中的任何地方，用 servlet 元素的 init-param 子元素进行描述。例如 param-name 元素的值 contextConfigLocation 表示参数名称，param-value 元素值 `/WEB-INF/springmvc-config.xml` 则表示 Spring MVC 的配置文件路径和名称。则 DispatcherServlet 会查找 `/WEB-INF/springmvc-config.xml` 文件，作为 Sprint MVC 的配置文件，解析该文件内容并根据文件配置信息创建一个 WebApplicationContext 容器对象，也称为上下文环境。
