//Write a menu driven program that would choose either in-build method or call a user defined method to sort an array of strings.


import java.util.*;


class Sort
{
	public static void main(String args[])
	{

		String arr[] = {"Java","is","an","object","oriented","programming","language"};
		for( int i = 0; i < arr.length; i++ );
		{
			for( int j = i+1; j < arr.length; j++ )
			{
				if( arr[j].compareTo(arr[i]) < 0 )
				{
					String s = arr[i];
					arr[i] = arr[j];
					arr[j] = s;
				}
			}
		System.out.println(arr[i]);
		}
	}
}
