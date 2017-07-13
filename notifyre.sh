#!/bin/bash

# maintained at
# https://github.com/kaustubhhiware/NotiFyre
#
# Author: Kaustubh Hiware (hiwarekaustubh@googlemail.com)
#


notifyre(){
    start=$(date +%s)
    "$@"
	ALERT=/usr/share/sounds/ubuntu/notifications/Slick.ogg

	i="$IFS";IFS='/';set -f;p=($PWD);set +f;IFS="$i"; # echo "${p[-1]}"
    [ $(($(date +%s) - start)) -le 0 ] || notify-send "Terminal in ${p[-2]}/${p[-1]} \$" "$(echo $@) completed in $(($(date +%s) - start)) seconds" -i utilities-terminal -t 50
    # using gtk icons available
	[ $(($(date +%s) - start)) -le 1 ] || paplay $ALERT

}
alias nf='notifyre'

# plain printer,
notif_timer() {

	ALERT=/usr/share/sounds/ubuntu/notifications/Slick.ogg

	# check for new terminal condition, start is unitialised ? set it to current time
	if [ -z $start ]
		then start=$(date +%s)
	fi
	i="$IFS";IFS='/';set -f;p=($PWD);set +f;IFS="$i"; # echo "${p[-1]}"
    [ $(($(date +%s) - start)) -le 0 ] || notify-send "Terminal in ${p[-2]}/${p[-1]} \$" "$commandx completed in $(($(date +%s) - start)) seconds" -i ~/terminal.png -t 50
	[ $(($(date +%s) - start)) -le 1 ] || paplay $ALERT

}

# needs .bash-preexec.sh
# if you wish not to get notified for all processes, comment the line
# source ~/.bash-preexec.sh # as close to the end as posisble in bashrc

preexec() {

	commandx="$1"
	start=$(date +%s)

}

precmd() {

	notif_timer
}
