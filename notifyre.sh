#!/bin/bash

# maintained at 
# /https://github.com/kaustubhhiware/NotiFyre
#
# Author: Kaustubh Hiware (hiwarekaustubh@googlemail.com)
#

notifyre(){
    start=$(date +%s)
    "$@"
    [ $(($(date +%s) - start)) -le 0 ] || notify-send "Terminal process" "$(echo $@) completed in $(($(date +%s) - start)) seconds" -i ~/terminal.png -t 2000
}

# cheap tricks - execute with notifyre, and then return to shell
preexec() { 
	# needs .bash-preexec.sh
    eval "notifyre $1"
	exec $SHELL
}
