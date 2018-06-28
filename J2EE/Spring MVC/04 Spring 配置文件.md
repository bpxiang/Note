# Spring 配置文件

处理器映射器 BeanNameUrlHandlerMapping，这样可以 Bean 的名称为 url 进行查找；

处理器适配器 SimpleControllerHandlerAdapter，来完成对 HelloController 类的 handleRequest 方法的调用；

视图解析器 InternalResourceViewResolve 解析视图，将 View 呈现给用户。

在 Spring 4.0 之后，如果不配置处理器映射、处理适配器和视图解析器，也会默认完成 Spring 内部 MVC 工作。


## spring.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!-- 使用注解 -->
<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:mvc="http://www.springframework.org/schema/mvc"
	xmlns:context="http://www.springframework.org/schema/context"
	xsi:schemaLocation="
		http://www.springframework.org/schema/beans
		http://www.springframework.org/schema/beans/spring-beans-4.3.xsd
		http://www.springframework.org/schema/mvc
		http://www.springframework.org/schema/mvc/spring-mvc-4.3.xsd
		http://www.springframework.org/schema/context
		http://www.springframework.org/schema/context/spring-context-4.3.xsd">
	<!-- spring 可以自动去扫描 base-apcage 下面的包或者子包下面的 Java 文件 -->
	<context:component-scan base-package="com.bpx.controller"/>
	<!-- 配置 annotation 类型的处理器映射 -->
	<bean class="org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping"/>
	<!-- 配置 annotation 类型的处理器适配器 -->
	<bean class="org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter"/>
	<!-- 视图解析器 -->
	<bean class="org.springframework.web.servlet.view.InternalResourceViewResolver"></bean>
</beans>
```


使用`<context:component-scan />`元素，改元素的功能为: 启动包扫描功能，以便注册带有`@Controller`、`@Service`、`@repository`、`@Component`等注解的类成为 Spring 的 Bean。`base-package`属性指定了需要扫描的类包，类包及其递归子包中所有的类都会被处理。
```xml
<context:component-scan base-package="com.bpx.controller"/>
```
应该将所有控制器类都放在基本包下，并且指定扫描改包，即`com.bpx.controller`，而不应该指定扫描`com.bpx` 包，以避免 Spring MVC 扫描无关的包。

annotation 类型的处理映射器 RequestMappingHandlerMapping，它根据请求查找映射。  
annotation 类型的处理适配器 RequestMappingHandlerAdapter，来完成对 Controller 类的 @RequestMapping 标注方法的调用。  
视图解析器 InternalResourceViewResolver 来解析视图，将 View 呈现给用户。
