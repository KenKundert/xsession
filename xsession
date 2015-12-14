#!/bin/sh
#
# I use an .xsession file in preference to using ~/.config/i3/config to 
# initialize my session because I can set environment variables here that will 
# be inherited by the session.
#
# To use a .xsession file with a graphical login manager (such as lxdm), put the 
# following in /usr/share/xsessions/xsession.desktop
#    [Desktop Entry]
#    Name=xsession
#    Comment=Run users ~/.xsession file
#    Exec=~/.xsession
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
#export TZ='America/Phoenix'
#export TZ='America/Chicago'
#export TZ='America/New_York'
#export TZ='Asia/Tokyo'
#export TZ='Asia/Kolkata'
#export TZ='Asia/Bangkok'

# Start the message bus if it is not already running
if test -z "$DBUS_SESSION_BUS_ADDRESS"; then
    eval `dbus-launch --sh-syntax --exit-with-session`
fi

# Gnome keyring is started using pam by lxdm
# However, the environment variables are not set. Request the environment 
# variables that point to the SSH and GPG agents from the running keyring 
# daemon.
export $(gnome-keyring-daemon --start)

#Enable use of Ctrl-Alt-Bksp to kill X session and get rid of caps lock
setxkbmap -option terminate:ctrl_alt_bksp -option ctrl:nocaps

# start polkit authentication agent
# Allows virt-manager or other such programs that need root permissions to be 
# run by normal # user.
/usr/libexec/lxpolkit &

# Activates copy/paste and screen resize when running as a vmware guest
vmware-user-suid-wrapper

# Set color of background
xsetroot -solid royalblue

# Start i3
exec /usr/bin/i3
