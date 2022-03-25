//Define a class 'product' with data members pcode, pname and price. 
//Create 3 object of the class and find the product having the lowest price.

import java.util.*;

class product
{
	int pcode;
	String pname;
	double price;
}
	public void input()
	{
		Scanner in = new Scanner(System.in);
 		System.out.println("Enter the product code: ");
		pcode = in.nextInt();
 		System.out.println("Enter the product name: ");
		pname = in.nextInt();
		System.out.println("Enter the price: ");
		price = in.nextInt();
	}
	public void display()
	{
		System.out.println("Product code: "+pcode);
		System.out.println("Product name: "+pname);
		System.out.println("Product price: "+price);
	}



class LowestPrice
{
	public static void main(String[] args)
	{
		product1 = new product();
		product2 = new product();
		product3 = new product();
		product1.input();
		product1.display();
		product2.input();
		product2.display();
		product3.input();
		product3.display();



























		
	


