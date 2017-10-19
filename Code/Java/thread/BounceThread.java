package thread;

import java.awt.*;
import java.awt.event.*;

import javax.swing.*;

/**
 * Shows animated bouncing balls.
 * @version 1.34 2015-06-21
 * @author Cay Horstman
 */
public class BounceThread
{
    public static void main(String[] args)
    {
        EventQueue.invokeLater(() -> {

        });
    }
}

/**
 * The frame with panel and buttons
 */
class BounceFrame extends JFrame
{
    private BallComponent comp;
}
