#!/bin/bash
# Place the completions in respective directories
# if [[ ${SHELL} == *"bash"* ]]; then
# 	[[ -f ~/.functions-completion.bash ]] && source ~/.functions-completion.bash
# elif [[ ${SHELL} == *"zsh"* ]]; then
# 	[[ -f ~/.functions-completion.zsh ]] && source ~/.functions-completion.zsh
# fi

____foreground_general_eight() {
	printf "General 8 Colors, available from 8 color terminals:\n"
	codetext='\e[38;5;''N''m'
	printf "\tCan also be used as %s for 256 color terminals\n" "${codetext}"
	printf "\t\tWhere N is the color number from {0 to 7}\n\n"
	for i in {0..1}; do
		for j in {0..3}; do
			code=$(echo "30+${i}*4+${j}" | bc)
			codetext='\e['${code}'m'
			printf "%s\t\t\e[%smText\e[0m\t" "${codetext}" "${code}"
		done
		echo
	done
	return 0
}

____foreground_extended_eight() {
	printf "Extended 8 Colors, available from 16 color terminals:\n"
	codetext='\e[38;5;''N''m'
	printf "\tCan also be used as %s for 256 color terminals\n" "${codetext}"
	printf "\t\tWhere N is the color number from {8 to 15}\n\n"
	for i in {0..1}; do
		for j in {0..3}; do
			code=$(echo "30+${i}*4+${j}" | bc)
			codetext='\e['${code}';1m'
			printf "%s\t\e[%s;1mText\e[0m\t" "${codetext}" "${code}"
		done
		echo
	done
	return 0
}

____foreground_rest() {
	echo "Rest of the colors, available from 256 color terminals:"
	echo
	for i in {4..63}; do
		for j in {0..3}; do
			code=$(echo "${i}*4+${j}" | bc)
			codetext='\e[38;5;'${code}'m'
			printf "%s\t\e[38;5;%smText\e[0m\t" "${codetext}" "${code}"
		done
		echo
	done
	return 0
}

____background_extended_eight() {
	printf "Extended 8 Colors, available from 16 color terminals:\n"
	codetext='\e[48;5;''N''m'
	printf "\tCan also be used as %s for 256 color terminals\n" "${codetext}"
	printf "\t\tWhere N is the color number from {8 to 15}\n\n"
	for i in {0..1}; do
		for j in {0..3}; do
			code=$(echo "40+${i}*4+${j}" | bc)
			codetext='\e['${code}'m'
			printf "%s\t\t\e[%smText\e[0m\t" "${codetext}" "${code}"
		done
		echo
	done
	return 0
}

____background_general_eight() {
	printf "General 8 Colors, available from 8 color terminals:\n"
	codetext='\e[48;5;''N''m'
	printf "\tCan also be used as %s for 256 color terminals\n" "${codetext}"
	printf "\t\tWhere N is the color number from {0 to 7}\n\n"
	for i in {0..1}; do
		for j in {0..3}; do
			code=$(echo "40+${i}*4+${j}" | bc)
			codetext='\e['${code}';1m'
			printf "%s\t\e[%s;1mText\e[0m\t" "${codetext}" "${code}"
		done
		echo
	done
	return 0
}

____background_rest() {
	echo "Rest of the colors, available from 256 color terminals:"
	echo
	for i in {4..63}; do
		for j in {0..3}; do
			code=$(echo "${i}*4+${j}" | bc)
			codetext='\e[48;5;'${code}'m'
			printf "%s\t\e[48;5;%smText\e[0m\t" "${codetext}" "${code}"
		done
		echo
	done
	return 0
}

____special_formatting() {
	# Special formatting
	echo "Special formatting:"
	echo
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
	echo
	echo "Combine properties as follows:"
	printf "\tWay 1:\n"
	codetext='\e[1;3;4;5;7;9m'
	printf "\t\t%s\t\e[1;3;4;5;7;9mTest\e[0m\n" "${codetext}"
	printf "\tWay 2:\n"
	codetext='\e[1m\e[3m\e[4m\e[5m\e[7m\e[9m'
	printf "\t\t%s\t\e[1m\e[3m\e[4m\e[5m\e[7m\e[9mTest\e[0m\n" "${codetext}"
	return 0
}

