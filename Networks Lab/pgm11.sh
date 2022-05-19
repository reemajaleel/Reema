#Shell script to print specified range of lines from given files

if [ $# -ne 3 ]
then 
	echo "syntax error"
	echo "<*.sh filename lowerlimt upperlimit>"
	exit
fi

file=$1
l=$2
u=$3
echo "\n--------------------------------------"
echo "Lines between $l - $u is printed below : \n"

cat $file | head -$u | tail +$l
exit


<<com

---------------------------------------
Lines between 3 - 8 is printed below : 

read n1 n2 n3
if [ $n1 -gt $n2 ]
then
 max=$n1
else
 max=$n2

com
