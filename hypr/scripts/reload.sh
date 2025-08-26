#!/bin/zsh
killall -9 waybar
waybar &
killall -9 swayosd-server
swayosd-server &
