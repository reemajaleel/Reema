//program to read a floating-point number and if the number is zero it prints "zero", otherwise , print "positive" or "negative". Add "small" if the absolute value of the number is less than 1, or "large" if it exceeds 100000.


import java.util.*;

class FloatingPointNumber{
public static void main(String args[]){

Scanner in = new Scanner(System.in);
System.out.print("Enter the value: ");
double input = in.nextDouble();

		if(input > 0)	//to check positive number
		{
			if(input < 1)	//to check positive small number
			{
			System.out.println("Positive small number");
			}

			else if(input > 100000)		//to check positive large number
			{
				System.out.println("Positive large number");
			}
			else
			{
				System.out.println("Positive number");
			}
		}
		else if(input < 0)	//to check negative number
		{
			if(Math.abs(input) < 1)		//to check negative small number
			{
				System.out.println("Negative small number");
			}
			else if(Math.abs(input) > 100000)	//to check negative large number
			{
				System.out.println("Negative large number");
			}
			else
			{
				System.out.println("Negative number");
			}
		}
		else
		{
			System.out.println("Zero");
		}
	}
}



/*

OUTPUT:

Enter the value: 25
Positive number

Enter the value: -25
Negative number

Enter the value: 200000
Positive large number

Enter the value: -200000
Negative large number

Enter the value: 0.5
Positive small number

Enter the value: -0.5
Negative small number

Enter the value: 0
Zero
*/
