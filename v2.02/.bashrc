#!/bin/sh

# RETROBOX MOTD - BASED ON RETROPIE
case $- in
    *i*) ;;
      *) return;;
esac
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s checkwinsize
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w \$\[\033[00m\] '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# RETROBOX PROFILE START

function retrobox_welcome() {
    local upSeconds="$(/usr/bin/cut -d. -f1 /proc/uptime)"
    local secs=$((upSeconds%60))
    local mins=$((upSeconds/60%60))
    local hours=$((upSeconds/3600%24))
    local days=$((upSeconds/86400))
    local UPTIME=$(printf "%d days, %02dh%02dm%02ds" "$days" "$hours" "$mins" "$secs")

    # calculate rough CPU and GPU temperatures:
    local cpuTempC
    local cpuTempF
    local gpuTempC
    local gpuTempF
    if [[ -f "/sys/class/thermal/thermal_zone0/temp" ]]; then
        cpuTempC=$(($(cat /sys/class/thermal/thermal_zone0/temp)/1000)) && cpuTempF=$((cpuTempC*9/5+32))
    fi

    if [[ -f "/opt/vc/bin/vcgencmd" ]]; then
        if gpuTempC=$(/opt/vc/bin/vcgencmd measure_temp); then
            gpuTempC=${gpuTempC:5:2}
            gpuTempF=$((gpuTempC*9/5+32))
        else
            gpuTempC=""
        fi
    fi



  echo -e "
\e[31m       ____       __             ____
\e[33m      / __ \___  / /__________  / __ )____  _  __
\e[32m     / /_/ / _ \/ __/ ___/ __ \/ __  / __ \| |/_/
\e[36m    / _, _/  __/ /_/ /  / /_/ / /_/ / /_/ />  <
\e[34m   /_/ |_|\___/\__/_/   \____/_____/\____/_/|_|   v2.02
\e[97m
 \e[35m$(date +"%A, %e %B %Y, %r")
 \e[35m$(uname -srmo)
 \e[93m${df_out[0]}
 \e[39m${df_out[1]}
 \e[31mUptime.............: \e[32m${UPTIME}\e[31m
 \e[31mMemory.............: \e[32m$(grep MemFree /proc/meminfo | awk {'print $2'})\e[31mkB (Free) / \e[32m$(grep MemTotal /proc/meminfo | awk {'print $2'})\e[31mkB (Total)
 \e[31mRunning Processes..: \e[32m$(ps ax | wc -l | tr -d " ")
 \e[31mIP Address.........: \e[32m$(ip route get 8.8.8.8 2>/dev/null | head -1 | cut -d' ' -f8)\e[31m
 \e[31mTemperature........: CPU: \e[32m$cpuTempC\e[31m°C/\e[32m$cpuTempF\e[31m°F GPU: \e[32m$gpuTempC\e[31m°C/\e[32m$gpuTempF\e[31m°F
 \e[31mRetroBox Console V.2.02, \e[91mhttps://retrobox.tech \e[31mBased on RetroPie
"

}

retrobox_welcome

# RETROBOX PROFILE END - BASED ON RETROPIE SCRIPT
