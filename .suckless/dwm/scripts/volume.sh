#!/bin/bash
NOTIFY_ID=1001
if [ $# -eq 0 ]; then
  echo "Użycie: $0 -up lub $0 -down"
  exit 1
fi
get_volume() {
  amixer sget Master | awk -F"[][]" '/Left:/ { print $2 }' | head -n1
}
is_muted() {
  amixer sget Master | awk -F"[][]" '/Left:/ { print $4 }' | grep -q off
}

case "$1" in
  -up)
    amixer -q set Master 5%+
    new_volume=$(get_volume)
    notify-send -t 1500 -r $NOTIFY_ID "   $new_volume" -h int:value:$new_volume
    ;;
  -down)
    amixer -q set Master 5%-
    new_volume=$(get_volume)
    notify-send -t 1500 -r $NOTIFY_ID "   $new_volume" -h int:value:$new_volume
    ;;
  -mute)
    amixer -q set Master toggle
    if is_muted; then
      notify-send -t 1500 -r $NOTIFY_ID "   muted"
    else
      new_volume=$(get_volume)
      notify-send -t 1500 -r $NOTIFY_ID "   $new_volume"
    fi
    ;;
  *)
    echo "Nieprawidłowy parametr. Użyj: $0 -up lub $0 -down"
    exit 1
    ;;
esac
