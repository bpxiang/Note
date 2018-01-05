package bpx.sort.string;

import java.util.Comparator;

import bpx.blong.string.BString;

public class StringSortMode {
	

}

abstract class SortSuper implements Comparator<String> {

	
}
class CodePointSort extends SortSuper {

	@Override
	public int compare(String str1, String str2) {
		int len1 = BString.getLength(str1);
		int len2 = BString.getLength(str2);
		int len = Math.min(len1, len2);
		return 0;
	}
	
}
