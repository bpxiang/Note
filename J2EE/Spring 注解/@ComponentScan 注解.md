@ComponentScan 注解
>time: 2018-7-30 14:48:56

@ComponentScan 代表进行扫描，默认是扫描当前包的路径。

#### 两个配置项
1. basePackages
    >配置一个 Java 包的数组，Spring 会根据它的配置扫描对应的的包和自包，将配置好的 Bean 装配起来。
1. basePackagesClasses
    >配置多个类，Spring 会根据配置的类所在的包，为包和子包进行扫描装配对应配置的 Bean。