function notifyre -d 'daemon function to provide notifications'
    # can not be called by itself
    # maintained at
    # https://github.com/kaustubhhiware/NotiFyre
    #
    # Author: Kaustubh Hiware (hiwarekaustubh@googlemail.com)
    #
    set -x timeout 1
    set -x ring_timeout 2
    set -x ALERT /usr/share/sounds/ubuntu/notifications/Slick.ogg
    set -x ICON utilities-terminal
    # if test $status # if last process did not exit properly, show error image
    #  set ICON dialog-error
    # end

    if test $CMD_DURATION
        if test $CMD_DURATION -gt (math "1000 * $timeout") # time set for notification
            set secs (math "$CMD_DURATION / 1000")
            command notify-send "Terminal in "(prompt_pwd) "$history[1] completed in $secs seconds"  -i $ICON -t 2
        end

        if test $CMD_DURATION -gt (math "1000 * $ring_timeout") # time set for ring
            set secs (math "$CMD_DURATION / 1000")
            command paplay $ALERT
        end
    end
end
