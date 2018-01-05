package com.bpx.simple.factory;

public class Test {
    public static void main(String[] arg) {
        String operration = "/";
        Operation oper = OperationFactory.createOperation(operration);
        oper.setNumberA(1);
        oper.setNumberB(0);
        double result = -1;
        try{
            result = oper.getResult();
        }catch(Exception e) {
            System.out.println(e.getMessage());
        }
        System.out.println(result);
    }
}
