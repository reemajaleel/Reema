#Shell script to display the content of a directory file in windows style


term=`tty`

for i in *
do
	
ls -l $i > lsl
exec < lsl
c=0
while read line
do

	for l in $line
	do
		c=`expr $c + 1`
		
		if [ $c -eq 5 ]
		then
			b=$l
		
		elif [ $c -eq 6 ]
		then
			m=$l
		
        elif [ $c -eq 7 ]
        then   
        	d=$l
		 
		elif [ $c -eq 8 ]
		then
        	t=$l
        fi  			
	done
done
	
	if [ -d $i ]
	then
		echo  "$m $d $t\t<DIR>\t $b\t  $i"	   
	else
		echo  "$m $d $t\t     \t $b\t  $i"	
	fi
exec < $term 
done
rm lsl



<<com

ksb@ksb-thinkcentre-edge72:~/Aneetha/Network/Demo$ sh pgm10.sh
May 16 15:39	     30	      abc
May 16 14:58	     166	  demo.sh
Apr 1  15:49	     180	  p1.sh
Apr 2  13:03	     270	  p2.sh
Apr 2  11:34	     194	  p3.sh
May 16 15:46	     535	  pgm10.sh
 
com

