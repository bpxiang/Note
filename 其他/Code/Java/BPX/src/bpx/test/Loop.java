package bpx.test;

import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;

public class Loop {

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

    private void printName(String next) {
        // TODO Auto-generated method stub

    }
    

    public static void main(String[] args) {
        long mi = System.currentTimeMillis();
        System.out.println(mi);

    }

}

