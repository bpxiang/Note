# Android 中的增强 for 循环
>key: 2017-11-13 09:45:15  
>keyword: for循环   
Java SE 5.0 还引入了增强版的 for 循环， 提供 了 一个 通用 的 缩写 表达式 来 遍历 集合 和 数组。 首先， 比较 以下 五种 方法：

```Java
public void loopOne(String[] names) {
    int size = names.length;
    for (int i = 0; i < size; i++) {
        printName(names[i]);
    }
}

public void loopTwo(String[] names) {
    for (String name : names) {
        printName(name);
    }
}

public void loopThree(Collection<String> names) {
    for (String name : names) {
        printName(name);
    }
}

public void loopFour(Collection<String> names) {
    Iterator<String> iterator = names.iterator();
    while (iterator.hasNext()) {
        printName(iterator.next());
    }
}

// 不 要在 ArrayList 上 使用 增强 版 的 for 循环
public void loopFive(ArrayList<String> names) {
    int size = names.size();
    for (int i = 0; i < size; i++) {
        printName(names.get(i));
    }
}
```
上面 显示 了 四种 不同 遍历 集合 和 数组 的 方式。 前面 两种 有着 相同 的 性能， 所以 如果 只是 读取 元素 的 话， 可以 放心 地 对数 组 使用 增强 版 for 循环。 对 Collection 对象 来说， 增强 版 for 循环 和 使用 迭代 器 遍历 元素 有着 相同 的 性能。 ArrayList 对象 应 避免 使用 增强 版 for 循环。

如果 不仅 需要 遍历 元素， 而且 需要 元素 的 位置， 就 一定 要使 用 数组 或者 ArrayList， 因为 所有 其他 Collection 类 在 这些 情况下 会 更 慢。

 一般 情况下， 如果 在读 取 元素 几乎不 变的 数据 集 时 对 性能 要求 很高， 建议 使用 常规 数组。 然而， 数组 的 大小 固定， 添加 数据 会 影响 性能， 所以 编写 代码 时 要 考虑 所有 因素。
