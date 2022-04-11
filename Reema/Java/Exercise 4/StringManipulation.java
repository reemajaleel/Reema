/*
Write a program to illustrate the following String manipulation
methods.
1. Create new strings using new.
2. Getting String length
3. String Concatenation
4. Character extraction
5. String Comparison
6. Searching substrings
7. Modifying a string
8. Data conversion using valueOf()
*/

import java.util.*;

class StringManipulation
{
	public static void main(String args[])
	{
		//new string using new
		char chs[] = {'w','e','l','c','o','m','e'};
		String newStr = new String(chs);
		System.out.println("New string from char[] using new String: "+newStr);

		byte asciis[] = {65, 66, 67, 68, 69, 70};
		newStr = new String (asciis);
		System.out.println("New string from byte[] using new String: "+newStr);

		String s1 = "good";
		String s2 = "Morning";

		//String length
		System.out.println("String length of 'good': "+ s1.length());

		//to uppercase and lowercase
		System.out.println("--------String Change--------");
		System.out.println(s1 + " to uppercase: "+ s1.toUpperCase());
		System.out.println(s2 + " to lowercase: "+ s2.toLowerCase());

		//String concatination
		System.out.println("--------String Concatination--------");
		System.out.println("Using concat(): "+ s1.concat(s2));
		System.out.println("Using + operator: "+ s1 + s2);

		//Character extraction
		System.out.println("--------Character Extraction--------");
		System.out.println("Character at 3rd position: "+ s1.charAt(3));
		char c[] = new char[5];
		s1.getChars(2,4,c,0);
		System.out.println("Character between 2 and 4 : "+ new String(c));

		//Character comparison
		System.out.println("--------Character Comparison--------");
		s1 = "welcome";
		s2 = "WELCOME";
		System.out.println(s1 + " Equals " + s2 + " : " + s1.equals(s2));
		System.out.println(s1 + " equalsIgnoreCase " + s2 + " : " + s1.equalsIgnoreCase(s2));

		System.out.println(s1 + " compareTo " + s2 + " : " + s1.compareTo(s2));
		System.out.println(s1 + " compareToIgnoreCase " + s2 + " : " + s1.compareToIgnoreCase(s2));

		System.out.println(s1 + " startsWith w : " + s1.startsWith("w"));
		System.out.println(s1 + " endsWith x : " + s1.endsWith("x"));

		//Search substrings
		System.out.println("--------Search Substrings--------");




	}
}
