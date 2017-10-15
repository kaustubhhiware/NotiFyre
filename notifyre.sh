#!/bin/bash

# maintained at
# https://github.com/kaustubhhiware/NotiFyre
#
# Author: Kaustubh Hiware (hiwarekaustubh@googlemail.com)
#

SOUND=1
SOUND_MIN=10
ALERT=/usr/share/sounds/ubuntu/notifications/Slick.ogg
MIN_INTERVAL=4

notifyre() {
  start=$(date +%s)
  commandx=$@
  "$@"

  notif_timer
}
alias nf='notifyre'

# plain printer,
notif_timer() {

  # check for new terminal condition, start is unitialised ? set it to current time
  if [ -z $start ]; then
    start=$(date +%s)
  fi

  end=$(date +%s)
  elapsed=$((end - start))

  if [[ "$RETVAL" -ne 0 ]]; then
    command_status="\u274c"
  else
    command_status="\u2705"
  fi

  if [ "$elapsed" -gt "$MIN_INTERVAL" ]; then
    if [ "$(uname -s)" = "Darwin" ]; then
      # Use terminal-notifier for Mac OS
      terminal-notifier -title "NotiFyre $(echo $command_status)" \
        -subtitle "Command : $commandx" \
        -message "Completed in $elapsed seconds" \
        -timeout 5 \
        -closeLabel "Gotcha!"
    else
      # Use notify-send for others
      notify-send "NotiFyre $(echo -e $command_status)" \
        "Completed $commandx in $elapsed seconds" \
        -i utilities-terminal \
        -t 5000
    fi

    if [ "$SOUND" -eq 1 ] && [ "$elapsed" -gt "$SOUND_MIN" ]; then
        paplay $ALERT &> /dev/null || echo -en "\a";
    fi
  fi
}

# needs .bash-preexec.sh
# if you wish not to get notified for all processes, comment the line
# source ~/.bash-preexec.sh # as close to the end as possible in ~/.bashrc

preexec() {
  commandx="$1"
  start=$(date +%s)
}

precmd() {
  notif_timer
}
