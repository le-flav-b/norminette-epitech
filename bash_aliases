## commands
alias cl="clear"
alias mk="mkdir"
alias t="touch"
alias l="ls"
alias v="vim"
alias c="cat"
alias bat="batcat"
alias b="batcat"
alias n="norminette"

## ls
alias ll="ls -l"
alias la="ls -A"
alias lla="ls -lA"

## cd
alias cds="cd ~/scripts"
alias cdc="cat .current_project | cd"

## recurring commands combos & arguments
alias ctr="cl && tree"
alias rmout="rm *.out"
alias cpy="xclip -selection clipboard"

## compilation
alias ccc="cc -Wall -Wextra -Werror -g3"
alias cccc="ccc -c"
alias a="./a.out"
alias cca="cc *.c && ./a.out"

## git
alias gcl="git clone"
alias gpl="git pull"
alias gs="git status"
alias ga="git add *"
alias gc="git commit -m"
alias gp="git push"

## internet
alias vivaldi="/mnt/c/Users/flavi/AppData/Local/Vivaldi/Application/vivaldi.exe"
alias intra="vivaldi https://intra.42.fr"
alias discord="vivaldi https://discord.com/channels/@me"
alias emoji="vivaldi https://gitmoji.dev/"

## my scripts
alias gi="add_to_gitignore"
alias gpa="push_all"
alias nn="nicer_norminette"
alias rtn="nn -rt"
alias notif="notify-send"
