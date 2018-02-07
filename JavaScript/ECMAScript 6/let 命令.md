# let 命令
>time: 2018-02-06 17:48:18  

let 命令用于声明变量。所声明的变量只在 let 命令所在的代码块内有效。
```javascript
{
    let a = 10;
    var b = 1;
}
console.log(a); // ReferenceError: a is not defined
console.log(b); // 1
```

let 命令很适合 for 循环
```javascript
for(let i = 0; i < 10; i++){}
console.log(i); // ReferenceError: i is not defined
```

```javascript
var a = [];
for (var i = 0; i < 10; i++) {
    a[i] = function() {
        console.log(i);
    }
}
a[6](); // 10

for (let i = 0; i < 10; i++) {
    a[i] = function() {
        console.log(i);
    }
}
a[6](); // 6
```

ES6 规定暂时性死区和不存在变量提升，主要是为了减少运行时错误，防止在变量声明前就使用这个变量，从而导致意料之外的行为。

## 1. 不存在变量提升
let 不像 var 那样会发生“变量提升”现象。所以，变量一定要在声明后使用，否则报错。  
ES6 明确规定，如果区块中存在 let 和 const 命令，则这个区块对这些碧昂灵声明的变量从一开始就形成封闭作用域，使用 let 命令声明变量之前，该变量都是不可用的。这在语法上称为“暂时性死区”（temporal dead zone，简称 TDZ）。
```javascript
console.log(arg);
var arg = 2; // undefined

console.log(foo);
let foo = 2; // ReferenceError: foo is not defined
```

## 2. 暂时性死区
只要块级作用域内存在 let 命令，它所声明的变量就“绑定”（binding）这个区域，不再受外部影响。  

暂时性死区的本质就是，只要一进入当前作用域，索要使用得变量就已存在，但是不可获取，只有等待声明变量的那一行代码出现，才可以获取和使用该变量。

```javascript
var tmp = 123;

if(true) {
    tmp = 'abc'; // ReferenceError: tmp is not defined
    let tmp;
}

function tar(x = 2, y = x) {
    return [x, y];
}
console.log(tar()); // [ 2, 2 ]

function bar(x = y, y = 2) {
    return [x, y];
}
console.log(bar()); // ReferenceError: y is not defined
```

## 3. 不允许重复声明
let 不允许在相同的作用域内重复声明同一个变量。