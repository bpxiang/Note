package com.bpx.strategy;

public class CashRebate extends CashSuper {

	private double rebate;
	public CashRebate(double rebate) {
		this.rebate = rebate;
	}
	@Override
	public double getResult(double money) {
		// TODO Auto-generated method stub
		return money * this.rebate;
	}

}
