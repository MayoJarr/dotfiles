#while true; do
   #xsetroot -name "$( date +"%F %R" )"
   #sleep 1m    # Update time every minute
#done &

while true; do

        date '+?  %a. %d %b. ?  %R ' > /tmp/CurTime.tmp

        sleep 60s
done &

while true; do

        #LOCALTIME=$(< /tmp/CurTime.tmp)
        LOCALTIME=$( date +"%F %R" )
        #DB=$(dropbox status)
        #VOL=$(pamixer --get-volume-human)
        #MEM=$(free -h --kilo | awk '/^Mem:/ {print $3 "/" $2}')
        CPU=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}' )
        TEMP=$(sensors|grep 'Core 0'|awk '{print $3}' )
        #DISK=$(df -Ph | grep "/dev/sda4" | awk {'print $5'})
        #WIFI=$(nmcli -f ACTIVE,SIGNAL dev wifi list | awk '$1=="yes" {print $2}')
        BAT=$(cat /sys/class/power_supply/BAT0/capacity)
        #WATTS=$(awk '{print $1*10^-6 " W"}' /sys/class/power_supply/BAT0/power_now)
        xsetroot -name " $CPU% | $TEMP | $BAT% | $LOCALTIME"
        sleep 10s
done &

nitrogen --restore &
picom &
exec /usr/local/bin/dwm 
#i3
