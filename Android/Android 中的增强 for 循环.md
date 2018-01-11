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
上面显示了四种不同遍历集合和数组的方式。前面两种有着相同的性能，所以如果只是读取元素的话，可以放心地对数组使用增强版 for 循环。对 Collection 对象来说，增强版 for 循环和使用迭代器遍历元素有着相同的性能。ArrayList 对象应避免使用增强版 for 循环。

如果不仅需要遍历元素，而且需要元素的位置，就一定要使用数组或者ArrayList，因为所有其他 Collection 类在这些情况下会更慢。

 一般情况下，如果在读取元素几乎不变的数据集时对性能要求很高，建议使用常规数组。然而，数组的大小固定，添加数据会影响性能，所以编写代码时要考虑所有因素。
