package com.bpx.simple.factory;

public class Operation {
    private double numberA = 0;
    private double numberB = 0;

    public double getNumberA() {
        return this.numberA;
    }
    public void setNumberA(double numberA) {
        this.numberA = numberA;
    }

    public double getNumberB() {
        return this.numberB;
    }
    public void setNumberB(double numberB) {
        this.numberB = numberB;
    }

    public double getResult() throws Exception {
        return 0;
    }
}
