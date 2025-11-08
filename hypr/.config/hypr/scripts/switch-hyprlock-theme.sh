MENU="Default|Ly"

DIALOG_RESULT=$(echo $MENU | rofi -sep "|" -dmenu -i -p "Select Theme" -hide-scrollbar -tokenize -lines 5 -width 50 -padding 50 -disable-history)

echo "This result is : $DIALOG_RESULT"
sleep 1;

if [ "$DIALOG_RESULT" = "Default" ];
then
	exec echo "source = ~/.config/hypr/conf/hyprlock/default.conf" > ~/.config/hypr/hyprlock.conf

elif [ "$DIALOG_RESULT" = "Ly" ];
then
	exec echo "source = ~/.config/hypr/conf/hyprlock/ly-style.conf" > ~/.config/hypr/hyprlock.conf
fi
