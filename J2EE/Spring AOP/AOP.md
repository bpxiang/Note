# AOP

AOP（Aspect-Oriented Programming，面向切面编程） 是通过动态代理模式，带来管控各个对象操作的切面环境，管理包括日志、数据库事务等操作，让我们拥有可以在反射原有对象方法之前正常返回、异常返回事后插入自己的逻辑代码能力，有时候甚至取代原始方法。

#### 1. 切面（Aspect）
Aspect 声明类似于 Java 中的类声明，在 Aspect 中会包含一些 pointcut 及相应的 active。

#### 2. 通知（Advice）
通知是切面开启后，切面的方法。它根据在代理对象真实方法调用前、后的顺序和逻辑区分。
* 前置通知（before）：在动态代理反射原有的对象方法或者执行环绕通知前执行的通知功能。
* 后置通知（after）：在动态代理反射原有对象方法或者执行环绕通知后执行的通知功能。无论是否跑出异常，它都会被执行。
* 返回通知（afterReturning）：在动态代理反射原有对象方法或者执行环绕通知后正常返回（无异常）执行的通知功能。
* 异常通知（afterThrowing）：在动态代理反射原有对象方法或者执行环绕通知产生异常后执行的通知功能。
* 环绕通知（around）：在动态代理中，它可以取代当前被拦截对象的方法，提供回调原有被拦截对象的方法。
* finally：方法调用后执行 Advice，无论是否抛出异常还是正常返回。

#### 3. 引入（Introduction）
引入允许我们在现有的类里添加自定义的类和方法。

#### 4. 切点（Pointcut）
这是一个告诉 Spring AOP 在什么时候启动拦截并织入对应的流程中，因为并不是所有的开发都需要启动 AOP 的，它往往通过正则表达式进行限定。

表示一组 Joint point，比如方法名、参数类型、返回类型等，这些 Joint point 通过逻辑关系组合起来，它定义了相应的 Advice 将要发生的什么地方。简单理解 Pointcut （一种表达式）—— 用来判断在 Joint point（方法调用）中执行 Advice（通知）。

#### 5. 连接点（Joint point）
连接点对应的是具体需要拦截的东西，比如通过切点的正则表达式去判断哪些方法是连接点，从而织入对应的通知。Spring 中的 Joint point 只支持方法调用。

#### 6. 织入（Weaving）
织入是一个生成代理对象并将切面内容放入到流程中的过程。

可以在编译时刻（通过 AspectJ compiler）也可以在运行时生成代理对象，Spring 和其他大多数 Java 框架都是在运行时刻生成代理。

#### 7. AOP proxy
AOP proxy 是 Java 对象，有 AOP 框架创建，用来完成上述的动作，AOP 对象通常可以通过 `JDK dynamic proxy` 完成，或者使用 CGLib 完成。

在 Spring 中有 4 种方式去实现 AOP 的拦截功能：
1. 使用 ProxyFactoryBean 和对应的接口实现 AOP。
1. 使用 XML 配置 AOP。
1. 使用 @AspectJ 注解驱动切面（常用）
1. 驶入 AspectJ 注入切面