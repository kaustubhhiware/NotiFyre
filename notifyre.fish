function notifyre

    set -x timeout 1
    set -x ring_timeout 2
    set -x ALERT /usr/share/sounds/ubuntu/notifications/Slick.ogg
    if test $CMD_DURATION
        if test $CMD_DURATION -gt (math "1000 * $timeout") # time set for notification
            set secs (math "$CMD_DURATION / 1000")
            notify-send "Terminal in "(prompt_pwd) "$history[1] completed in $secs seconds"  -i ~/terminal.png -t 2
        end

        if test $CMD_DURATION -gt (math "1000 * $ring_timeout") # time set for ring
            set secs (math "$CMD_DURATION / 1000")
            paplay $ALERT
        end
    end
end
