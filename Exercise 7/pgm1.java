//Write a user defined exception class to authenticate the user name and password.



import java.util.*;
class myException extends Exception{
	public myException(String s){
		super(s);
	}
}
class pgm1{
	public static void main(String args[]){
		String username="reema";
		String password="Password";
		Scanner sc = new Scanner(System.in);
		System.out.print("Enter Username: ");
		String u=sc.next();
		System.out.print("Enter Password: ");
		String p=sc.next();
		try{
			if((u.equals(username)) && (p.equals(password))){
			throw new myException("Authentication success");
			}
			else{
				throw new myException("Authentication Failed...!");
			}
		}
		catch(myException ex){
		System.out.print(ex.getMessage()+"\n");
		}
	}
}

/*
OUTPUT 1:
Enter Username: reema
Enter Password: Password
Authentication success

OUTPUT 2:
Enter Username: abc
Enter Password: Password
Authentication Failed...!

OUTPUT 3;
Enter Username: reema
Enter Password: abc
Authentication Failed...!
*/
