# @SpringBootApplication
>time: 2018-10-17 16:56:09


@SpringBootApplication 是 Spring  Boot 项目的核心注解，它是一个组合注解，主要目的是开启自动配置。

Spring Boot 会自动扫描 `@SpringBootApplication` 所在类的同级包以及下级包里的 Bean（若为 JPA 项目还可以扫描标注 `@Entity` 的实体类）。建议入口类放置的位置在 `groupId+arctifactID` 组合的包名下。

#### 关闭特定的自动配置
```
@SpringBootApplication(exclude= {DataSourceAutoConfiguration.class})
```



#### 注解源码
```java
@Target(ElementType.TYPE)
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Inherited
@SpringBootConfiguration
@EnableAutoConfiguration
@ComponentScan(excludeFilters = {
		@Filter(type = FilterType.CUSTOM, classes = TypeExcludeFilter.class),
		@Filter(type = FilterType.CUSTOM, classes = AutoConfigurationExcludeFilter.class) })
public @interface SpringBootApplication {

	/**
	 * Exclude specific auto-configuration classes such that they will never be applied.
	 * @return the classes to exclude
	 */
	@AliasFor(annotation = EnableAutoConfiguration.class)
	Class<?>[] exclude() default {};

	@AliasFor(annotation = EnableAutoConfiguration.class)
	String[] excludeName() default {};

	@AliasFor(annotation = ComponentScan.class, attribute = "basePackages")
	String[] scanBasePackages() default {};

	@AliasFor(annotation = ComponentScan.class, attribute = "basePackageClasses")
	Class<?>[] scanBasePackageClasses() default {};

}
```

```java
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@SpringBootApplication
public class Application {

    @RequestMapping("/")
    String index() {
        return "Hello Spring Boot !";
    }
    // 项目启动的入口
    public static void main(String[] args) {
        //SpringApplication.run(Application.class, args);
        SpringApplication app = new SpringApplication(Application.class);
        app.run(args);
    }
}
```