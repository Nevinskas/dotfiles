# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

function prs_fw_ver()
{
	dd if=$1 skip=296 count=3 bs=1 2>/dev/null &&
	echo -n . &&
	dd if=$1 skip=311 count=7 bs=1 2>/dev/null &&
	echo;
};

mini()
{
	LOGFILE=~/logs/minicom.$1.log;
	echo "Start loging to "$LOGFILE;
	echo "~~~LOG START at $(date)~~~" >> $LOGFILE;
	minicom -c on -w -C $LOGFILE $1;
	echo "~~~LOG STOP at $(date)~~~" >> $LOGFILE;
}

export PATH=$PATH:/home/$USER/bin

alias l='ls -l --color=always'
alias ls='ls --color=always'
alias ll='ls -artl --color=always'
alias cfreq='sudo cpupower frequency-set --max $1'
alias cfreqcurrent='watch -n 0.5 "cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_cur_freq"'

export QT_AUTO_SCREEN_SCALE_FACTOR=0
export EDITOR=$(which nvim)
export PS1="\u@\h [\w]\n\\$ \[$(tput sgr0)\]"
export HISTFILESIZE=100000
export HISTSIZE=100000
export HISTCONTROL=ignoreboth:erasedups
