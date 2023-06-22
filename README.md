# hp-omen-rgb
A way to change the RGB lighting of an HP Omen Laptop's keyboard.

## Usage
  - Command `hp-omen-rgb (Zone ID)` - For (Zone ID) there are four options. It can either be 00, 01, 02, or 03. The zone ID is mandatory, as without it the script wont change any of the RGB values of the specific zone. 

## Inspiration

This script is made possible by the following people:

* Joey Schaff, also known as Jaoheah. https://github.com/Jaoheah/ I made the logo, modified the makefile, modified the readme.md, I asked Rudra to help make the hp-omen-rgb.sh, and I have also modified the hp-omen-rgb.sh's error messages.

* Rudra Saraswat, also known as rs2009. https://github.com/RudraSwat/ They made the hp-omen-rgb.sh script.

* Jefferson González, also known as jgmdev. https://github.com/jgmdev/wl-color-picker They made the orginal script that this entire project is inspired from. 

## Artwork

The icon was created by Joey Schaff, also known as Jaoheah. I just traced the HP OMEN logo in inkscape, and changed around the colors.

## Dependencies

* __hp-omen-linux-module__ - This is the necessary driver required for hp-omen-rgb to work. Without it there is no point to using this. https://github.com/ranisalt/hp-omen-linux-module/

* __Wayland__ - You may need Wayland for it to work.

* __zenity__ - Displays the RGB color picker. 

* __Gawk__ - The awk utility interprets a special-purpose programming language that makes it possible to handle simple data-reformatting jobs with just a few lines of code.


## Packages

~~ArchLinux - install from [AUR]()~~ soon
```sh
~~yay -S hp-omen-rgb-git~~ Soon
```
