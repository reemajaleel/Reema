case $1 in 
[aeiou]* ) echo "Word begins with lower case vowel" ;;
[AEIOU]* ) echo "Word begins with upper case vowel" ;;
*[0-9] ) echo "End with digit" ;;
??? ) echo "Three letter word" ;;
esac 
