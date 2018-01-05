package com.bpx.strategy;

public class Test {
	public static void main(String[] args) {
		
		String type = "";
//		type = "正常收费";
//		type = "打 8 折";
		type = "满 300 返 100";
		
		CashContext cc = new CashContext(type);
		double price = 400;
		price = cc.getResult(price);
		System.out.println(price);
	}
}
