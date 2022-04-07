//program that accepts three numbers from the user and prints "increasing" if the numbers are in increasing order, "decreasing" if the numbers are in decreasing order, and "Neither increasing or decreasing order" otherwise.


import java.util.*;

class Sort{

public static void main(String args[])
{
 Scanner m=new Scanner(System.in);
 System.out.print("Enter the  three number : ");
 int a=m.nextInt();
 int b=m.nextInt();
 int c=m.nextInt();
  
 		if (a < b & b < c) //to check the numbers are in increasing order
 		{
   		System.out.println(" Increasing order");
 		}
 		else if(a > b & b > c ) //to check the numbers are in decreasing order
 		{
  		System.out.println(" Decreasing order");
 		}
 		else
 		{
  		System.out.println(" Non sequential order");
 		}
	}
}



/*
OUTPUT:

Enter the  three number : 1 
2 
3 
 Increasing order

Enter the  three number :  5 
3 
2
 Decreasing order

Enter the  three number : 3 
6 
4
 Non sequential order

*/
