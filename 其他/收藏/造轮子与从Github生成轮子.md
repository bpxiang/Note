# 造轮子与从Github生成轮子

在知乎上回答了个问题，觉得写得甚好，便也将内容复制了出来。造轮子是一种快速的学习方式，而还有一种进阶则可以是从Github中生成轮子。

并且要记得在最后要写几篇文章总结一下，总的来说就是：

1. 查看很多Github项目的源码及提交历史
1. 写胶水代码生成自己的框架

分享之前造的几个轮子的过程：

## 一、 SPA框架

两年多以前，当时我们项目用的技术栈是：Backbone + Mustache + jQuery。在我们当时的环境下，主要组成有：

1. Backbone提供了一个Router
1. Mustache提供了模板
1. jQuery抽象了DOM
1. Ajax请求

所以，这就是我造的第一个轮子的重要组成部分。

接着，我就开始造轮子了：我称呼这个框架为`Lettuce, GitHub - phodal/lettuce: Mobile Framework for Romantic. 简约的移动开发框架`。

我参考了一本名为`《Building A JavaScript Framework 》`的电子书，以及`《JavaScript框架设计》`一书。因为没有任何框架的设计经验，所以只好试图按照书上的一点一滴来进行。在这个过程中，我开始深入JavaScript。

从 [https://github.com/munro/self) 这个库中，我开始创建了自己的类的用法。

接着，开始写Ajax，照例还是参考了jQuery和Zepto的代码。同样的还有Event、Promise等等的一些类。

然后就是Router，源码来自于：https://krasimirtsonev.com/blog/article/A-modern-JavaScript-router-in-100-lines-history-api-pushState-hash-url，又参考了早期的Backbone代码。

以及模板引擎，照例代码也不全是我写的，用的是http:////ejohn.org/blog/javascript-micro-templating/

最后就是一个简单的PageView:

```javascript
var SimpleView = new Lettuce.prototype.Class({});

SimpleView.prototype.init = function () {};

SimpleView.prototype.render = function (template, elementId) {
   document.getElementById(elementId).innerHTML = template;
};

var simpleView = {
   SimpleView: SimpleView
};

Lettuce.prototype = Lettuce.extend(Lettuce.prototype, simpleView);
```

这其中最复杂的部分就是结合别人的代码，换句话来说，就是写胶水代码。Blabla，最后我就有了一个SPA框架。

相关文章：一步步搭建JavaScript框架——初始化项目

不过，这其中参考了几十个框架，这点对提升自己很重要。

## 二、Slide框架

八个多月前，当时的情形是我需要有一个可以定时放映地Slide框架，而当时大部分的框架都不能满足我的要求。

实际上我只需要一个定时的功能，而Impress的最新代码又太复杂了。

接着，我看了Github上的提交历史，我发现挺简单的，就自己创一个新的框架，称为`GitHub - phodal/echoesworks: Next-Generation Tech Blog/Presentation/Slider Framework`。

我需要下面的一些元素：

1. Markdown解析器
1. Slide框架
1. Github代码显示
1. 进度条

同样的，我在Github上搜索不同的组件，最后再把他们结合到一起。

相关文章：

1. EchoesWorks —— 打造下一代技术Blog/Presentation 框架
1. EchoesWorks构建: LocalStorage与跨Tab通信

接着，我又造了不同的几个框架：

1. GitHub - phodal-archive/geng: DSL Step 1 —— Parse: 天干物燥，小心火烛
1. GitHub - phodal-archive/tile.js: a pure javascript tiled map render
1. GitHub - phodal/resume: RESUME Generator

随着造的轮子越来越多，写胶水代码的能力越来越强，我就开始创造一些更有意思的轮子。


## 三、Luffa

Luffa是最近造的一个轮子，对于不写测试的人来说可能没有那么有意思。

我称其为基于`Virtual DOM`与`Diff DOM`的测试代码生成，G`itHub - phodal/luffa: A Test Framework Helper for Fun`

当时我们项目用的是`Jasmine`和`Jasmine jQuery`作为测试框架。在写测试的时候，觉得看起来太麻烦了，就想着写一个框架来`Diff DOM`的变化。

然后就是Virtual DOM那些东西了。

virtual-dom可以说由下面几部分组成的：

1. createElement，用于创建virtual Node。
1. diff，顾名思义，diff算法。
1. h，用于创建虚拟树的DSL——HyperScript。HyperScript是一个JavaScript的HyperText。
1. patch，用于patch修改的内容。

所以，我们可以很容易地创建出一个这样的框架来Diff测试中DOM元素的修改。

相关文章：基于Virtual DOM与Diff DOM的测试代码生成

最后因为创建Growth就没有继续了: GitHub - phodal/growth: Be Awesome Developer。
