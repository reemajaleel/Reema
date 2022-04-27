echo "enter side a"
read a
echo "enter side b"
read b
echo "enter side c"
read c
p=`expr $a + $b`
q=`expr $a + $c`
r=`expr $b + $c`
if [ $p -gt $c ] || [ $q -gt $b ] || [ $r -gt $a ]
then
echo yes
else
echo no
fi

