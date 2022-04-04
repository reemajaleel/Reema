#read 3 nos and find largest
echo "Enter 3 numbers : "
read n1 n2 n3
if [ $n1 -gt $n2 ]
then
 max=$n1
else
 max=$n2
fi
if [ $n3 -gt $max ]
then
 max=$n3
fi
echo "Largest is $max"
exit 0
