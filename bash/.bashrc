# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

#parse_git_branch() {
#    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
#}

transfer() { if [ $# -eq 0 ]; then echo -e "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi
	tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; fi; cat $tmpfile; echo; rm -f $tmpfile; 
} 

mini() {
           LOGFILE=~/logs/minicom.$1.log;
           echo "Start loging to "$LOGFILE;
           echo "~~~LOG START at $(date)~~~" >> $LOGFILE;
           minicom -c on -w -C $LOGFILE $1;
           echo "~~~LOG STOP at $(date)~~~" >> $LOGFILE;
       }

alias l='ls -l --color=always'
alias ls='ls --color=always'
alias ll='ls -artl --color=always'
alias cfreq='sudo cpupower frequency-set --max $1'
alias cfreqcurrent='watch -n 0.5 "cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_cur_freq"'
alias tb="nc termbin.com 9999"

# source /usr/share/undistract-me/long-running.bash;notify_when_long_running_commands_finish_install

export QT_AUTO_SCREEN_SCALE_FACTOR=0
export EDITOR=/usr/bin/nvim
export PS1="\u@\h [\w]\n\\$ \[$(tput sgr0)\]"
#export PS1="\u@\h [\w]\e[1;32m\$(parse_git_branch)\e[0m\n\\$\[$(tput sgr0)\]"
#export PS1="\u@\h [\w]\n\\$\[$(tput sgr0)\]"
#export TERM=linux

export HISTFILESIZE=100000
export HISTSIZE=100000
HISTCONTROL=erasedups
HISTCONTROL=ignoreboth


#PATH=$PATH:/home/tadas/esp8266/esp-open-sdk/xtensa-lx106-elf/bin:/usr/java/jre1.8.0_151
#ESP8266_SDK_ROOT=/home/tadas/esp8266/esp-open-sdk/sdk
#export ESP8266_SDK_ROOT
#JAVA_HOME=/usr/java/jre1.8.0_151
#export JAVA_HOME

export PATH=/home/$USER/bin:$PATH
