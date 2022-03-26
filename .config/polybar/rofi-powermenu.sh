#! /bin/sh

chosen=$(printf "  Power Off\n  Restart\n  Logout" | rofi -dmenu -i -p "Options: ")

case "$chosen" in
	"  Power Off") poweroff ;;
	"  Restart") reboot ;;
	"  Logout") bspc quit ;;
	*) exit 1 ;;
esac