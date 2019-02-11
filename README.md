# apples

Simple command-line scripts that wrap interaction with macOS applications or are macOS-specific. Clone the repo and its location to your shell, ex:

> git clone https://github.com/davidfmiller/apples.git ~/Documents/git/apples
> echo 'PATH="$PATH:~/Documents/git/apples' >> ~/.bash_profile


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
* etc...

[View the source](https://github.com/davidfmiller/apples/blob/master/app) for a complete list

## terminal-profile

Change the profile settings in the active Terminal window:

    > terminal-profile Pro

[Read more](https://readmeansrun.com/blog/terminal/applescript/2017/04/15/terminal-app-profiles.html)


## beep

Plays the default OS X system beep sound (or another system sound if provided)

    > beep [basso|blowfrog|funk|glass|hero|morse|ping|pop|purr|sosumi|submarine|tink]

## exif

Display exif info for one or more images

    > exif [filenames]


## title

Set the custom title of the active `Terminal.app` window

    > title "git"


## note

Create items in `Notes.app` from the command-line

    > cat foo.txt | note "Contents of foo.txt"


## notify

Display a notification

    > notify --title "Title" --subtitle "Subtitle"

(Will use [Scripting Notifications](http://www.cooperative-fruitiere.com/notifications/index_en.html) if installed.)


## resolution

Display the main screen's resolution

    > resolution


## todo

Create items in `Reminders.app` from the command-line

    > todo "Pick up milk on the way home"


## volume

Set the system volume from the command-line

    > volume 0
    > volume mute # same as 0
    > volume 100
    > volume max # same as 100
    > volume 50


### Disclaimer


All trademarks & copyrights remain the property of their respective owners.
