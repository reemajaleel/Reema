case $1 in
  [a-z] ) echo "Character is lower case" ;;
  [A-Z] ) echo "Character is upper case" ;;
  [0-9] ) echo "Character is a numeral" ;;
  ? ) echo "It is a special character" ;;
esac
