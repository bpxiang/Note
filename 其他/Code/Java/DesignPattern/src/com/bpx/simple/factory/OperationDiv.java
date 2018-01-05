package com.bpx.simple.factory;

public class OperationDiv extends Operation{
    public double getResult() throws Exception{
        double result = 0;
        if (getNumberB() == 0) {
            throw new Exception("除数不能为 0。");
        }
        result = getNumberA() / getNumberB();
        return result;
    }
}
