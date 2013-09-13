#Server Helpers

A collection of files and helpers for nicer set up on a Linux server.

This repo shouldn't really be copied down as it may overwrite any local changes. Instead, I would pick and choose the bits that you want.

All these files would reside in your home directory. If you are logged in as root, this would be `/root/`.

##.bashrc

This contains some code which puts the path and git repo status in your command promt. For example:

	root@server:/home/path/public_html/server-helpers [master]$

The branch name will change colour if you have uncommitted or staged files.

<div class="flash flash-notice">
<p><strong>Gotcha</strong>: The command runs a git status, so if you find it slow going into your repository, comment out the bits between the colour tags</p>
</div>

##.nanorc

This enables colouring for the nano text editor on Linux. Some setting are also set at the top (including Mouse mode and tab mode) which can be added/removed as you like. See the [Nano Manual](http://www.nano-editor.org/dist/v2.0/nano.html#Nanorc-Files) for the settings available.

##.gitconfig

This sets the user defaults for committing files and other recommended defaults including enabling colours.
