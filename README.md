# apples

Simple command-line scripts that wrap interaction with Mac applications.

Pretty minimal right now but there's more to come.

## transmit

Access [Transmit](http://panic.com/transmit/)'s "[Dock Send](http://www.panic.com/blog/15-secrets-of-transmit/)" from the command-line:

    > transmit ~/Documents/git/davidfmiller.github.com/index.html

## launchbar

Send files/folders to [Launchbar](http://www.obdev.at/products/launchbar/index.html) from the command-line:

    > launchbar ~/Documents/git/davidfmiller.github.com/index.html

## tag

Set files/folders' Finder tags from the command-line:

    > tag red ~/Desktop/image.tiff ~/Documents/tmp.txt # add red tag
    > tag none                                         # remove tag from cwd

## app

Open/activate one ore more Mac applications from the terminal

    > app mail preview

… will open both Mail.app and Preview.app

There are several shortcuts for applications with long names:

* `chrome` → Google Chrome
* `qt` | quicktime → Quicktime Player
* `activity` → Activity Monitor
* `prefs` → System Preferences


### Disclaimer

All trademarks & copyrights remain the property of their respective owners.
