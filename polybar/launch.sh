#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
polybar bar1 -c "$HOME/.config/polybar/rice/config.ini" 2>&1 & disown
polybar bar2 -c "$HOME/.config/polybar/rice/config.ini" 2>&1 & disown
polybar bar3 -c "$HOME/.config/polybar/rice/config.ini" 2>&1 & disown
polybar bar4 -c "$HOME/.config/polybar/rice/config.ini" 2>&1 & disown
polybar tray -c "$HOME/.config/polybar/rice/config.ini" 2>&1 & disown

sleep 0.1
polybar-msg cmd hide
# sleep 0.05;

# polybar-msg cmd hide
