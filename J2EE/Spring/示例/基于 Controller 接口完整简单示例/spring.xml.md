# spring.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!-- 使用注解 -->
<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:mvc="http://www.springframework.org/schema/mvc"
	xsi:schemaLocation="
		http://www.springframework.org/schema/beans
		http://www.springframework.org/schema/beans/spring-beans-4.3.xsd
		http://www.springframework.org/schema/mvc
		http://www.springframework.org/schema/mvc/spring-mvc-4.3.xsd">
	<!-- 配置 Handle，映射“/hello”请求 -->
	<bean name="/hello" class="com.bpx.controller.HelloController"></bean>
	<!-- 处理映射器将 bean 的 name 作为 url 进行查找，需要配置 Handler 时指定 name（即 url） -->
	<bean class="org.springframework.web.servlet.handler.BeanNameUrlHandlerMapping"></bean>
	<!-- SimpleControllerHandlerAdapter 是一个处理器适配器，所有处理适配器都要实现 HandlerAdapter接口 -->
	<bean class="org.springframework.web.servlet.mvc.SimpleControllerHandlerAdapter"></bean>
	<!-- 视图解析器 -->
	<bean class="org.springframework.web.servlet.view.InternalResourceViewResolver"></bean>
</beans>
```
