!/usr/bin/env sh
HYPRGAMEMODE=$(hyprctl getoption animations:enabled | awk 'NR==1{print $2}')
if [ "$HYPRGAMEMODE" = 1 ] ; then
    exec echo -e "{\n    "\"include\"": [\n    "\"~/.config/waybar/themes/minimal\""\n    ],\n}" > ~/.config/waybar/config &
    exec echo "@import 'themes/minimal.css';" > ~/.config/waybar/style.css &
    exec ~/.config/hypr/scripts/reload.sh &
    exec pkill swaync &
    exec pkill hypridle &
    exec echo "@theme \"~/.config/rofi/themes/minimal.rasi\"" > ~/.config/rofi/config.rasi &
    notify-send -e "Gamemode Activated"
    hyprctl --batch "\
        keyword animations:enabled 0;\
        keyword decoration:shadow:enabled 0;\
        keyword decoration:blur:enabled 0;\
        keyword general:gaps_in 0;\
        keyword general:gaps_out 0;\
        keyword general:border_size 0;\
        keyword decoration:rounding 0"
    exit
fi
    exec echo "@import 'themes/default.css';" > ~/.config/waybar/style.css &
    exec echo -e "{\n    "\"include\"": [\n    "\"~/.config/waybar/themes/default\""\n    ],\n}" > ~/.config/waybar/config &
    exec ~/.config/hypr/scripts/reload.sh &
    exec hypridle &
    exec echo "@theme \"~/.config/rofi/themes/rounded.rasi\"" > ~/.config/rofi/config.rasi &
    notify-send -e "Gamemode Deactivated"
    hyprctl reload
exit
