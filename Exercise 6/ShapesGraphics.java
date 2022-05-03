import package_graphics.*;
import java.util.*;

public class ShapesGraphics {
    public static void main(String []args){
        package_graphics testObj = new package_graphics();


		Scanner sc = new Scanner(System.in);
		System.out.println("Enter the length of rectangle : ");
		int a = sc.nextInt();
		System.out.println("Enter the breadth of rectangle : ");
		int b = sc.nextInt();
		Rectangle re = new Rectangle(a,b);
		System.out.println("Area of rectangle : "+re.area());
		

		System.out.println("Enter the radius of circle : ");
		int r = sc.nextInt();
		Circle ci = new Circle(r);
		System.out.println("Area of circle : "+ci.area());


		System.out.println("Enter the side of square : ");
		int s = sc.nextInt();
		Square sq = new Square(s);
		System.out.println("Area of square : "+sq.area());

		
		System.out.println("Enter the side1 of triangle : ");
		int s1 = sc.nextInt();
		System.out.println("Enter the side2 of triangle : ");
		int s2 = sc.nextInt();
		System.out.println("Enter the side3 of triangle : ");
		int s3 = sc.nextInt();
		Triangle tr = new Triangle(s1,s2,s3);
		System.out.println("Area of rectangle : "+tr.area());


        System.out.println(testObj.recArea(1,2));
        System.out.println(testObj.cirArea(10));
        System.out.println(testObj.squArea(10));
        System.out.println(testObj.triArea(10,2));
    }
}