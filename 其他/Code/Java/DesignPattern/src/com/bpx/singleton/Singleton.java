package com.bpx.singleton;


public class Singleton {
	private static Singleton instance;
	
	private Singleton (){
		
	}
	
	public static Singleton GetInstance() {
		if (instance == null) {
			instance = new Singleton();
		}
		return instance;
	}
	
	public static void main(String[] args) {
		Singleton s1 = Singleton.GetInstance();
		Singleton s2 = Singleton.GetInstance();
		
		if(s1 == s2) {
			System.out.println("两个对象是相同的实例。");
		}
		System.out.println("s1: " + s1);
		System.out.println("s2: " + s2);
	}
}
