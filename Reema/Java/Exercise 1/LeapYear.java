//Leap year
import java.util.*;

class LeapYear
{
 public static void main (String args[])
{
Scanner input=new Scanner(System.in);
System.out.print("Enter the year : "); 
int y=input.nextInt();
System.out.println("1.January \n2.February \n3.March \n4.April \n5.May \n6.June \n7.July \n8.August \n9.September \n10.October \n11.November \n12.December \nChoose  month  to see number of days from (1-12) : "); 
int m=input.nextInt();
int s;
	if ((y % 400==0) || (y %100!=0) && (y%4==0)) //to check the given year a leap year
	{
	s=1;
	System.out.println(y+" is a leap year "); 
 	}
	else
	{
	s=0;
	System.out.println(y+" is not leap year "); 
	}
switch(m)
{  
case 1:
         System.out.println("January have 31 days");
         break;

case 2:
          if (s==0)
            {
            System.out.println("February have 28 days");
            }
         else
            { 
            System.out.println("February have 29 days");
            }
         break;
case 3:
         System.out.println("March have 31 days");
         break;
case 4:
         System.out.println("April have 30 days");
         break;
case 5:
         System.out.println("May have 31 days");
         break;
case 6:
         System.out.println("June have 30 days");
         break;
case 7:
         System.out.println("July have 31 days");
         break;
case 8:
         System.out.println("August have 31 days");
         break;
case 9:
         System.out.println("September have 30 days");
         break;
case 10:
         System.out.println("October have 31 days");
         break;
case 11:
         System.out.println("November  have 30 days");
         break;
case 12:
         System.out.println("December have 31 days");
         break;
}
}
}


/*

OUTPUT:

Enter the year : 2000
1.January 
2.February 
3.March 
4.April 
5.May 
6.June 
7.July 
8.August 
9.September 
10.October 
11.November 
12.December 
Choose  month  to see number of days from (1-12) : 
1
2000 is a leap year 
January have 31 days

Enter the year : 2000
1.January 
2.February 
3.March 
4.April 
5.May 
6.June 
7.July 
8.August 
9.September 
10.October 
11.November 
12.December 
Choose  month  to see number of days from (1-12) : 
2
2000 is a leap year 
February have 29 days

Enter the year : 2021
1.January 
2.February 
3.March 
4.April 
5.May 
6.June 
7.July 
8.August 
9.September 
10.October 
11.November 
12.December 
Choose  month  to see number of days from (1-12) : 
3
2021 is not leap year 
March have 31 days

Enter the year : 2020
1.January 
2.February 
3.March 
4.April 
5.May 
6.June 
7.July 
8.August 
9.September 
10.October 
11.November 
12.December 
Choose  month  to see number of days from (1-12) : 
4
2020 is a leap year 
April have 30 days

Enter the year : 2019
1.January 
2.February 
3.March 
4.April 
5.May 
6.June 
7.July 
8.August 
9.September 
10.October 
11.November 
12.December 
Choose  month  to see number of days from (1-12) : 
5
2019 is not leap year 
May have 31 days

Enter the year : 2018
1.January 
2.February 
3.March 
4.April 
5.May 
6.June 
7.July 
8.August 
9.September 
10.October 
11.November 
12.December 
Choose  month  to see number of days from (1-12) : 
6
2018 is not leap year 
June have 30 days

Enter the year : 2017
1.January 
2.February 
3.March 
4.April 
5.May 
6.June 
7.July 
8.August 
9.September 
10.October 
11.November 
12.December 
Choose  month  to see number of days from (1-12) : 
7
2017 is not leap year 
July have 31 days

Enter the year : 2017
1.January 
2.February 
3.March 
4.April 
5.May 
6.June 
7.July 
8.August 
9.September 
10.October 
11.November 
12.December 
Choose  month  to see number of days from (1-12) : 
8
2017 is not leap year 
August have 31 days

Enter the year : 2022
1.January 
2.February 
3.March 
4.April 
5.May 
6.June 
7.July 
8.August 
9.September 
10.October 
11.November 
12.December 
Choose  month  to see number of days from (1-12) : 
9
2022 is not leap year 
September have 30 days

Enter the year : 2023
1.January 
2.February 
3.March 
4.April 
5.May 
6.June 
7.July 
8.August 
9.September 
10.October 
11.November 
12.December 
Choose  month  to see number of days from (1-12) : 
10
2023 is not leap year 
October have 31 days

Enter the year : 2024
1.January 
2.February 
3.March 
4.April 
5.May 
6.June 
7.July 
8.August 
9.September 
10.October 
11.November 
12.December 
Choose  month  to see number of days from (1-12) : 
11
2024 is a leap year 
November  have 30 days

Enter the year : 2025
1.January 
2.February 
3.March 
4.April 
5.May 
6.June 
7.July 
8.August 
9.September 
10.October 
11.November 
12.December 
Choose  month  to see number of days from (1-12) : 
12
2025 is not leap year 
December have 31 days

*/
