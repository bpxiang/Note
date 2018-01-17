# web.xml

```xml

<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://xmlns.jcp.org/xml/ns/javaee" xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_3_1.xsd" id="WebApp_ID" version="3.1">
  <display-name>MyData</display-name>
  <servlet>
  	<!-- Servlet 的名称 -->
    <servlet-name>spring</servlet-name>
    <!-- Servlet 对应的 Java 类 -->
    <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
    <!-- 当前 Servlet 的参数信息 -->
    <init-param>
    		<!-- contextConfigLocation 是参数名称，该参数的值包含 spring 的配置文件路径 -->
      <param-name>contextConfigLocation</param-name>
      <param-value>/WEB-INF/spring.xml</param-value>
    </init-param>
    <!-- 在 Web 应用启动时立即加载 Servlet -->
    <load-on-startup>1</load-on-startup>
  </servlet>
  <!-- Servlet 映射声明 -->
  <servlet-mapping>
  	<!-- 请求对应的 Servlet 的名称 -->
    <servlet-name>spring</servlet-name>
    <!-- 监听当前域的所有请求 -->
    <url-pattern>/</url-pattern>
  </servlet-mapping>
  <welcome-file-list>
    <welcome-file>index.html</welcome-file>
    <welcome-file>index.htm</welcome-file>
    <welcome-file>index.jsp</welcome-file>
    <welcome-file>default.html</welcome-file>
    <welcome-file>default.htm</welcome-file>
    <welcome-file>default.jsp</welcome-file>
  </welcome-file-list>
</web-app>
```
