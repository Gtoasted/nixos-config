cat monitor_mode.txt | wofi --dmenu | read mode
echo $mode
hyprctl keyword monitor ,preferred,auto-$mode,1
