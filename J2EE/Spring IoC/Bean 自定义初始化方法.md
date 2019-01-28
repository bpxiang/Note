# bean 自定义初始化方法
>time: 2018-7-27 15:31:00

## 1. `init-method="init"`
```xml
<bean id="juiceMaker" init-method="init" destroy-method="myDestory"
        class="top.bupuxiang.spring.beans.JuiceMaker">
    <property name="beverageShop" value="贡茶"></property>
    <property name="source" ref="source"></property>
</bean>
```

## 2. Java 注解（可以注解多个方法）
```java
@PostConstruct
public void init() {
    System.out.println(String.format("【%s】执行自定义初始化方法", this.getClass().getSimpleName()));
}
```


### 2.1 启用注解
#### 2.1.1
```xml
<bean class="org.springframework.context.annotation.CommonAnnotationBeanPostProcessor" />
```

#### 2.1.2 `<context:annotation-config/>`

```
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="
    ...
    xmlns:context="http://www.springframework.org/schema/context"
    xsi:schemaLocation="
        ...
        http://www.springframework.org/schema/context
        http://www.springframework.org/schema/context/spring-context-4.3.xsd">
        
        <context:annotation-config/>
        ...
</beans>
```