/*
Create a class ‘Employee’ with data members Empid, Name, Salary, Address and constructors to initialize the data members. 
Create another class ‘Teacher’ that inherit the properties of class employee and contain its own data members department, Subjects taught and constructors to initialize these data members and also include display function to display all the data members.
Use array of objects to display details of N teachers.
*/



import java.util.*;
class Employee
     {
                 
            int empid;
            String name;
            float salary;
            String address;

 void Employee(int empid,String name,float salary,String address)
          {
              this.empid=empid;
              this.name=name;
              this.salary=salary;
              this.address=address;
           }
      }
 

class Teacher extends Employee
      {
          String department;
          String subjects;

 Teacher(int empid,String name,float salary,String address,String department,String subjects)
           {
              this.empid=empid;
              this.name=name;
              this.salary=salary;
              this.address=address;    
              this.department=department;
              this.subjects=subjects;
           }
 void display()
             {

                System.out.println("Empid is : "+empid);
                System.out.println("Name is : "+name);
                System.out.println("Salary is : "+salary);
                System.out.println("Address is : "+address);
                System.out.println("Department is : "+department);
                System.out.println("Subject is : "+subjects);
             }

       }

 class EmpTchr
           {
             public static void main(String args[]){
             Scanner sc=new Scanner(System.in);
             int i,m,t;
             String s,a,b,c;
 
             System.out.print("Enter no. of teachers: ");
             int n=sc.nextInt();

             Teacher[] tec=new Teacher[n];

             System.out.println("------------------------------------------");
             for (i=0;i<n;i++)
                {
              System.out.print("Enter employee id : ");
              m=sc.nextInt();
              System.out.print("Enter employee name : ");
              s=sc.next();
              System.out.print("Enter employee salary : ");
              t=sc.nextInt();
              System.out.print("Enter address  : ");

              c=sc.next();
              System.out.print("Enter department  : ");
              a=sc.next();
              System.out.print("Enter subject  : ");
              b=sc.next();
              tec[i] = new Teacher(m,s,t,c,a,b);
              System.out.println("------------------------------------------");
                }
         
            System.out.println("------------------------Recorded details of employees----------------");
            for (i=0;i<n;i++){
                              tec[i].display();
                              System.out.println("------------------");
                          }
        }
      }