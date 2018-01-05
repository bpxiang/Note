package bpx.blong;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class BDate {

	public BDate() {
		// TODO Auto-generated constructor stub
	}
	/**
	 * 输出 日期和时间的转换符
	 */
	public void echoConversionCharacter() {
		List<String[]> dateInfo = new ArrayList<String[]>();
		String[] info = new String[]{"c", "完整的日期和时间"};
		dateInfo.add(info);
		
		info = new String[]{"F", "ISO 8601 日期"};
		dateInfo.add(info);
		
		info = new String[]{"D", "美国格式日期（月/日/年）"};
		dateInfo.add(info);
		
		info = new String[]{"T", "24 小时时间"};
		dateInfo.add(info);
		
		info = new String[]{"r", "12 小时时间"};
		dateInfo.add(info);
		
		info = new String[]{"R", "24 小时时间没有秒"};
		dateInfo.add(info);
		
		info = new String[]{"Y", "4 位数字的年（前面补 0）"};
		dateInfo.add(info);
		
		info = new String[]{"y", "年的后两位数字（前面补 0）"};
		dateInfo.add(info);
		
		info = new String[]{"C", "年的前两位数字（前面补 0）"};
		dateInfo.add(info);
		
		info = new String[]{"B", "月的完整拼写"};
		dateInfo.add(info);
		
		info = new String[]{"b 或 h", "月的缩写"};
		dateInfo.add(info);
		
		info = new String[]{"m", "两位数字的月（前面补 0）"};
		dateInfo.add(info);
		
		info = new String[]{"d", "两位数字的日（前面补 0）"};
		dateInfo.add(info);
		
		info = new String[]{"e", "两位数字的日（前面不补 0）"};
		dateInfo.add(info);
		
		info = new String[]{"A", "星期几的完整拼写"};
		dateInfo.add(info);
		
		info = new String[]{"a", "星期几的缩写"};
		dateInfo.add(info);
		
		info = new String[]{"j", "三位数的年中的日子（前面补 0），在 001 到 366 之间"};
		dateInfo.add(info);
		
		info = new String[]{"H", "两位数字的小时（前面补 0），在 0 到 23 之间"};
		dateInfo.add(info);
		
		info = new String[]{"k", "两位数字的小时（前面不补 0），在 0 到 23 之间"};
		dateInfo.add(info);
		
		info = new String[]{"I", "两位数字的小时（前面补 0），在 0 到 12 之间"};
		dateInfo.add(info);
		
		info = new String[]{"l", "两位数字的小时（前面不补 0），在 0 到 12 之间"};
		dateInfo.add(info);
		
		info = new String[]{"M", "两位数字的分钟（前面补 0）"};
		dateInfo.add(info);
		
		info = new String[]{"S", "两位数字的秒（前面补 0）"};
		dateInfo.add(info);
		
		info = new String[]{"L", "三位数字的毫秒（前面补 0）"};
		dateInfo.add(info);
		
		info = new String[]{"N", "九位数字的毫微秒（前面补 0）"};
		dateInfo.add(info);
		
		info = new String[]{"p", "上午或下午的标志"};
		dateInfo.add(info);
		
		info = new String[]{"z", "从 GMT 起，RFC822 数字位移"};
		dateInfo.add(info);
		
		info = new String[]{"Z", "时区"};
		dateInfo.add(info);
		
		info = new String[]{"s", "从格林威治时间 1970-01-01 00:00:00 起的秒数"};
		dateInfo.add(info);
		
		info = new String[]{"Q", "从格林威治时间 1970-01-01 00:00:00 起的毫秒数"};
		dateInfo.add(info);
		
		
		Date date = new Date();
		System.out.println("| 转换符 | 类型 | 举例 |");
		System.out.println("|---|---|---|");
		for(String[] msg : dateInfo) {
			System.out.printf("| %s | %s | %t" + msg[0].substring(0, 1) + " |\n", msg[0], msg[1], date);
		}	
	}
}
