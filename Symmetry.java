// Java Program to check whether matrix is symmetric or not
 
import java.util.*;
 
public class Symmetry {


    // Matrix 1
    static void checkSymmetric(int mat[][], int row, int col)	// Method to check whether the matrix is symmetric or asymmetric
    {
        int i, j, flag = 1;
 
        
        System.out.println("The matrix formed is:");
 
        
        for (i = 0; i < row; i++) {		// Outer loop for rows
            
            for (j = 0; j < col; j++) {		// Inner loop for columns
                
                System.out.print(mat[i][j] + "\t");	// Print matrix
            }
 
            System.out.println("");
        }



        // Matrix 2
        int[][] transpose = new int[row][col];		// Finding transpose of the matrix
 
        
        for (i = 0; i < row; i++) {		// Outer loop for rows
 
            
            for (j = 0; j < col; j++) {	// Inner loop for columns
 
                
                transpose[j][i] = mat[i][j];	// Print matrix elements
            }
        }
 
        
 
        if (row == col) {	// Condition check over Matrix 1 with Matrix 2
 
            
            for (i = 0; i < row; i++) {		// Outer loop for rows
 
                
                for (j = 0; j < col; j++) {		// Inner loop for columns
 
                    
                    if (mat[i][j] != transpose[i][j]) {		// Comparing two matrices
                        flag = 0;
                        break;
                    }
                }
 
                
                if (flag == 0) {		// Setting a flag value for symmetric matrix
 
                    
                    System.out.print("\nThe matrix is not symmetric");	
                    break;
                }
            }
 
            
            
            if (flag == 1) {	// Setting a flag value different from above for symmetric matrix
 
                
                System.out.print("\nThe matrix is symmetric");
            }
        }
 
       
        else {	// If it isn't a square matrix then it can't be a symmetric matrix
 
            System.out.print("\nThe matrix is not symmetric");
        }
    }

    public static void main(String args[])
    {
        
        Scanner sc = new Scanner(System.in);
        int i, j, row, col, flag = 1;
 
        System.out.print("Enter the number of rows:");
        row = sc.nextInt();

        System.out.print("Enter the number of columns:");
        col = sc.nextInt();
 
        
        int[][] mat = new int[row][col];	// Declaring a 2D array(matrix)
        System.out.println("Enter the matrix elements:")
 
        
        for (i = 0; i < row; i++) {	// Outer loop for rows
            for (j = 0; j < col; j++) {	// Inner loop for columns
                mat[i][j] = sc.nextInt();	 // Print matrix element
            }
        }
        checkSymmetric(mat, row, col);		// calling function made above to check whether matrix is symmetric or not
    }
}