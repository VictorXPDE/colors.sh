#!/bin/bash

help()
{
	# Shows help
	echo ""
	echo " colors.sh - simple script to change background and foreground color"
	echo ""
	echo " Syntax: colors.sh [-h, --help] [-b|f #XXXXXX]"
	echo " Options:"
	echo " -h, --help	Shows this message."
	echo " -b 		Changes background color."
	echo " -f 		Changes foreground color."
}

# Call getopt to set the options
opts=$(getopt -o hb:f: --long help -- "$@")

# Show error message if total number of arguments = 0
if [ $# == 0 ] ; then 
	echo "Error: Not enough arguments."
	echo 'Type "colors.sh --help" to list all the options available.'
fi
# Evaluate and execute the options
eval set -- "$opts"
while true; do
	case $1 in
		-h | --help) 
			help
			exit ;;
		-b) 
			printf "\033]11;$2\007"
			shift 2 ;;
		-f)
			printf "\033]10;$2\007"
			shift 2 ;;
		--)
			exit ;; # Prevents the error message above from showing
	esac
done
