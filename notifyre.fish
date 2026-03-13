function notifyre -d 'daemon function to provide notifications'
    # can not be called by itself
    # maintained at
    # https://github.com/kaustubhhiware/NotiFyre
    #
    # Author: Kaustubh Hiware (hiwarekaustubh@googlemail.com)
    #
    set -l timeout 1
    set -l ring_timeout 2
    set -l ALERT /System/Library/Sounds/Ping.aiff

    if test $CMD_DURATION
        if test $CMD_DURATION -gt (math "1000 * $timeout") # time set for notification
            set secs (math "$CMD_DURATION / 1000")
            terminal-notifier -title "$history[1]" \
                -subtitle "Terminal in "(prompt_pwd) \
                -message "Completed in $secs seconds"
            # optional: add an `-ignoreDnD` to override Do not disturb..
        end

        if test $CMD_DURATION -gt (math "1000 * $ring_timeout") # time set for ring
            set secs (math "$CMD_DURATION / 1000")
            afplay $ALERT
        end
    end
end
