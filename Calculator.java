import java.awt.*;
import java.awt.event.*;


public class Calculator extends Frame implements ActionListener {
String msg = "";
TextField num1, num2;
Button Addition, Subtraction, Multiplication, Division;

public Calculator() {
// Use a flow layout.
setLayout(new FlowLayout());
Additon = new Button("Addition");
Subtraction = new Button("Subtraction");
Multiplication = new Button("Multiplication");
Division = new Button("Division");

// Create controls.
Label namep = new Label("Enter Two Numbers: ",Label.RIGHT);

num1 = new TextField(12);
num2 = new TextField(12);


// Add the controls to the frame.
add(namep);
add(num1);
add(num2);
add(Addition);
add(Subtraction);
add(Multiplication);
add(Division);

// Add action event handlers.
num1.addActionListener(this);
num2.addActionListener(this);
Addition.addActionListener(this);
Subtraction.addActionListener(this);
Multiplication.addActionListener(this);
Division.addActionListener(this);

addWindowListener(new WindowAdapter() {
public void windowClosing(WindowEvent we) {
System.exit(0);
}
});
}

// User pressed Enter.
public void actionPerformed(ActionEvent ae) {
String str = ae.getActionCommand();
if(str.equals("Addition")) {
msg = "aaaaaaa";
}

repaint();
}

public void paint(Graphics g) {
g.drawString("Number1: " + num1.getText(),20, 100);
g.drawString("Number2: " + num2.getText(),140, 100);

int x=Integer.parseInt(num1.getText());
int y=Integer.parseInt(num2.getText());


}

public static void main(String[] args) {
Calculator appwin = new Calculator();

appwin.setSize(new Dimension(600, 600));
appwin.setTitle("Calculator");
appwin.setVisible(true);
}
}
