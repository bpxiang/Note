package com.bpx.strategy;

public class CashContext {
    private CashSuper cs;

    CashSuper cc;
    public CashContext(String type) {
        switch(type) {
            case "正常收费":
                cc = new CashNormal();
                break;
            case "满 300 返 100":
                cc = new CashReturn(300, 100);
                break;
            case "打 8 折":
                cc = new CashRebate(0.8);
                break;
        }
    }
    
    public double getResult(double money) {
        return cc.getResult(money);
    	
    }
}
