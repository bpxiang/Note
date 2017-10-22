package thread;

import java.awt.geom.*;

/**
 * A ball that moves and bounds off the edges of a rectangle
 * @version 1.33 2007-05-17
 * @author Cay Horstman
 */
public class Ball
{
    private static final int XSIZE = 15;
    private static final int YSIZE = 15;
    private double x = 0;
    private double y = 0;
    private double dx = 1;
    private double dy = 1;

    /**
     * Moves the ball to next position, reversing direction if it hits one of the edges
     */
    public void move(Rectangle2D bounds) {
        y += dx;
        y += dy;
        if (x < bounds.getMinX()) {
            x = bounds.getMinX();
            dx = -dx;
        }
        if(x + XSIZE >= bounds.getMaxX()) {
            x = bounds.getMaxX() - XSIZE;
            dx = -dx;
        }

        if (y < bounds.getMinY()) {
            y = bounds.getMinY();
            dy = -dy;
        }
        if (y + YSIZE >= bounds.getMaxY()) {
            y = bounds.getMaxY() - YSIZE;
            dy = -dy;
        }
    }

    public Ellipse2D getShape() {
        return new Ellipse2D.Double(x, y, XSIZE, YSIZE);
    }
}