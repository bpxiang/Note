
/**
 * A {@code Card} object represents a playing card, such
 * as "Queen of Hearts". A card has a suit (Diamond, Heart,
 * Spade or Club) and a value (1 = Ace, 2 . . . 10, 11 = Jack,
 * 12 = Queen, 13 = King)
 * @author bupuxiang
 * @version 1.0
 * @since version 1.7.10
 */
public class Card{

    /**
     * The "Hearts" card suit
     */
    public static final int HEARST = 1;
    private double salary;
    /**
     * Raises {@link com.corejava.Employee#raiseSalary(double) BPX} 
     * the salary of an employee.
     * @see com.corejava.Employee#raiseSalary(double)
     * @see <a href="http://www.baidu.com">百度</a>
     * @see "Core Java 2 volume 2"
     * 
     * @param byPercent the percentage by which to raise the salary (e.g. 10 means 10%)
     * @return the amount of the raise
     */
    public double raiseSalary(double byPercent) {
        double raise = salary * byPercent / 100;
        salary += raise;
        return raise;
    }
    public static void mian(String[] args) {

    }
}