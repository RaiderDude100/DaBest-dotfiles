#!/bin/sh

MENU="Classic|Default|End4|High|Moving|Standard|DaBest|none"

DIALOG_RESULT=$(echo $MENU | rofi -sep "|" -dmenu -i -p "Select Animations" -hide-scrollbar -tokenize -lines 5 -width 50 -padding 50 -disable-history)

echo "This result is : $DIALOG_RESULT"
sleep 1;

if [ "$DIALOG_RESULT" = "Classic" ];
then
	exec echo "source = ~/.config/hypr/conf/animations/classic.conf" > ~/.config/hypr/conf/animations.conf

elif [ "$DIALOG_RESULT" = "Default" ];
then
	exec echo "source = ~/.config/hypr/conf/animations/default.conf" > ~/.config/hypr/conf/animations.conf

elif [ "$DIALOG_RESULT" = "End4" ];
then
	exec echo "source = ~/.config/hypr/conf/animations/end4.conf" > ~/.config/hypr/conf/animations.conf

elif [ "$DIALOG_RESULT" = "High" ];
then
	exec echo "source = ~/.config/hypr/conf/animations/high.conf" > ~/.config/hypr/conf/animations.conf

elif [ "$DIALOG_RESULT" = "Moving" ];
then
	exec echo "source = ~/.config/hypr/conf/animations/moving.conf" > ~/.config/hypr/conf/animations.conf

elif [ "$DIALOG_RESULT" = "Standard" ];
then
	exec echo "source = ~/.config/hypr/conf/animations/standard.conf" > ~/.config/hypr/conf/animations.conf

elif [ "$DIALOG_RESULT" = "DaBest" ];
then
	exec echo "source = ~/.config/hypr/conf/animations/DaBest.conf" > ~/.config/hypr/conf/animations.conf
	
elif [ "$DIALOG_RESULT" = "none" ];
then
	exec echo "source = ~/.config/hypr/conf/animations/none.conf" > ~/.config/hypr/conf/animations.conf
fi


