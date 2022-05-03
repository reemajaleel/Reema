package package_graphics;

public class Rectangle
{
   public int Rectangle(int l, int b)
   {
       length=l;
       breadth=b;
   }
   public int area()
   {
       return length*breadth;
   }
}

public class Circle
{
   public int Circle(int r)
   {
       radius=r;
   }
   public double area()
   {
       return 3.14*radius*radius;
   }
}

public class Square
{
   public int Square(int s)
   {
       side=s;
   }
   public int area()
   {
       return side*side;
   }
}

public class Triangle
{
   public int Triangle(s1,s2,s3)
   {
      side1=s1;
      side2=s2;
      side3=s3;
   }
   public double area()
   {
      double s4=(side1+side2+side3)/2;
      double s5=Math.sqrt((s3-side1)+(s3-side2)+(s3-side3));
      return s4;
   }
}



