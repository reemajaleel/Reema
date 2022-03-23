import java.util.Scanner;

class Symmetry
{	
	public static void main(String[] args)
	{
		Scanner sc = new Scanner(System.in);
		
		System.out.println("Enter the no. of rows : ");
		
		int rows = sc.nextInt();
		
		System.out.println("Enter the no. of columns : ");
		
		int cols = sc.nextInt();
		
		int matrix[][] = new int[rows][cols];
		
		System.out.println("Enter the elements :");
		
		for (int i = 0; i < rows; i++)
		{
			for (int j = 0; j < cols; j++)
			{
				matrix[i][j] = sc.nextInt();
			}
		}
		
		System.out.println("Printing the input matrix :");
		
		for (int i = 0; i < rows; i++)
		{
			for (int j = 0; j < cols; j++)
			{
				System.out.print(matrix[i][j]+"\t");
			}
			
			System.out.println();
		}
		
		
		
		if(rows != cols)			//Checking the input matrix for symmetric
		{
			System.out.println("The given matrix is not a square matrix, so it can't be symmetric.");
		}
		else
		{
			boolean symmetric = true;
			
			for (int i = 0; i < rows; i++)
			{
				for (int j = 0; j < cols; j++)
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
				System.out.println("The given matrix is symmetric...");
			}
			else
			{
				System.out.println("The given matrix is not symmetric...");
			}
		}
		
		sc.close();
	}
}



/*
Output:

Enter the no. of rows :
3
Enter the no. of columns :
3
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
7     5     1
5     8     3
1     3     4
The given matrix is symmetric…
*/
