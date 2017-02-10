# NotiFyre

It's lit :fire:

Notify when a terminal task is done

![Image could not be displayed](thumbnail_fish.png)

<!---(https://drive.google.com/open?id=0B5iU6cWw36rObk9tNDEwNmhjTzA) --->

Video speed up x2 in the [video](https://drive.google.com/open?id=0B5iU6cWw36rObk9tNDEwNmhjTzA)

install dependencies first :

(Generally preinstalled in most working systems.Works perfectly on a fresh
    install of ubutnu 16.04)

`sudo apt-get install notify-osd pulseaudio-utils libnotify-bin`

The following steps will differ according to the shell
you use. Currently supported for bash and fish.

## Bash shell

Place both the .sh file and the image in your home folder.
Now you need to configure your terminal config file accordingly :
`sudo subl ~/.bashrc `

Add these lines there :

<pre style="background: rgb(238, 238, 238); border: 1px solid rgb(204, 204, 204); padding: 5px 10px;">
source ~/notifyre.sh
source ~/bash-preexec.sh # as close to end as possible</pre>

These 2 lines should be as close to the end of the file
as possible. If you do not want to run this for each
command, then add only the first line.

The second file is written by Ryan Caloras and the source for that could be found [here](https://github.com/rcaloras/bash-preexec).
* zsh configuration may differ(?)

## Fish shell

Similar to bash, you will need to place the [terminal.png](../terminal.png) file
in your home folder.

Place the `prompt_pwd.fish`, `notifyre.fish` and `nf.fish` in your
`~/.config/fish/functions/` folder.

Now to be notified for each process, add this to your `functions/fish_prompt.fish`
file just before the end :

<pre style="background: rgb(238, 238, 238); border: 1px solid rgb(204, 204, 204); padding: 5px 10px;">function fish_prompt
    ...

    eval (notifyre)  # at the very end
end</pre>

Now, this method works pretty well with my **bobthefish** theme and no theme as
well. Let me know if it doesn't work out for you.


* Alternatively, if you want to be notified only for select commands, you do
not need to modify the `fish_prompt.fish` file.

 Run with `nf command`

 [This might take slightly more time than the process to complete execution.]

You can learn to write you own functions in fish with
  [this](https://fishshell.com/docs/current/tutorial.html) as a starting point.
  The working files can be found [in my
  dotfiles](https://github.com/kaustubhhiware/dotfiles/tree/master/fish).


# Usage

The changes made will be reflected in a new terminal.
* Alternatively, you use in the same terminal , `source ~/.bashrc` and then
 proceed.

Each command should work with the notifications, if it fails, a workaround could
 be - `notifyre sleep 2` or simply `nf sleep 2`

# Configure

<pre style="background: rgb(238, 238, 238); border: 1px solid rgb(204, 204, 204); padding: 5px 10px;">
[ $(($(date +%s) - start)) -le 0 ] || notify-send "Terminal process" "$(echo $@) completed in $(($(date +%s) - start)) seconds" -i ~/terminal.png -t 2000</pre>

The above line in notifyre.sh can be changed to your convenience.

* `-le 0`  notifies for commands which are completed in more than 0 seconds.Can
change to 2, 3 seconds.

* ` "Terminal process" ` is the title of the notification.

* `̶ ̶t̶ ̶2̶0̶0̶0̶`̶ ̶m̶e̶a̶n̶s̶ ̶t̶h̶e̶ ̶n̶o̶t̶i̶f̶i̶c̶a̶t̶i̶o̶n̶ ̶l̶a̶s̶t̶
s̶ ̶f̶o̶r̶ ̶2̶0̶0̶0̶ ̶m̶i̶l̶l̶i̶s̶e̶c̶o̶n̶d̶s̶.[An incorrect design decision is a bug](http://askubuntu.com/questions/110969/notify-send-ignores-timeout)

* Provide your own notification tone by editing this line.
`ALERT=/usr/share/sounds/ubuntu/notifications/Slick.ogg`



Note:  The notifications appear in a queue, and cannot be implemented parallely.
 (Known bug in notify-send).

Alternatively, you could force-kill notifications when the next one is ready by
adding this line at the top of `notif()` - `killall notify-osd` but the results aren't consistent. So yeah, one at a time.

# Why this
I had to reinstall Ubuntu quite a number of times thanks to how awesome Windows
messed up my laptop. This script seeks to help anyone who multi-tasks, or does
not constantly check their terminals. [ntfy](https://github.com/dschep/ntfy)
wasn't consistent always, so made this.

Tested on fresh install of Ubuntu 16.04, and on Arch Linux. Ubuntu 14 may
require [Slick.ogg](Slick.ogg) whose path must be changed before usage.

# Not working/ Message not displayed
check if notify-osd is working with this - `notify-send "hi"`

If no message pops up, it means notify-osd has stopped working. Try this -
`sudo apt-get --reinstall install libnotify-bin notify-osd` and then try testing.

For further customization, visit this [link](http://ubuntuhandbook.org/index.php/2014/04/customize-on-screen-notification-ubuntu-1404/)

Any suggestions? Make an issue about it.