____foreground() {
	if [[ -z "${1}" ]]; then
		____colors_usage
		return 1
	elif [[ "$1" =~ ^[0-9]*$ ]] && [[ "$1" -ge 0 ]] && [[ "$1" -le 255 ]]; then
		codetext='\e[38;5;'${1}'m'
		printf "%s\t\e[38;5;%smText\e[0m\n" "${codetext}" "${1}"
		return 0
	else
		switch=$1
		case ${switch} in
		"g"|"general")
			____foreground_general_eight
			;;
		"e"|"extended")
			____foreground_extended_eight
			;;
		"a"|"all")
			____foreground_general_eight
			echo
			____foreground_extended_eight
			echo
			____foreground_rest
			;;
		*)
			____colors_usage
			return 1
		esac
	fi
}

____background() {
	if [[ -z "${1}" ]]; then
		____colors_usage
		return 1
	elif [[ "$1" =~ ^[0-9]*$ ]] && [[ "$1" -ge 0 ]] && [[ "$1" -le 255 ]]; then
		codetext='\e[48;5;'${1}'m'
		printf "%s\t\e[48;5;%smText\e[0m\n" "${codetext}" "${1}"
		return 0
	else
		switch=$1
		case ${switch} in
		"g"|"general")
			____background_general_eight
			;;
		"e"|"extended")
			____background_extended_eight
			;;
		"a"|"all")
			____background_general_eight
			echo
			____background_extended_eight
			echo
			____background_rest
			;;
		*)
			____colors_usage
			return 1
		esac
	fi
}

colors() {
	if [[ -z "${1}" ]]; then
		____colors_usage
		return 1
	elif [[ -z "${2}" ]] && [[ "$1" =~ ^[0-9]*$ ]] && [[ "$1" -ge 0 ]] && [[ "$1" -le 255 ]]; then
		codetext='\e[38;5;'${1}'m'
		codetext1='\e[48;5;'${1}'m'
		printf "%s\t\e[38;5;%smText\e[0m\t\e[48;5;%smText\e[0m %s\n" "${codetext}" "${1}" "${1}" "${codetext1}"
		return 0
	elif [[ "$1" =~ ^[0-9]*$ ]] && [[ "$1" -ge 0 ]] && [[ "$1" -le 255 ]] && [[ "$2" =~ ^[0-9]*$ ]] && [[ "$2" -ge 0 ]] && [[ "$2" -le 255 ]]; then
		codetext='\e[38;5;'${1}'m\e[48;5;'${2}'m'
		printf "%s\t\e[38;5;%sm\e[48;5;%smText\e[0m\n" "${codetext}" "${1}" "${2}"
		codetext='\e[38;5;'${2}'m\e[48;5;'${1}'m'
		printf "%s\t\e[38;5;%sm\e[48;5;%smText\e[0m\n" "${codetext}" "${2}" "${1}"
		return 0
	else
		case $1 in
		"f"|"foreground")
			____foreground "$2"
			;;
		"b"|"background")
			____background "$2"
			;;
		"s"|"special")
			____special_formatting
			;;
		"-h"|"--help")
			____colors_usage
			return 0
			;;
		*)
			____colors_usage
			return 1
		esac
	fi
}

____colors_usage() {
	echo "TODO"
}

_dotnet_zsh_complete()
{
  local completions=("$(dotnet complete "$words")")

  # If the completion list is empty, just continue with filename selection
  if [ -z "$completions" ]
  then
    _arguments '*::arguments: _normal'
    return
  fi

  # This is not a variable assignment, don't remove spaces!
  _values = "${(ps:\n:)completions}"
}

compdef _dotnet_zsh_complete dotnet
