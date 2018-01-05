
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import bpx.util.StackTrace;

public class Test {
    public static void main(String[] args) {
        final int MAX = 9;
        int[][] odds = new int[MAX + 1][];
        for(int n = 0; n <= MAX; n++) {
            odds[n] = new int[n + 1];
        }
        for(int n = 0; n < odds.length; n++) {
            for(int k = 0; k < odds[n].length; k++){
                int tmp = 0;
                int before = n - 1;
                if(before < 0) {
                    tmp = 1;
                }
                //[n - 1][n - 1] + [n - 1][k]
                odds[n][k] = tmp;
            }
        }
        for(int n = 0; n < odds.length; n++) {
            System.out.println();
            for(int k = 0; k < odds[n].length; k++){
                System.out.printf("%2d", odds[n][k]);
            }
        }
	}
}
