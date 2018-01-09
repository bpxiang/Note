# HTML 转义
>time: 2018-01-09 17:40:30

React 会将所有要显示到 DOM 的字符串转义，防止 XSS。所以，如果 JSX 中含有转义后的实体字符，比如 &copy;（©），则最后 DOM 中不会正确显示，因为 React 自动把 &copy; 中的特殊字符转义了。有几种解决办法：
1. 直接使用 UTF-8 字符 ©。
1. 使用对应字符的 Unicode 编码查询编码。
1. 使用数组组装 `<div>{['cc ', <span>&copy;</span>, ' 2015']}</div>`。
1. 直接插入原始的 HTML。

 React 提供了 dangerouslySetInnerHTML 属性。正如其名，它的作用就是避免 React 转义字符，在确定必要的情况下可以使用它：
 ```jsx
 <div dangerouslySetInnerHTML={{__html: 'cc &copy; 2015'}} />
 ```