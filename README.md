# NotiFyre
[![MIT Licence](https://badges.frapsoft.com/os/mit/mit.png?v=103)](https://opensource.org/licenses/mit-license.php) [![Bash Shell](https://badges.frapsoft.com/bash/v1/bash.png?v=103)](https://github.com/ellerbrock/open-source-badges/)

It's lit :fire:

Notify when a terminal task is done

![Image could not be displayed](thumbnail_fish.png)

[Sample working video](https://drive.google.com/open?id=0B5iU6cWw36rObk9tNDEwNmhjTzA), sped up at x2.

Install dependencies first :

- For Mac OS - `brew install terminal-notifier`
- For Ubuntu - `sudo apt-get install notify-osd pulseaudio-utils libnotify-bin`

**Note:** The above dependencies are generally installed on most systems.

Notifyre has been tested on a fresh install of Ubuntu 16.04 running bash, zsh or fish. If you have managed to port this script to another shell or another OS, please open a pull request with the instructions for the same and we will update the README! Got some coverage [here](https://www.ostechnix.com/get-notification-terminal-task-done/).

## Table of Contents

- [Bash / ZSH](#bash--zsh)
  - [Setup](#setup)
  - [Configuration](#configuration)
- [Fish shell](#fish-shell)
  - [Setup](#setup-1)
  - [Configuration](#configuration-1)
- [Why This](#why-this)
- [Contributing](#contributing)
- [Debugging](#debugging)
- [Acknowledgements](#acknowledgements)
- [License](#license)

## Bash / ZSH
[(Back to top)](#table-of-contents)

### Setup

* Place `notifyre.sh` & `bash-preexec.sh` in your home folder

    ```sh
    git clone https://github.com/kaustubhhiware/NotiFyre.git
    cd NotiFyre
    cp notifyre.sh bash-preexec.sh ~
    ```

* :zap: Lightning fast alternative: Pull only these two files from GitHub!

    ```
    curl https://raw.githubusercontent.com/kaustubhhiware/NotiFyre/master/notifyre.sh -o ~/notifyre.sh
    curl https://raw.githubusercontent.com/rcaloras/bash-preexec/master/bash-preexec.sh -o ~/bash-preexec.sh
    ```


 * Add the following lines to the end of `~/.bashrc` or `~/.zshrc`:

    ```sh
    # as close to the end as possible
    source ~/notifyre.sh
    source ~/bash-preexec.sh
    ```

    **Note:** These 2 lines should be added as close to the end of the file as possible.

* If you do not want to be notified for each command, then add only this to the end of your rc file:

    ```sh
    source ~/notifyre.sh
    ```

    To get a notification for a command in this case, you need to run it as `nf <command>`

### Configuration
 [(Back to top)](#table-of-contents)
 ```sh
 SOUND=1
 SOUND_MIN=10
 ALERT=/usr/share/sounds/ubuntu/notifications/Slick.ogg
 MIN_INTERVAL=4
 ```

 There are four configurable options in NotiFyre:

 1. `SOUND`

    **Options:** 0 or 1

    **Utility:** SOUND=1 will play an alert sound for each notification that
    takes more time than `SOUND_MIN` seconds. This value is a boolean.

 2. `SOUND_MIN`

    **Valid values:** 1, 2, 3 ...

    **Utility:** Let's you configure the minimum amount of time a command must
    take for it to trigger a sound notification. (If `SOUND=0`, then no sound
    notification will be played) This value is in seconds.

 3. `ALERT`

    **Options:** Path to a sound file

    **Utility:** The sound file will be played whenever `SOUND=1`
    and a command has taken more time than `SOUND_MIN` seconds. If the sound
    file does not exist, it plays an audible-bell sound (varies by terminal)
    as a fallback.

 4. `MIN_INTERVAL`


    **Options:** 1, 2, 3, ...

    **Utility:** An option to configure the minimum amount of time that a
    command must take in order to trigger a notification. This value is in
    seconds.

## Fish shell
[(Back to top)](#table-of-contents)

### Setup

* Place the *prompt_pwd.fish*, _notifyre.fish_ and _nf.fish_ in  your `~/.config/fish/functions/` folder.
  ```
  git clone https://github.com/kaustubhhiware/NotiFyre.git
  cd NotiFyre
  cp prompt_pwd.fish notifyre.fish nf.fish ~/.config/fish/functions/
  ```

* :zap: Lightning fast alternative:

   ```sh
   # Pull the files from Github
   curl https://raw.githubusercontent.com/kaustubhhiware/NotiFyre/master/prompt_pwd.fish -o ~/.config/fish/functions/prompt_pwd.fish
   curl https://raw.githubusercontent.com/kaustubhhiware/NotiFyre/master/notifyre.fish -o ~/.config/fish/functions/notifyre.fish
   curl https://raw.githubusercontent.com/kaustubhhiware/NotiFyre/master/nf.fish -o ~/.config/fish/functions/nf.fish
   ```

* To be notified for each process, add this to your `functions/fish_prompt.fish`
file just before the end :

  ```sh
   function fish_prompt
      ...

      eval (notifyre)  # at the very end
   end
  ```
   This method works pretty well with my **bobthefish** theme and no theme as
   well. Let me know if it doesn't work out for you.


* If you want to be notified only for select commands, you do
not need to modify the `fish_prompt.fish` file.

   Run with `nf command`

   [This might take slightly more time than the process itself to complete
   execution.]

You can learn to write your own functions in fish with
[this](https://fishshell.com/docs/current/tutorial.html) as a starting point.

### Configuration
 [(Back to top)](#table-of-contents)

 ```sh
 set -x timeout 1
 set -x ring_timeout 2
 set -x ALERT /usr/share/sounds/ubuntu/notifications/Slick.ogg
 ```
 There are three available options:

 1. `timeout` : Same as option `MIN_INTERVAL` in the Bash / ZSH section above
 2. `ring_timeout` : Same as option `SOUND_MIN` in the Bash / ZSH section above
 3. `ALERT` : Same as option `ALERT` in the Bash / ZSH Section above

 Note: The notifications appear in a queue, and cannot be implemented parallely (known bug in notify-send)

## Why This?
[(Back to top)](#table-of-contents)

I had to reinstall Ubuntu quite a number of times thanks to how awesome Windows messed up my laptop. This script seeks to help anyone who multi-tasks, or does not constantly check their terminals. [ntfy](https://github.com/dschep/ntfy) wasn't consistent always, so made this.

Tested on fresh install of Ubuntu 16.04, Arch Linux and Mac. Ubuntu 14 may require [Slick.ogg](Slick.ogg) whose path must be changed before usage.

## Contributing
[(Back to top)](#table-of-contents)

Your contributions are always welcome :smile: ! Please have a look at the [contribution guidelines](CONTRIBUTING.md) first.

Discussion Group: https://www.facebook.com/groups/552015885141292/

You can use [refer.md](refer.md) for some previous work I've referred to while making this.

Have a suggestion? Make an issue about it.

## Debugging
[(Back to top)](#table-of-contents)

### Not working/ Message not displayed
check if notify-osd is working with this - `notify-send "hi"`

If no message pops up, it means notify-osd has stopped working. Reinstall some dependencies and try again:

    sudo apt-get --reinstall install libnotify-bin notify-osd

For further customizations, you can use [NotifyOSD config](http://ubuntuhandbook.org/index.php/2014/04/customize-on-screen-notification-ubuntu-1404/)

## Acknowledgements
[(Back to top)](#table-of-contents)

- [Ryan Caloras](https://github.com/rcaloras) for `bash-preexec.sh` [here](https://github.com/rcaloras/bash-preexec).

## License
[(Back to top)](#table-of-contents)

The MIT License (MIT) 2017 - [Kaustubh Hiware](https://github.com/kaustubhhiware). Please have a look at the [LICENSE.md](LICENSE.md) for more details.
