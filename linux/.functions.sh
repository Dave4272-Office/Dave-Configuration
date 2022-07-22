#!/bin/bash
foreground_general_eight() {
	# Foreground colors
	# General 8 colors
	for i in {0..1}; do
    	for j in {0..3}; do
			code=$(echo "30+${i}*4+${j}" | bc)
			codetext='\e['${code}'m'
			printf "%s\t\t\e[%smText\e[0m\t" "${codetext}" "${code}"
		done
		echo
	done
}

foreground_extended_eight() {
	# Foreground colors
	# Extended 8 colors
	for i in {0..1}; do
    	for j in {0..3}; do
			code=$(echo "30+${i}*4+${j}" | bc)
			codetext='\e['${code}';1m'
			printf "%s\t\e[%s;1mText\e[0m\t" "${codetext}" "${code}"
		done
		echo
	done
}

foreground_all() {
	# Foreground colors
	# 256 colors
	for i in {4..63}; do
    	for j in {0..3}; do
			code=$(echo "${i}*4+${j}" | bc)
			codetext='\e[38;5;'${code}'m'
			printf "%s\t\e[38;5;%smText\e[0m\t" "${codetext}" "${code}"
		done
		echo
	done
}

background_extended_eight() {
	# Background colors
	# General 8 colors
	for i in {0..1}; do
    	for j in {0..3}; do
			code=$(echo "40+${i}*4+${j}" | bc)
			codetext='\e['${code}'m'
			printf "%s\t\t\e[%smText\e[0m\t" "${codetext}" "${code}"
		done
		echo
	done
}

background_general_eight() {
	# Background colors
	# Extended 8 colors
	for i in {0..1}; do
    	for j in {0..3}; do
			code=$(echo "40+${i}*4+${j}" | bc)
			codetext='\e['${code}';1m'
			printf "%s\t\e[%s;1mText\e[0m\t" "${codetext}" "${code}"
		done
		echo
	done
}

background_all() {
	# Background colors
	# 256 colors
	for i in {4..63}; do
    	for j in {0..3}; do
			code=$(echo "${i}*4+${j}" | bc)
			codetext='\e[48;5;'${code}'m'
			printf "%s\t\e[48;5;%smText\e[0m\t" "${codetext}" "${code}"
		done
		echo
	done
}

special_formatting() {
	# Special formatting
	codetext='\e[1m'
	printf "%s\t\e[1mTest\e[0m Bold\n" "${codetext}"
	codetext='\e[2m'
	printf "%s\t\e[2mTest\e[0m Light\n" "${codetext}"
	codetext='\e[3m'
	printf "%s\t\e[3mTest\e[0m Italic\n" "${codetext}"
	codetext='\e[4m'
	printf "%s\t\e[4mTest\e[0m Underline\n" "${codetext}"
	codetext='\e[5m'
	printf "%s\t\e[5mTest\e[0m Blink\n" "${codetext}"
	codetext='\e[7m'
	printf "%s\t\e[7mTest\e[0m Invert\n" "${codetext}"
	codetext='\e[8m'
	printf "%s\t\e[8mTest\e[0m Hide\n" "${codetext}"
	codetext='\e[9m'
	printf "%s\t\e[9mTest\e[0m Strike\n" "${codetext}"

	echo "Combine properties as follows:"
	printf "\tWay 1:\n"
	codetext='\e[1;3;4;5;7;9m'
	printf "\t\t%s\t\e[1;3;4;5;7;9mTest\e[0m\n" "${codetext}"
	printf "\tWay 2:\n"
	codetext='\e[1m\e[3m\e[4m\e[5m\e[7m\e[9m'
	printf "\t\t%s\t\e[1m\e[3m\e[4m\e[5m\e[7m\e[9mTest\e[0m\n" "${codetext}"
}

colors() {
	case $1 in
		"foreground")
			if [[ -z $2 ]]; then
				foreground_all
			else
				case $2 in
					"general")
						foreground_general_eight
						;;
					"extended")
						foreground_extended_eight
						;;
					"all")
						foreground_all
						;;
					*)
						echo "Usage: $0 foreground"
						echo "Usage: $0 foreground all"
						echo "Usage: $0 foreground extended"
						echo "Usage: $0 foreground general"
						;;
				esac
			fi
			;;
		"background")
			if [[ -z $2 ]]; then
				foreground_all
			else
				case $2 in
					"general")
						background_general_eight
						;;
					"extended")
						background_extended_eight
						;;
					"all")
						background_all
						;;
					*)
						echo "Usage: $0 background"
						echo "Usage: $0 background all"
						echo "Usage: $0 background extended"
						echo "Usage: $0 background general"
						;;
				esac
			fi
			;;
		"special")
			special_formatting
			;;
		*)
			echo "Usage: $0 background"
			echo "Usage: $0 background all"
			echo "Usage: $0 background extended"
			echo "Usage: $0 background general"
			echo "Usage: $0 foreground"
			echo "Usage: $0 foreground all"
			echo "Usage: $0 foreground extended"
			echo "Usage: $0 foreground general"
			echo "Usage: $0 special"
			;;
	esac
}
