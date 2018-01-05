Servlet 是一种实现了 javax.servlet.Servlet 接口的类。Servlet 接口规定了特定的方法来处理特定的请求。开发者只需要实现 Servlet 的相关方法，用户访问 Web 程序的时候，Tomcat 会调用这些方法完成业务处理。

Servlet 规范是建立在 HTTP 规范基础上的。 HTTP 1.1 规范支持 OPTIONS、GET、POST、HEAD、PUT、DELETE 以及 TRACE 等 7 中 Web 访问方式。

Servlet 还有一个方法 long getLastModified(HttpServletRequest request)，返回该文档的最后修改时间，默认为-1，表示该文档永远是最新的。
