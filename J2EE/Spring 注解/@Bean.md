@Bean
>time: 2018-7-30 16:42:20

@Bean 可以注解到方法上，并且将方法返回的对象作为 Spring 的 Bean，存放到 IoC 容器中。

@Bean 注解配置项：
* name
    >是一个字符串数组，允许配置多个 BeanName，默认使用返回类名首字母小写的形式。
* autowire
    >标志是否是一个引用的 Bean 对象，默认值是 Autowire.NO。
* initMethod
    >自定义初始化方法。
* destoryMethod
    >自定义销毁方法

```java
@Bean(name = "dataSource") 
public DataSource getDataSource() {
    Properties props = new Properties();
    props.setProperty("driver", "com.mysql.jdbc.Driver");
    props.setProperty("url", "jdbc:mysql://127.0.0.1:3310/info");
    props.setProperty("username", "root");
    props.setProperty("passrod", "bhxz");
    
    DataSource dataSource = null;
    try {
        dataSource = BasicDataSourceFactory.createDataSource(props);
    } catch (Exception e) {
        e.printStackTrace();
    }
    
    
    return dataSource;
}
```

```java
@Bean(name="juiceMaker", initMethod="init", destroyMethod="myDestroy")
public JuiceMaker initJuicMaker() {
    JuiceMaker juiceMaker = new JuiceMaker();
    
    return juiceMaker;
}
```
