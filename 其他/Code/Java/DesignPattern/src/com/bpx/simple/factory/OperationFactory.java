package com.bpx.simple.factory;

public class OperationFactory {
    public static Operation createOperation(String operation) {
        Operation oper = null;
        switch(operation) {
            case "+":
                oper = new OperationAdd();
                break;
            case "-":
                oper = new OperationSub();
                break;
            case "*":
                oper = new OperationMul();
                break;
            case "/":
                oper = new OperationDiv();
                break;
        }
        return oper;
    }
}
