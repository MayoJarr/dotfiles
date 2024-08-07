#!/bin/bash

# Stałe ID powiadomienia
NOTIFY_ID=1002

# Sprawdzamy, czy parametr został przekazany
if [ $# -eq 0 ]; then
  echo "Użycie: $0 -up lub $0 -down"
  exit 1
fi

# Funkcja do uzyskania aktualnego poziomu jasności
get_brightness() {
  xbacklight -get | awk '{print int($1)}'
}

case "$1" in
  -up)
    # Zwiększamy jasność o 5%
    xbacklight +5%
    new_brightness=$(get_brightness)
    notify-send -t 1500 -r $NOTIFY_ID "   ${new_brightness}%" -h int:value:$new_brightness
    ;;
  -down)
    # Zmniejszamy jasność o 5%
    xbacklight -5%
    new_brightness=$(get_brightness)
    notify-send -t 1500 -r $NOTIFY_ID "   ${new_brightness}%" -h int:value:$new_brightness
    ;;
  *)
    echo "Nieprawidłowy parametr. Użyj: $0 -up lub $0 -down"
    exit 1
    ;;
esac

