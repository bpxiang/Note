@Value 注解
>time: 2018-7-30 14:46:30

@Value 代表的是值的注入，这里只是简单注入一些值，注入时 Spring 会为其转化类型。

```
@Value("#{configProperties['qinqin.name']}")
@Value("${qinqin.name}")
```