//Cube of a number upto a given integer

import java.util.*;

class Cube{

public static void main(String args[])
{
 Scanner m=new Scanner(System.in);
 System.out.print("Enter the number : ");
 int n=m.nextInt();
 		for(int i=0;i<=n;i++) 
		{
 		int s=i*i*i;
 		System.out.println("Cube of "+i+" = "+s);	//to print the cube
		}
	}
}


/*
OUTPUT:

Enter the number : 5
Cube of 0 = 0
Cube of 1 = 1
Cube of 2 = 8
Cube of 3 = 27
Cube of 4 = 64
Cube of 5 = 125

Enter the number : 10
Cube of 0 = 0
Cube of 1 = 1
Cube of 2 = 8
Cube of 3 = 27
Cube of 4 = 64
Cube of 5 = 125
Cube of 6 = 216
Cube of 7 = 343
Cube of 8 = 512
Cube of 9 = 729
Cube of 10 = 1000
*/
