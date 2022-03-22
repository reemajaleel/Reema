//program for addition of two matrices
 
import java.io.*;
 
class Matrices {
 
    
    static void printMatrix(int M[][], int rowSize, int colSize) // Function to print Matrix
    {
        for (int i = 0; i < rowSize; i++) {
            for (int j = 0; j < colSize; j++)
                System.out.print(M[i][j] + " ");
 
            System.out.println();
        }
    }
 
     
    static int[][] add(int A[][], int B[][], int size)  // Function to add the two matrices and store in matrix C
    {
        int i, j;
        int C[][] = new int[size][size];
 
        for (i = 0; i < size; i++)
            for (j = 0; j < size; j++)
                C[i][j] = A[i][j] + B[i][j];
 
        return C;
    }
 
    
    public static void main(String args[])
    {
        int size = 4;
 
        int A[][] = { { 1, 1, 1, 1 },
                      { 2, 2, 2, 2 },
                      { 3, 3, 3, 3 },
                      { 4, 4, 4, 4 } };
        
        System.out.println("\nMatrix A:");	// Print the matrices A
        printMatrix(A, size, size);
 
        int B[][] = { { 1, 1, 1, 1 },
                      { 2, 2, 2, 2 },
                      { 3, 3, 3, 3 },
                      { 4, 4, 4, 4 } };
        
        System.out.println("\nMatrix B:");	// Print the matrices B
        printMatrix(B, size, size);
 
        
        int C[][] = add(A, B, size);	// Add the two matrices
 
        
        System.out.println("\nResultant Matrix:");	// Print the result
        printMatrix(C, size, size);
    }
}