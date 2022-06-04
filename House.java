/*
Using 2D graphics commands in an Applet, construct a house.
On mouse click event, change the color of the door from blue to red.
*/


import java.awt.*;
import java.awt.event.*;

public class House extends Frame {

	public House() {
		addWindowListener(new WindowAdapter() {
			public void windowClosing(WindowEvent we) {
				System.exit(0);
			}
		});
	}

	// Draw in different colors.
	public void paint(Graphics g)
	{


		g.setColor(Color.yellow);
		g.fillRect(60, 100, 200, 120);


		g.setColor(Color.blue);
		g.fillRect(140, 170, 50, 50);

		g.setColor(Color.red);
		int xs[] = {50,160,270};
		int ys[] = {100,50,100};
		Polygon poly=new Polygon(xs,ys,3);
		g.fillPolygon(poly);


	}

	public static void main(String[] args) {
		House appwin = new House();

		appwin.setSize(new Dimension(340, 260));
		appwin.setTitle("House");
		appwin.setVisible(true);
	}
}

