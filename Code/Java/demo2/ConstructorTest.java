import java.util.*;

public class ConstructorTest {
    public static void main(String[] args) {
        // fill the staff array with three Employee objects
        Employee[] staff = new Employee[3];

        staff[0] = new Employee("Harry", 40000);
        staff[1] = new Employee(60000);
        staff[2] = new Employee();

        // print out information about all Employee objects
        for (Employee e : staff) {
            System.out.println(e);
        }
        // prints
        // name=Harry, id=8202, salary40000.0
        // name=Employee #8203, id=8203, salary60000.0
        // name=, id=8204, salary0.0
    }
}

class Employee
{
    private static int nextId;

    private int id;
    private String name = ""; // instance field initialization
    private double salary;

    // static initialization block
    static {
        Random generator = new Random();
        // set nextId to a random number between 0 and 9999
        nextId = generator.nextInt(10000);
    }

    // object initializtion block
    {
        id = nextId;
        nextId++;
    }

    // three overloaded constructors
    public Employee(String name, double salary) {
        this.name = name;
        this.salary = salary;
    }

    public Employee(double salary) {
        // calls the Employee(String, double) constructor
        this("Employee #" + nextId, salary);
    }

    // the default constructor
    public Employee() {
        // name initialization to ""--see above
        // salary not explicitly set -- initialized to 0
        // id initialized in initialization block
    }

    public String getName() {
        return this.name;
    }

    public double getSalary() {
        return this.salary;
    }

    public int getId() {
        return id;
    }

    public String toString() {
        String str = "name=" + this.name + ", id=" + this.id + ", salary" +
                this.salary;
        return str;
    }
}