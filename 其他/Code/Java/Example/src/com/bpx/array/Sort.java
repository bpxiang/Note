package com.bpx.array;

import java.text.Collator;
import java.util.Arrays;
import java.util.Comparator;
import java.util.Locale;
public class Sort {
	public void sortZh() {
		Comparator<Object> comparator = Collator.getInstance(Locale.CHINA);
		
		String[] arr={"中山","汕头","广州","安庆","阳江","南京","武汉","北京","安阳","北方"};  
        Arrays.sort(arr, comparator);  
        System.out.println(Arrays.toString(arr));
        
        arr = new String[]{
				"千万","为恶","而","日","他","月","哦"
				,"片","阿","三","的","法","个","和"
				,"将","可","了","在","小","从","并"
				,"年","名", "中国",
				"",
				"123","_code","java","JAVA", "$_", "-", ""
		};		
		Arrays.sort(arr, comparator);
		System.out.println(Arrays.toString(arr));
		
	}
	public static void main(String[] args) {
		Sort sort = new Sort();
		sort.sortZh();
	}
}
