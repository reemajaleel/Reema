#Shell script to delete all lines if a file containing word linux


if [ $# -ne 0 ]
then
	echo "syntax error"
	exit
fi

echo " Enter the file name:"
read file

term=`tty`
exec < $file

while read line
do
echo $line | grep linux > file2
	if [ $? -eq 0 ]
	then
		continue
	fi	
	echo $line >> file1
done

mv file1 $file
rm file2
exec < $term


<<com

ksb@ksb-thinkcentre-edge72:~/Aneetha/Network/Demo$ cat abc
hai
welcome 
to
ubuntu
linux
windows
linux

ksb@ksb-thinkcentre-edge72:~/Aneetha/Network/Demo$ sh pgm9.sh
Enter the file name:
abc

ksb@ksb-thinkcentre-edge72:~/Aneetha/Network/Demo$ cat abc
hai
welcome
to
ubuntu
windows
 
com
