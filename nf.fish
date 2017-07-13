function nf -d 'alias for `notifyre` to get notification when a task is done'
    # needs notifyre.fish
    # maintained at
    # https://github.com/kaustubhhiware/NotiFyre
    #
    # Author: Kaustubh Hiware (hiwarekaustubh@googlemail.com)
    #
    eval $argv
    eval (notifyre)
end
