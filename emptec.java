import java.util.*;
class employee
     {
                 
            int empid;
            String name;
            float salary;
            String address;

 employee()
          {
              continue;
          }
      }

class teacher extends employee
      {
          String department;
          String subjects;

 teacher(int empid,String name,float salary,String address,String department,String subjects)
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

                System.out.println("empid is : "+empid);
                System.out.println("name is : "+name);
                System.out.println("salary is : "+salary);
                System.out.println("address is : "+address);
                System.out.println("department is : "+department);
                System.out.println("subject is : "+subjects);
             }

       }

 class emptec
           {
             public static void main(String args[]){
             Scanner sc=new Scanner(System.in);
             int i,m,t;
             String s,a,b,c;
 
             System.out.print("enter no. of teacher number : ");
             int n=sc.nextInt();

             teacher[] tec=new teacher[n];

             System.out.println("------------------------------------------");
             for (i=0;i<n;i++)
                {
              System.out.print("enter employee id : ");
              m=sc.nextInt();
              System.out.print("enter employee name : ");
              s=sc.next();
              System.out.print("enter employee salary : ");
              t=sc.nextInt();
              System.out.print("enter address  : ");

              c=sc.next();
              System.out.print("enter department  : ");
              a=sc.next();
              System.out.print("enter subject  : ");
              b=sc.next();
              tec[i] = new teacher(m,s,t,c,a,b);
              System.out.println("------------------------------------------");
                }
         
            System.out.println("------------------------recorded of employees----------------");
            for (i=0;i<n;i++){
                              tec[i].display();
                              System.out.println("------------------");
                          }
        }
      }
