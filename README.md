# apples

Simple command-line scripts that wrap interaction with Mac applications.

Pretty minimal right now but there's more to come.

## tag

Set files/folders' Finder tags from the command-line:

    > tag red ~/Desktop/image.tiff ~/Documents/tmp.txt # add red tag
    > tag none                                         # remove tag from cwd

## app

Easily open files from the Terminal in applications which _aren't_ the default editor associated with the filetype.

Open/activate a Mac application from the terminal

    > app safari

… will open `Safari.app`, and

    > app acorn ~/Desktop/DSCF2375.tif ~/Desktop/DSCF2381.tif

... will open the images in [`Acorn`](http://www.flyingmeat.com/acorn/) (assuming its installed), instead of the default application (most likely, `Preview`).

There are several shortcuts for applications with long names:

* `chrome` → Google Chrome
* `qt` | `quicktime` → Quicktime Player
* `activity` → Activity Monitor
* `prefs` → System Preferences

[View the source](https://github.com/davidfmiller/apples/blob/master/app) for a complete list

## todo

Create items in `Reminders.app` from the command-line

    > todo "Pick up milk on the way home"


### Disclaimer

All trademarks & copyrights remain the property of their respective owners.
