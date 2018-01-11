# React 数据流
>time: 2018-01-10 16:00:00

在 React 中，数据是自顶向下单向流动的，即从父组件到子组件。这条原则让组件之间的关系变得简单且可预测。

state 与 props 是 React 组件中最重要的概念。如果顶层组件初始化 props，那么 React 会向下遍历整棵组件树，重新尝试渲染所有相关的子组件。而 state 只关心每个组件自己内部的状态，这些状态只能在组件内部改变。把组件看成一个函数，那么它接受了 props 作为参数，内部由 state 作为函数的内部参数，返回一个 Virtual DOM 的实现。

## 1. state

常见的 MVC 框架也非常容易实现交互界面的状态管理，它们将 View 中与界面交互的状态解耦，一般将状态放在 Model 中管理。但在 React 没有结合 Flux 或 Redux 框架前，它自身也同样可以管理组件的内部状态。在 React 中，把这类状态统一称为 state。

当组件内部使用库内置的 setState 方法时，最大的表现行为就是该组件会尝试重新渲染。这很好理解，因为我们改变了内部状态，组件需要更新了。

setState 是一个异步方法，一个生命周期内所有的 setState 方法会合并操作。

我们完全可以只用 React 来完成对行为的控制、数据的更新和界面的渲染。然而，随着内容的深入，我们并不推荐开发者滥用 state，过多的内部状态会让数据流混乱，程序变得难以维护。

### 更新 state，有两种不同的视角
* 内部更新，可以看作是组件内部的交互行为，被选择后通过回调函数返回具体选择的索引。
* 外部更新，可以看作是组件外部的传入具体的索引，而组件就像“木偶”一样被操控着。

这两种情形在 React 组件的设计中非常常见，我们形象地把第一种和第二种视角写成的组件分别称为智能组件（smart component）和木偶组件（dumb component）。

## 2. props
props 是 React 中另一个重要的概念，它是 properties 的缩写。 props 是 React 用来让组件之间互相联系的一种机制，通俗地说就像方法的参数一样。

props 的传递过程，对于 React 组件来说是非常直观的。 React 的单向数据流，主要的流动管道就是 props。 props 本身是不可变的。当我们试图改变 props 的原始值时，React 会报出类型错误的警告，组件的 props 一定来自于默认属性或通过父组件传递而来。如果说要渲染一个对 props 加工后的值，最简单的方法就是使用局部变量或直接在 JSX 中计算结果。

### 子组件的组织方式
* 在 Tabs 组件内把所有定义的子组件都显式展示出来。这种方式的好处在于非常易于理解，可自定义能力强，但调用过程显得过于笨重。 

```
<Tabs classPrefix={'tabs'} defaultActiveIndex={0}>
    <TabNav>
        <TabHead>Tab 1</TabHead>
        <TabHead>Tab 2</TabHead>
        <TabHead>Tab 3</TabHead>
    </TabNav>
    <TabContent>
        <TabPane>第一个 Tab 里的内容</TabPane>
        <TabPane>第二个 Tab 里的内容</TabPane>
        <TabPane>第三个 Tab 里的内容</TabPane>
    </TabContent>
</Tabs>
```
* 在 Tabs 组件内只显示定义内容区域的子组件集合，头部区域对应内部区域每一个 TabPane 组件的 props，让其在 TabNav 组件内拼装。这种方式的调用写法简洁，把复杂的逻辑留给了组件去实现。

```
<Tabs classPrefix={'tabs'} defaultActiveIndex={0}>
    <TabPane key={0} tab={'Tab 1'}>第一个 Tab 里的内容</TabPane>
    <TabPane key={1} tab={'Tab 2'}>第二个 Tab 里的内容</TabPane>
    <TabPane key={2} tab={'Tab 3'}>第三个 Tab 里的内容</TabPane>
</Tabs>
```

### 1. 子组件 prop
在 React 中有一个重要且内置的 prop——children，它代表组件的子组件集合。 children 可以根据传入子组件的数量来决定是否是数组类型。上述调用 TabPane 组件的过程，翻译过来即是：
```
<Tabs classPrefix={'tabs'} defaultActiveIndex={0} className="tabs-bar"
    children={[
        <TabPane key={0} tab={'Tab 1'}>第一个 Tab 里的内容</TabPane>,
        <TabPane key={1} tab={'Tab 2'}>第二个 Tab 里的内容</TabPane>,
        <TabPane key={2} tab={'Tab 3'}>第三个 Tab 里的内容</TabPane>,
    ]}
>
</Tabs>
```
实现的基本思路就以 TabContent 组件渲染 TabPane 子组件集合为例来讲，其中渲染 TabPane 组件的方法如下：
```javascript
getTabPanes() {
    const { classPrefix, activeIndex, panels, isActive } = this.props;
    return React.Children.map(panels, (child) => {
        if (!child) { return; }
        const order = parseInt(child.props.order, 10);
        const isActive = activeIndex === order;
        return React.cloneElement(child, {
            classPrefix,
            isActive,
            children: child.props.children,
            key: 'tabpane-${order}',
        });
    });
}
```
上述代码讲述了子组件集合是怎么渲染的。通过 React.Children.map 方法遍历子组件，将 order（渲染顺序）、 isActive（是否激活 tab）、 children（Tabs 组件中传下的 children）和 key 利用 React 的 cloneElement 方法克隆到 TabPane 组件中，最后返回这个 TabPane 组件集合。这也是 Tabs 组件拼装子组件的基本原理。

