package com.bpx.strategy;

public class CashReturn extends CashSuper {
	private double money;
	private double returnMoney;
	public CashReturn(double money, double returnMoney) {
		this.money = money;
		this.returnMoney = returnMoney;
	}
	@Override
	public double getResult(double money) {
		if(money > this.money) {
			money = money - this.returnMoney;
		}
		return money;
	}

}
