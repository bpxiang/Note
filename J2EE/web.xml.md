# web.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://xmlns.jcp.org/xml/ns/javaee" xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_3_1.xsd" id="WebApp_ID" version="3.1">
	<display-name>Sync</display-name>
	<servlet>
		<servlet-name>HelloServlet</servlet-name>
		<servlet-class>bpx.com.servlet.HelloServlet</servlet-class>
		<init-param>
			<param-name>message</param-name>
			<param-value>welcome to FirstServlet</param-value>
		</init-param>
		<init-param>
			<param-name>encoding</param-name>
			<param-value>utf-8</param-value>
		</init-param>
		<load-on-startup>1</load-on-startup>
	</servlet>

	<servlet-mapping>
		<servlet-name>HelloServlet</servlet-name>
		<url-pattern>/servlet/HelloServlet</url-pattern>
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
## `<servlet>`

`<servlet>`与`</servlet>`分别为 Servlet 配置的开始标签与结束标签。中间部分就是一个 Servlet 的配置信息。其中`<servlet-name>`与`<servlet-class>`属性
是必须配置的。`<servlet-name>`配置 Servlet 的名称，`<servlet-class>`配置Servlet 的类名。`<servlet-name>`可以任意取字符串值，但是必须保证该名称在 web.xml 里唯一。该名称提供给其他的标签使用。

使用`<init-param>`标签可以配置一个初始化参数，包括一个参数名称（使用`<param-name`配置）与一个参数值（使用`<param-value>`）。一个 Servlet 可以配置多个初始化参数。上面代码中一共配置了两个初始化参数。Servlet 中可以使用方法 `getServletContext().getInitParam(String paramName)` 来取得配置的初始化参数。

标签`<load-on-startup>`配置该 Servlet 的加载方式。可选 0 和 1。如果配置为 1，Tomcat 会在启动时加载该 Servlet。否则，Tomcat 会在有人第一次请求该 Servlet 的时候才加载该 Servlet。实际项目中一些框架如 Struts、JSF、Spring 都使用该参数来预加载框架中最核心的 Servlet。

## `<servlet-mapping>`

`<servlet-name>`里配置 Severlet 名称。`<url-pattern>`配置该 Servlet 的访问方式。
`<url-pattern>`值前面加上 Web 应用程序的路径，在加上服务器域名端口信息就是访问该 Servlet 的网址。
`<url-pattern>`中允许使用通配符 “*” 与 “?”，“*” 代表任意长度的字符，“?” 代表任意字符。如果 `<url-pattern>` 路径配置为 `/servlet/FirstServlet.*`， 就使用 `http://localhost:8080/servlet/servlet/FirstServlet.xxx` 访问 FirstServlet。 xxx 表示任意文件类型后缀。 Struts、JSF 等框架技术中也使用了通配符映射，把形如 xxx.do，xxx.jspa 等格式的所有 URL 都映射到某个核心的 Servlet 上。

从 Java EE 5 起，`<servlet-mapping>` 标签就可以配置多个`<url-pattern>`，裂谷可以同时将 FirstServlet 配置以下多个映射方式：

```xml
<servlet-mapping>
	<servlet-name>FirstServlet</servlet-mapping>
	<url-pattern>/servlet/FirstServlet</url-pattern>
	<url-pattern>/servlet/FirstServlet.asp</url-pattern>
	<url-pattern>/servlet/FirstServlet.jsp</url-pattern>
	<url-pattern>/servlet/FirstServlet.php</url-pattern>
	<url-pattern>/servlet/FirstServlet.aspx</url-pattern>
</servlet-mapping>
```





















end
