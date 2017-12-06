import java.time.*;

/**
 * This programe tests the Employee class.
 * @version 1.12 2015-05-08
 * @author Cay horstman
 */

 public class EmployeeTest{
     public static void main(String[] args) {
        Employee x = new Employee("Alice", 75000, 1987, 12, 15);
        Employee y = new Employee("Bob", 50000, 1989, 10, 1);
        Employee.swap(x, y);
        System.out.println(x);
        System.out.println(y);
        
     }
 }

 class Employee {
     private String name;
     private double salary;
     private LocalDate hireDay;

     public Employee(String n, double s, int year, int month, int day) {
        this.name = n;
        this.salary = s;
        hireDay = LocalDate.of(year, month, day);
     }
     public static void swap(Employee x, Employee y) {
        Employee temp = x;
        x = y;
        y = temp;
     }
     public String getName() {
         return name;
     }
     public double getSalary() {
         return salary;
     }
     public LocalDate getHireDay() {
         return hireDay;
     }
     public void raiseSalary(double byPercent) {
         double raise = salary * byPercent / 100;
         salary += raise;
     }
     public String toString() {
         return "[" + this.name + ", " + this.hireDay + ", " + this.salary + "]";
     }
 }