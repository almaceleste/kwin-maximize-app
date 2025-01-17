#!/bin/bash

script="$1"
number=$(dbus-send --print-reply --dest=org.kde.KWin /Scripting org.kde.kwin.Scripting.loadScript string:"$script" | awk 'END {print $2}')
now=$(date +%T)

dbus-send --print-reply --dest=org.kde.KWin /Scripting/Script$number org.kde.kwin.Script.run >/dev/null

sleep 2

dbus-send --print-reply --dest=org.kde.KWin /Scripting org.kde.kwin.Scripting.unloadScript string:"$script" >/dev/null

journalctl _COMM=kwin_wayland -o cat --since "$now" | sed 's/^js: //'
