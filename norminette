#!/bin/bash


function update_docker_image() {

	sudo docker pull ghcr.io/epitech/coding-style-checker:latest | grep -v ""
	STR=$(sudo docker image prune -f | grep -v " 0B")
	if [ -z "$STR" ]; then
		echo "Already up to date."
	else
		echo "Updated :"
		echo "$STR"
	fi
}


function show_help() {

	echo "This program does not need arguments to work."
	echo "Use --update option to update docker image."
	echo "Use --open (C-XX) to go to the coding style pdf."

}


declare -A ERROR_TYPE=( [C-A3]="NO BLANK LINE AT EOF" [C-C1]="TOO MANY NESTING"
			[C-C3]="USE OF 'GOTO'" [C-F2]="FUNCTION NOT IN SNAKE CASE"
			[C-F3]="LINE TOO LONG" [C-F4]="TOO MANY LINES"
			[C-F5]="TOO MANY PARAMETERS" [C-F6]="NO PARAMETERS"
			[C-F8]="COMMENT INSIDE FUNCTION" [C-F9]="NESTED FUNCTION"
			[C-G1]="BAD EPITECH HEADER" [C-G2]="BAD NUMBER OF BLANK LINES BETWEEN FUNCTIONS"
			[C-G3]="BAD PREPROCESSOR DIRECTIVE IDENTATION" [C-G4]="USE OF GLOBAL VARIABLE"
			[C-G5]="FORBIDDEN INCLUDE" [C-G6]="USE OF CARRIAGE RETURN CHAR"
			[C-G7]="SPACE TO A BAD PLACE" [C-G8]="BLANK LINE TO A BAD SPACE"
			[C-H1]="BAD DISTRIBUTION BETWEEN HEADER AND SOURCE" [C-H2]="NO PROTECTION AGAINST DOUBLE INCLUSION"
			[C-L2]="BAD INDENTATION" [C-L3]="MISPLACED SPACE"
			[C-L4]="MISPLACED CURLY BRACKET" [C-O1]="FORBIDDEN FILE"
			[C-O3]="TOO MANY FUNCTIONS" [C-O4]="FILE NOT IN SNAKE CASE"
			[C-V1]="IDENTIFIER NAME NOT IN SNAKE CASE" )


declare -A ERROR_LINK=( [C-A1]=51 [C-A2]=52 [C-A3]=53 [C-C1]=43 [C-C2]=44 [C-C3]=45
			[C-F1]=22 [C-F2]=23 [C-F3]=24 [C-F4]=25 [C-F5]=26 [C-F6]=27
			[C-F7]=28 [C-F8]=29 [C-F9]=30 [C-G1]=12 [C-G2]=13 [C-G3]=14
			[C-G4]=15 [C-G5]=16 [C-G6]=17 [C-G7]=18 [C-G8]=19 [C-G9]=20
			[C-H1]=47 [C-H2]=48 [C-H3]=49 [C-L1]=32 [C-L2]=33 [C-L3]=34
			[C-L4]=35 [C-L5]=36 [C-L6]=37 [C-O1]=6 [C-O2]=7 [C-O3]=8
			[C-O4]=9 [C-V1]=39 [C-V2]=40 [C-V3]=41 )


function show_reports() {

	###   Init Variables   ###

	DELIVERY_DIR=$(readlink -f ".")
	REPORTS_DIR=$(readlink -f ".")
	EXPORT_FILE="$REPORTS_DIR"/coding-style-reports.log


	###   Blank Lines   ###

	echo
	echo


	###   Remove Reports file ###

	rm -f "$EXPORT_FILE" "="


	###   Generate Reports   ###
	
	sudo docker run --rm -i -v "$DELIVERY_DIR":"/mnt/delivery" -v "$REPORTS_DIR":"/mnt/reports" ghcr.io/epitech/coding-style-checker:latest "/mnt/delivery" "/mnt/reports"
	[[ -f "$EXPORT_FILE" ]]


	###   Display Summary   ###
	
	echo -e "\e[1m$(wc -l < "$EXPORT_FILE") coding style error(s) :  \e[31m$(grep -c ": MAJOR:" "$EXPORT_FILE") major\e[37m, \e[33m$(grep -c ": MINOR:" "$EXPORT_FILE") minor\e[37m, \e[36m$(grep -c ": INFO:" "$EXPORT_FILE") info\e[0m"


	###   Edit and Display Reports   ###

	declare -A colors=( [ MAJOR]=31 [ MINOR]=33 [ INFO]=36 )
	FILE=""
	while IFS=: read -r path line lvl error
	do
		if [ "$FILE" != "$path" ];
		then
			echo
			FILE="$path"
		fi
		echo -e "\e[1;${colors[$lvl]}m▅▅\e[0m  $path  l.\e[1m$line\e[0m   ->  \e[1m$error\e[0m  ${ERROR_TYPE[$error]}" | sed 's#./##'
	done < $EXPORT_FILE
	echo


	###   Remove Reports file ###

	rm -f "$EXPORT_FILE" "="	
}

if [ $# == 1 ] && [ $1 == "--update" ]; then
	update_docker_image
elif [ $# == 1 ] && [ $1 == "--open" ]; then
	xdg-open "https://intra.epitech.eu/file/public/technical-documentations/C/epitech_c_coding_style.pdf"
elif [ $# == 2 ] && [ $1 == "--open" ] && [ ${ERROR_LINK[$2]+_} ]; then
	xdg-open "https://intra.epitech.eu/file/public/technical-documentations/C/epitech_c_coding_style.pdf#section*.${ERROR_LINK[$2]}"
elif [ $# -ge 1 ]; then
	show_help
else
	show_reports
fi
