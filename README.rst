Making X-Session Script Available From Your Login Manager
=========================================================

Most of the modern X desktop environments such as Gnome use a display manager 
(gdm) to log you in and start your X session. These display mangers make it easy 
for novices to get a very functional session started without spending a lot of 
time configuring it. However, they become problematic if you wish to understand 
and control what is getting started and how it is getting started. Before the 
rise of the modern display manager, you would place a script in your home 
directory that would control the creation of your X session. That file was 
originally named ~/.xinitrc. Later, the alternative name of ~/.xsession was 
used. These provide precise control of the creation of your X session.

I have created a file that you can load into your display manager that allows 
you to choose use your ~/.xsession file to start your X session. To use it, 
first create your ~/.xsession file. I have included an example file. The 
essentials are that it should be an executable script that finishes by executing 
your window manager. Then simply copy xsession.desktop into 
/usr/share/xsessions.  Finally, logout, set xsession to be desktop, and log back 
in.

| Enjoy,
|    -Ken
