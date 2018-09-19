# Bean 的生命周期
>time: 2018-7-27 16:06:40

#### Bean 的声明周期
| 方法 | 说明 |
|---|---|
| 开始 | |
| 初始化 | |
| 依赖注入 | |
| setBeanName 方法 | 接口 BeanNameAware |
| setBeanFactory 方法 | 接口 BeanFactoryAware |
| setApplicationContext 方法 | 接口 ApplicationContextAware，需要容器实现 ApplicationContext 接口才会被调用 |
| postProcessBeforeInitialization 方法 | BeanPostProcessor 的预初始化方法，注意：它是针对全部 Bean 而言 |
| afterPropertiesSet 方法 | 接口 InitializingBean |
| 自定义初始化方法 | 除了 XML 外，也可以用注解 @PostConstruct 标注方法声明 |
| postProcessAfterInitialization 方法 | BeanPostProcessor 的后初始化方法，注意：它是针对全部 Bean 而言的 |
| 生存期 | |
| destroy 方法 | 接口 DisposableBean |
| 自定义销毁方法 | 除了 XML 之外，也可以用注解 @PreDestroy 标注方法声明 |
| 结束 | |

#### 生命周期的步骤：
1. 如果 Bean 实现了接口 BeanNameAware 的 setBeanName 方法，那么它就会调用这个方法。
2. 如果 Bean 实现了接口 BeanFactoryAware 的 setBeanFactory 方法，那么它就会调用这个方法。
3. 如果 Bean 实现了接口 ApplicationContextAware 的 setApplicationContext 方法，且 Spring IoC 容器也必须是一个 ApplicationContext 接口的实现类，那么才会调用这个方法，否则是不调用的。
4. 如果 Bean 实现了接口 BeanPostProcessor 的 postProcessBeforeInitialization 方法，那么它就调用这个方法。
5. 如果 Bean 实现了接口 BeanFactoryPostProcessor 的 afterPropertiesSet 方法，那么它就会调用这个方法。
6. 如果 Bean 自定义了初始化方法，它就会调用已定义的初始化方法。
7. 如果 Bean 实现了接口 BeanPostProcessor 的 postProcessAfterInitialization 方法，完成了这些调用，这个时候 Bean 就完成了初始化，那么 Bean 就生存在 Spring Ioc 的容器中了，使用者就可以从中获取 Bean 的服务了。



#### Bean 销毁的步骤
1. 如果 Bean 实现了接口 DisposableBean 的 destroy 方法，那么就会调用它。
2. 如果定义了自定义销毁方法，那么就会调用它。

BeanPostProcessor 接口则是针对所有 Bean 而言的。当一个 Bean 实现了上述的接口，只需要在 Spring IoC 容器中定义它就可以了，Spring IoC 会自动识别。

#### BeanPostProcessorImpl
```java
public class BeanPostProcessorImpl implements BeanPostProcessor {

    @Override
    public Object postProcessAfterInitialization(Object bean, String beanName) throws BeansException {
        System.out.println(String.format("【%s】对象%s实例化完成", bean.getClass().getSimpleName(), beanName));
        return bean;
    }

    @Override
    public Object postProcessBeforeInitialization(Object bean, String beanName) throws BeansException {
        System.out.println(String.format("【%s】对象%s开始实例化", bean.getClass().getSimpleName(), beanName));
        return bean;
    }

}
```

#### Source
```java
public class Source {
    private String fruit;
    private String sugar;
    private String size;
    public String getFruit() {
        return fruit;
    }
    public void setFruit(String fruit) {
        this.fruit = fruit;
    }
    public String getSugar() {
        return sugar;
    }
    public void setSugar(String sugar) {
        this.sugar = sugar;
    }
    public String getSize() {
        return size;
    }
    public void setSize(String size) {
        this.size = size;
    } 
}
```

