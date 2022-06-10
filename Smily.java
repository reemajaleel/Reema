import java.awt.*;
import java.awt.event.*;

public class Smily extends Frame
implements ActionListener {

TextField subj1,subj2,subj3,subj4,subj5;

public Smily() {
// Use a flow layout.
setLayout(new FlowLayout());

// Create controls.
Label namep = new Label("Enter Three Numbers: ",Label.RIGHT);

subj1 = new TextField(12);
subj2 = new TextField(12);
subj3 = new TextField(12);
subj4 = new TextField(12);
subj5 = new TextField(12);

// Add the controls to the frame.
add(namep);
add(subj1);
add(subj2);
add(subj3);
add(subj4);
add(subj5);

// Add action event handlers.
subj1.addActionListener(this);
subj2.addActionListener(this);
subj3.addActionListener(this);
subj4.addActionListener(this);
subj5.addActionListener(this);

addWindowListener(new WindowAdapter() {
public void windowClosing(WindowEvent we) {
System.exit(0);
}
});
}

// User pressed Enter.
public void actionPerformed(ActionEvent ae) {
repaint();
}

public void paint(Graphics g) {
g.drawString("ADBMS: " + subj1.getText(),20, 110);
g.drawString("AOS: " + subj2.getText(),20, 130);
g.drawString("AI: " + subj3.getText(),20, 150);
g.drawString("ACN: " + subj4.getText(),20, 170);
g.drawString("Java: " + subj5.getText(),20, 190);
int a=Integer.parseInt(subj1.getText());
int b=Integer.parseInt(subj2.getText());
int c=Integer.parseInt(subj3.getText());
int d=Integer.parseInt(subj4.getText());
int e=Integer.parseInt(subj5.getText());


}

public static void main(String[] args) {
Smily appwin = new Smily();

appwin.setSize(new Dimension(600, 600));
appwin.setTitle("TextField_Program");
appwin.setVisible(true);
}
}
