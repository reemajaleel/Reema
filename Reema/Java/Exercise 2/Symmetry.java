//read a matrix from the console and check whether it is symmetric or not

import java.util.Scanner;

class Symmetry
{	
	public static void main(String args[])
	{
		int rows,cols,i,j;
		Scanner sc = new Scanner(System.in);
		System.out.print("Enter the no. of rows : ");
		rows = sc.nextInt();
		System.out.print("Enter the no. of columns : ");
		cols = sc.nextInt();
		
		int matrix[][] = new int[rows][cols];
		System.out.println("Enter the elements :");
		
		for ( i = 0; i < rows; i++)
		{
			for ( j = 0; j < cols; j++)
			{
				matrix[i][j] = sc.nextInt();
			}
		}
		
		System.out.println("Printing the input matrix :");

		for ( i = 0; i < rows; i++)
		{
			for ( j = 0; j < cols; j++)
			{
				System.out.print(matrix[i][j]+"\t");
			}
			
			System.out.println();
		}
		
		
		//Checking the matrix is symmetric or not
		if(rows != cols)	
		{
			System.out.println("\nThe given matrix is not a square matrix, so not symmetric.");
		}
		else
		{
			boolean symmetric = true;
			
			for ( i = 0; i < rows; i++)
			{
				for ( j = 0; j < cols; j++)
				{
					if(matrix[i][j] != matrix[j][i])
					{
						symmetric = false;
						break;
					}
				}
			}
			
			if(symmetric)
			{
				System.out.println("\nThe given matrix is symmetric.");
			}
			else
			{
				System.out.println("\nThe given matrix is not symmetric.");
			}
		}
		
		sc.close();
	}
}


/*
OUTPUT:

Enter the no. of rows : 3
Enter the no. of columns : 3
Enter the elements :
5
7
1
2
4
8
3
6
9
Printing the input matrix :
5	7	1	
2	4	8	
3	6	9	

The given matrix is not symmetric.




Enter the no. of rows : 3
Enter the no. of columns : 3
Enter the elements :
7
5
1
5
8
3
1
3
4
Printing the input matrix :
7	5	1	
5	8	3	
1	3	4	

The given matrix is symmetric.




Enter the no. of rows : 3
Enter the no. of columns : 2
Enter the elements :
7
5
1
5
6
3
Printing the input matrix :
7	5	
1	5	
6	3	

The given matrix is not a square matrix, so not symmetric.
*/

