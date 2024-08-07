#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ll='lsd -la --color=auto'

alias em="~/Documents/scripts/monitorSetup.sh"
alias xbi="xbacklight +10%"
alias xbl="xbacklight -10%"
alias cb="bluetoothctl connect E8:EC:A3:E0:B7:E9"
alias dcb="bluetoothctl disconnect E8:EC:A3:E0:B7:E9"
alias sdn="sudo shutdown now"
alias bon="sudo systemctl start bluetooth"
alias boff="sudo systemctl stop bluetooth"

alias v="nvim"
alias smci="sudo make clean install"
alias ndw="nmcli device wifi"
alias gnc="zathura /home/jmajecki/Documents/pdfs/science/Giancoli\ -\ Physics\ \(6th\).pdf"
xb() {
	xbacklight "$1"
}
iv() {
	amixer set Master 10%+
}
lv() {
	amixer set Master 10%-
}

#PS1='[\u@\h \W]\$ '
PS1='\[\e[34m\]\w\[\e[m\]\n\[\e[36m\]>\[\e[m\] '

#bat ~/Sync/todo.org
