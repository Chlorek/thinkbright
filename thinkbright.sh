CURR=$(cat /sys/class/backlight/intel_backlight/brightness)
if [ $# -eq 0 ]; then
	echo $CURR
else
	MAX=$(cat /sys/class/backlight/intel_backlight/max_brightness)
	NEW=$((CURR + $1))
	if [ $NEW -lt $MAX ]; then
		echo $((CURR + $1)) >> /sys/class/backlight/intel_backlight/brightness
	else
		echo $MAX >> /sys/class/backlight/intel_backlight/brightness
	fi
fi
