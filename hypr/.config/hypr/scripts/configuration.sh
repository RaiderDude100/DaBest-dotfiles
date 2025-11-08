#!/bin/sh

MENU="Animation Switcher|GTK Settings|Qt5 Settings|Qt6 Settings|Hyprlock Theme Switcher"
DIALOG_RESULT=$(echo $MENU | rofi -sep "|" -dmenu -i -p "System Configuration" -hide-scrollbar -tokenize -lines 6 -width 50 -padding 50 -disable-history)

echo "This result is : $DIALOG_RESULT"
sleep 1;

if [ "$DIALOG_RESULT" = "Animation Switcher" ];
then
	exec ~/.config/hypr/scripts/animation-switch.sh

elif [ "$DIALOG_RESULT" = "GTK Settings" ];
then
	exec nwg-look

elif [ "$DIALOG_RESULT" = "Qt5 Settings" ];
then
	exec qt5ct

elif [ "$DIALOG_RESULT" = "Qt6 Settings" ];
then
	exec qt6ct
	
elif [ "$DIALOG_RESULT" = "Hyprlock Theme Switcher" ];
then
	exec ~/.config/hypr/scripts/switch-hyprlock-theme.sh


fi


