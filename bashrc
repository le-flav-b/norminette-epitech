##################################
###########   PROMPT   ###########
##################################

if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]$(if [ "$PWD" != "$HOME" ] && [ "$PWD" != "/" ]; then echo -n ${PWD%/*} | sed -r "s|^${HOME}|~|; s/\/([^/])[^\//]*/\/\1/g"; echo -n /; fi)\W\[\033[00m\]\$ '
else
    # PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    PS1='${debian_chroot:+($debian_chroot)}\u:$(if [ "$PWD" != "$HOME" ] && [ "$PWD" != "/" ]; then echo -n ${PWD%/*} | sed -r "s|^${HOME}|~|; s/\/([^/])[^\//]*/\/\1/g"; echo -n /; fi)\W\$ '
fi


##################################
######   COMMANDS HISTORY   ######
##################################

HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

shopt -s histappend
shopt -s checkwinsize
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi


##################################
######   COLORED COMMANDS   ######
##################################

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


##################################
########   ALIASES FILE   ########
##################################

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


##################################
#########   COMPLETION   #########
##################################

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


##################################
############   PATH   ############
##################################

export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/scripts