其中， React.Children 是 React 官方提供的一系列操作 children 的方法。它提供诸如 map、forEach、 count 等实用函数，可以为我们处理子组件提供便利。

最后， TabContent 组件的 render 方法只需要调用 getTabPanes 方法即可渲染：

```
render() {
    return (<div>{this.getTabPanes()}</div>);
}
```
假如我们把 render 方法中的 this.getTabPanes 方法中对子组件的遍历直接放进去，就会变成
如下形式：

```
render() {
    return (<div>{React.Children.map(this.props.children, (child) => {...})}</div>);
}
```

这种调用方式称为 Dynamic Children（动态子组件） 。它指的是组件内的子组件是通过动态计算得到的。就像上述对子组件的遍历一样，我们一样可以对任何数据、字符串、数组或对象作动态计算。

用声明式编程的方式来渲染数据，这种做法和关心所有细节的命令式编程相比，会让我们轻松许多。当然，除了数组的 map 函数，还可以用其他实用的高阶函数，如 reduce、 filter 等函数。值得注意的是，与 map 函数相似但不返回调用结果的 forEach 函数不能这么使用。

## 2. 组件 props
当然， React 的强大之处不止于此，我们观察 TabPane 组件中的 tab prop：
```
<TabPane key={0} tab={'Tab 1'}>第一个 Tab 里的内容</TabPane>
```
它现在传入的是一个字符串。那么，假如可以传入节点呢，是不是就可以自定义 tab 头展示的形式了。这就是 component props。对于子组件而言，我们不仅可以直接使用 this.props.children 定义，也可以将子组件以 props 的形式传递。一般我们会用这种方法来让开发者定义组件的某一个 prop，让其具备多种类型，来做到简单配置和自定义配置组合在一起的效果。

在 Tabs 组件中，我们就用到了这样的功能，调用方式如下所示：

```
<Tabs classPrefix={'tabs'} defaultActiveIndex={0} className="tabs-bar">
    <TabPane
        order="0"
        tab={<span><i className="fa fa-home"></i>&nbsp;Home</span>}>
            第一个 Tab 里的内容
    </TabPane>
    <TabPane
        order="1"
        tab={<span><i className="fa fa-book"></i>&nbsp;Library</span>}>
            第二个 Tab 里的内容
    </TabPane>
    <TabPane
        order="2"
        tab={<span><i className="fa fa-pencil"></i>&nbsp;Applications</span>}>
            第三个 Tab 里的内容
    </TabPane>
</Tabs>
```

我们也可以加入更多的自定义元素，可以是多行的，甚至可以插入动态数据。

```
getTabs() {
    const { classPrefix, activeIndex, panels } = this.props;
    return React.Children.map(panels, (child) => {
        if (!child) { return; }
        const order = parseInt(child.props.order, 10);
        let classes = classnames({
            [`${classPrefix}-tab`]: true,
            [`${classPrefix}-active`]: activeIndex === order,
            [`${classPrefix}-disabled`]: child.props.disabled,
        });
        return (
            <li>{child.props.tab}</li>
        );
    });
}
```

其实现看上去与 getTabPanes 方法非常像，关键在于通过遍历 TabPane 组件的 tab prop 来实 现我们想要的功能。不论 tab 是以字符串的形式还是以虚拟元素的形式存在，都可以直接 在 `<li>` 标签中渲染出来。

## 3. 用 function prop 与父组件通信
现在我们发现对于 state 来说，它的通信集中在组件内部；对于 props 来说，它的通信是父组件向子组件的传播。
```javascript
handleTabClick(activeIndex) {
    // ...
    this.props.onChange({activeIndex, prevIndex});
}
```
我们通过点击事件 handleTabClick 触发了 onChange prop 回调函数给父组件必要的值。对于兄弟组件或不相关组件之间的通信。

## 4. propTypes

propTypes 用于规范 props 的类型与必需的状态。如果组件定义了propTypes，那么在开发环境下，就会对组件的 props 值的类型作检查，如果传入的 props 不能与之匹配， React 将实时在控制台里报 warning。在生产环境下，这是不会进行检查的。
```javascript
static propTypes = {
    classPrefix: React.PropTypes.string,
    className: React.PropTypes.string,
    defaultActiveIndex: React.PropTypes.number,
    activeIndex: React.PropTypes.number,
    onChange: React.PropTypes.func,
    children: React.PropTypes.oneOfType([
        React.PropTypes.arrayOf(React.PropTypes.node),
        React.PropTypes.node,
    ]),
};


static propTypes = {
    tab: React.PropTypes.oneOfType([
        React.PropTypes.string,
        React.PropTypes.node,
    ]).isRequired,
    order: React.PropTypes.string.isRequired,
    disable: React.PropTypes.bool,
};
```

在 TabPane 组件的 props 中，对 tab 和 order prop 除了定义类型，还定义了是否必要。因此，如果在写 TabPane 组件时，没有定义 order prop，浏览器就会主动报一个类型错误的提示：

```
Warning: Failed propType: Required prop `order` was not specified in `TabPane`
```

* 函数类型的检查: propTypes.func
* 布尔类型的检查: propTypes.bool

