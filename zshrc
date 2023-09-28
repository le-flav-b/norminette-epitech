## command
alias cl="clear"
alias v="vim"
alias c="cat"
alias b="bat"
alias n="norminette"
alias mk="mkdir"

## move to location
alias cdd="cd ~/Documents"
alias cds="cd ~/sgoinfre"

## ls
alias l="ls"
alias ll="ls -l"
alias la="ls -a"
alias lla="ls -la"

## command with recurring arguments
alias ba="bat */*"
alias trepro="tree -L 2 ~/Documents"
alias ctr="cl && tree"
alias ctrp="cl && trepro"
alias rmsg="rm -rf ~/sgoinfre/*"
alias rmout="rm *.out"

## important files
alias vzsh="vim ~/.zshrc"
alias vvim="vim ~/.vimrc"
alias todo="c ~/TODO"
alias todoe="v ~/TODO"

## compilation
alias ccc="cc -Wall -Wextra -Werror -g3"
alias cccc="ccc -c"
alias a="./a.out"
alias cca="ccc *.c && a"

## git
alias gita="git add *"
alias gitc="git commit -m"
alias gitp="git push"
alias gits="git status"
alias gcl="git clone"

## internet
alias intra="xdg-open https://intra.42.fr"
alias discord="xdg-open https://discord.com/channels/@me"
alias mail="xdg-open https://mail.google.com/mail/u/0/#inbox"
alias emoji="xdg-open https://gitmoji.dev/"
alias ifs="xdg-open https://www.ffcorientation.fr/media/cache/b8/c5/b8c5965b1b599363ea289402f0430c98.png"

## my scripts
export PATH=$PATH:~/Documents/scripts
alias giti="add_to_gitignore"
alias gitpa="push_all"
alias gitcc="gitcountcommit"
alias mkex="create_dir"
alias findf="find_function"
alias copyf="copy_function"
alias nn="nicer_norminette_42"
alias rtn="nn -rt"

## copy to clipboard
alias min="echo -n "-2147483648" | xclip -selection clipboard"
