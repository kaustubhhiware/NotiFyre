#!/bin/bash

# maintained at 
# /https://github.com/kaustubhhiware/NotiFyre
#
# Author: Kaustubh Hiware (hiwarekaustubh@googlemail.com)
#


notifyre(){
    start=$(date +%s)
    "$@"
	ALERT=/usr/share/sounds/ubuntu/notifications/Slick.ogg

	i="$IFS";IFS='/';set -f;p=($PWD);set +f;IFS="$i"; # echo "${p[-1]}"
    [ $(($(date +%s) - start)) -le 0 ] || notify-send "Terminal in ${p[-2]}/${p[-1]} \$" "$(echo $@) completed in $(($(date +%s) - start)) seconds" -i ~/terminal.png -t 50
	[ $(($(date +%s) - start)) -le 1 ] || paplay $ALERT
	
}

# cheap tricks - execute with notifyre, and then return to shell
preexec() { 
	# needs .bash-preexec.sh
    eval "notifyre $1"
	exec $SHELL
}
