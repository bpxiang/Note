package bpx.blong.string;

public class BString {

	public BString() {
		// TODO Auto-generated constructor stub
	}
	/**
	 * 获得字符串的长度（单个辅助字符长度为1）
	 * @param str
	 * @return
	 */
	public static int getLength(String str) {
		int length = 0;
		if(str != null) {
			int[] codePoints = str.codePoints().toArray();
			length = codePoints.length;
		}
		return length;
	}
	/**
	 * 获得字符串指定索引的代码点
	 * @param str 字符串
	 * @param index 索引
	 * @return 代码点
	 * @throws Exception
	 */
	public static int getCodePoint(String str, int index) throws Exception {
		
		if(str == null) {
			throw new Exception("str is not null");
		}
		if(index < 0) {
			throw new Exception("index is not < 0");
		}
		int[] codePoints = str.codePoints().toArray();
		int length = codePoints.length;
		if(index >= length) {
			throw new Exception("index is not >= str code point count");
		}
			
		int codePoint = codePoints[index];
		return codePoint;
	}
	/**
	 * 获得由单个字符（或者单个辅助字符）构成的字符串
	 * @param codePoint
	 * @return
	 */
	public static String getStringByCodePoint(int codePoint) {
		String str = new String(new int[]{codePoint}, 0, 1);
		return str;		
	}
	
	public static void main(String[] args){
		String str = "𝕆 is the set of octonions";
		int[] codePoints = str.codePoints().toArray();

		for(int i = 40; i < 2013; i++) {
			String str2 = BString.getStringByCodePoint(i);
			if(i != 0 && i % 10 == 0){
				System.out.println();
			}
			System.out.printf("%5s", str2);
		}
		System.out.println(BString.getStringByCodePoint(120139));
		System.out.println(	BString.getLength(str) + "-" + str.length() );
	}
}
