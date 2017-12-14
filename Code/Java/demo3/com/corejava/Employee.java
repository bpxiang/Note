package com.corejava;

public class Employee {
    private double salary;
    /**
     * Raises the salary of an employee.
     * @param byPercent the percentage by which to raise the salary (e.g. 10 means 10%)
     * @return the amount of the raise
     */
    public double raiseSalary(double byPercent) {
        double raise = salary * byPercent / 100;
        salary += raise;
        return raise;
    }
}