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

Output:

	1) Enter the value: 25
	   Positive number

	2) Enter the value: -25
	   Negative number

	3) Enter the value: 200000
	   Positive large number

	4) Enter the value: -200000
	   Negative large number

	5) Enter the value: 0
	   Zero
*/
