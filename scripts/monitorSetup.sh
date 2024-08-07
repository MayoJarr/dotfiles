#!/bin/bash
xrandr --auto --output VGA1 --mode 1920x1080
xrandr --auto --output LVDS1 --pos 0x312 --left-of VGA1
nitrogen --restore
