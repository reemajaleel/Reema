import java.awt.*;
import java.awt.event.*;

public class TextFieldDemo extends Frame
implements ActionListener {

TextField num1, num2,num3,msg1,msg2,msg3;

public TextFieldDemo() {
// Use a flow layout.
setLayout(new FlowLayout());

// Create controls.
Label namep = new Label("Enter Three Numbers: ",Label.RIGHT);

num1 = new TextField(12);
num2 = new TextField(12);
num3 = new TextField(12);

// Add the controls to the frame.
add(namep);
add(num1);
add(num2);
add(num3);

// Add action event handlers.
num1.addActionListener(this);
num2.addActionListener(this);
num3.addActionListener(this);

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
g.drawString("Number1: " + num1.getText(),20, 100);
g.drawString("Number2: " + num2.getText(),100, 100);
g.drawString("Number3: " + num3.getText(),220, 100);

}

public static void main(String[] args) {
TextFieldDemo appwin = new TextFieldDemo();

appwin.setSize(new Dimension(380, 180));
appwin.setTitle("TextFieldDemo");
appwin.setVisible(true);
}
}
