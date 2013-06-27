#!/bin/sh
#
# To use a .xsession file with a graphical login manager (such as gdm or lxdm), 
# put the following in /usr/share/xsessions/xsession.desktop
#    [Desktop Entry]
#    Name=xsession
#    Comment=Run users ~/.xsession file
#    Exec=sh -c "$HOME/.xsession"
#    Type=Application
# Then when logging in you should be presented with 'xsession' as a choice of 
# desktops. Choose it.
#
# This is a bash file so we can start gnome-keyring here if we wish to
# (gnome-keyring is not smart enough to be able to emit its environment 
# variables in a form suitable for csh).

# Echo the commands as they are executed.
# All output from this script ends up in ~/.xsession-errors
echo "Running $HOME/.xsession"
date
set -x

# If traveling, set the timezone (use 'tzselect' to determine value of TZ)
export TZ='America/Los_Angeles'
#export TZ='America/Denver'
#export TZ='America/Chicago'
#export TZ='America/New_York'

# Enable use of Ctrl-Alt-Bksp to kill X session
setxkbmap -option terminate:ctrl_alt_bksp

# Set color of background
xsetroot -solid royalblue

# Start i3 (my window manager)
exec /usr/bin/i3 -V -d all
