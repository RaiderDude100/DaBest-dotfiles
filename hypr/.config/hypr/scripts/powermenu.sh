#!/bin/sh

MENU="Shutdown|Restart|Logout|Lock"
DIALOG_RESULT=$(echo $MENU | rofi -sep "|" -dmenu -i -p "System Configuration" -hide-scrollbar -tokenize -lines 6 -width 50 -padding 50 -disable-history)

echo "This result is : $DIALOG_RESULT"
sleep 1;

if [ "$DIALOG_RESULT" = "Shutdown" ];
then
	exec systemctl poweroff

elif [ "$DIALOG_RESULT" = "Restart" ];
then
	exec systemctl reboot

elif [ "$DIALOG_RESULT" = "Logout" ];
then
	exec hyprctl dispatch exit

elif [ "$DIALOG_RESULT" = "Lock" ];
then
	exec hyprlock

fi