#### JuiceMaker
```java
public class JuiceMaker implements BeanNameAware, BeanFactoryAware, 
        ApplicationContextAware, InitializingBean, DisposableBean{
    private String beverageShop = null;
    private Source source = null;
    
    public String getBeverageShop() {
        return beverageShop;
    }

    public void setBeverageShop(String beverageShop) {
        this.beverageShop = beverageShop;
    }

    public Source getSource() {
        return source;
    }

    public void setSource(Source source) {
        this.source = source;
    }



    public void init() {
        System.out.println(String.format("【%s】执行自定义初始化方法", this.getClass().getSimpleName()));
    }
    
    public void myDestory() {
        System.out.println(String.format("【%s】执行自定义销毁方法", this.getClass().getSimpleName()));
    }
    
    public String makeJuice() {
        String juice = "这是一杯由" + beverageShop + "饮品店，提供的"
                + source.getSize() + source.getSugar() + source.getFruit(); 
        return juice;
    }
    
    /**
     * BeanNameAware Define function
     */
    @Override
    public void setBeanName(String arg0) {
        System.out.println(String.format("【%s】调用 BeanNameAware 接口的 setBeanName 方法", this.getClass().getSimpleName()));
        
    }

    @Override
    public void setBeanFactory(BeanFactory arg0) throws BeansException {
        System.out.println(String.format("【%s】调用 BeanFactoryAware 接口的 setBeanFactory 方法", this.getClass().getSimpleName()));
    }
    
    @Override
    public void setApplicationContext(ApplicationContext arg0) throws BeansException {
        System.out.println(String.format("【%s】调用 ApplicationContextAware 接口的  setApplicationContext 方法", this.getClass().getSimpleName()));
    }

    @Override
    public void afterPropertiesSet() throws Exception {
        System.out.println(String.format("【%s】调用 InitializingBean 接口的 afterPropertiesSet 方法", this.getClass().getSimpleName()));
    }
    
    @Override
    public void destroy() throws Exception {
        System.out.println(String.format("【%s】调用了 DisposableBean 接口的 destroy 方法", this.getClass().getSimpleName()));
    }
}
```

#### spring-cfg.xml
```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="
        http://www.springframework.org/schema/beans
        http://www.springframework.org/schema/beans/spring-beans-4.3.xsd">
        
        
        <bean id="beanPostProcessor"
            class="top.bupuxiang.spring.beans.BeanPostProcessorImpl" />
        
        <bean id="source" class="top.bupuxiang.spring.beans.Source">
            <property name="fruit" value="橙汁"></property>
            <property name="sugar" value="少糖"></property>
            <property name="size" value="大杯"></property>
        </bean>
        <bean id="juiceMaker" init-method="init" destroy-method="myDestory"
                class="top.bupuxiang.spring.beans.JuiceMaker">
            <property name="beverageShop" value="贡茶"></property>
            <property name="source" ref="source"></property>
        </bean>
</beans>
```

#### Test
```java
public class Test {
    public static void main(String[] args) {
        ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("spring-cfg.xml");
        JuiceMaker maker = (JuiceMaker)ctx.getBean("juiceMaker");
        System.out.println(maker.makeJuice());
        ctx.close();
    }
}
```

#### 输出
```
【Source】对象source开始实例化
【Source】对象source实例化完成
【JuiceMaker】调用 BeanNameAware 接口的 setBeanName 方法
【JuiceMaker】调用 BeanFactoryAware 接口的 setBeanFactory 方法
【JuiceMaker】调用 ApplicationContextAware 接口的  setApplicationContext 方法
【JuiceMaker】对象juiceMaker开始实例化
【JuiceMaker】调用 InitializingBean 接口的 afterPropertiesSet 方法
【JuiceMaker】执行自定义初始化方法
【JuiceMaker】对象juiceMaker实例化完成
这是一杯由贡茶饮品店，提供的大杯少糖橙汁
【JuiceMaker】调用了 DisposableBean 接口的 destroy 方法
【JuiceMaker】执行自定义销毁方法
```