case $1 in
cat | dog ) echo "Argument is an animal name"
	;;
whale | shark ) echo "Argument is a fish"
	;;
parrot | crow ) echo "Argument is a bird name"
	;;
* ) echo "Unknown type"
  ;;
esac

