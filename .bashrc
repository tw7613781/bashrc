export CLICOLOR=1
export LSCOLORS='gxfxcxdxbxegedabagacad'
export PATH="/usr/local/bin:$PATH"
export EDITOR=vim
export VISUAL=vim
export HOMEBREW_NO_AUTO_UPDATE=1 
export LANG="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

alias vi='/usr/bin/vim'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias ls='ls -vFG'
alias la='ls -a'
alias ll='ls -lh'
alias lla='ls -alh'
alias rmswp='ls -a1 | grep "^\." | grep "swp$" | xargs rm'
alias pss='ps aux | grep -v ps | grep -v grep | grep ${USER}'
alias sb='source ~/.bashrc'
alias del_hist="rm -f ${HOME}/.bash_history;history -c"
alias tmuxn='tmux new -s'
alias tmuxk='tmux kill-session -t'
alias tmuxa='tmux attach -t'
alias tmuxr='tmux source-file ~/.tmux.conf'
alias run_jupyter='jupyter notebook > /dev/null 2>&1 &'
alias kill_jupyter="ps -ef | grep jupyter-noteboo[k] | awk '{print\$2}' | xargs kill -9"
alias kill_zombie="ps -ef | grep defunc[t] | awk '{print\$2}' | xargs kill -9"
alias clang='clang++ -std=c++11 -stdlib=libc++'

## source files
source $HOME/z/z.sh
## source $HOME/torch-cl/install/bin/torch-activate
## source $HOME/torch/install/bin/torch-activate
source $HOME/.git-prompt.sh

## vi mode
set -o vi 
bind -m vi-command ".":insert-last-argument
bind -m vi-command "v":""
bind -m vi-insert "\C-l":clear-screen
bind -m vi-insert "\C-a":beginning-of-line
bind -m vi-insert "\C-e":end-of-line
bind -m vi-insert "\C-w":backward-kill-word

#chflags hidden [FOLDER]
if [ ! "$TERM" = "" ]; then
    red=$(tput setaf 1)
    purple=$(tput setaf 6)
    brown=$(tput setaf 3)
    reset=$(tput sgr0)
    export PS1='\n\[$purple\]\u@\h \[$brown\]\w\[$red\]$(__git_ps1 " (%s)")'$'\n\[$reset\]$ '
fi

## git shorcut
export GIT_SSL_NO_VERIFY=1
alias gits='git status'
alias gita='git add -A'
alias gitb='git branch'
alias gitc='git commit -a'
alias gitd='git diff'
alias gith='git hist'
alias gitf='git fetch'
alias gitl='git log'
alias gitp='gitl --pretty=oneline'
alias gito='git checkout'
alias gitm='git merge --no-ff'
alias gitmx='git merge -X theirs --no-ff'
alias gitr='git rm -r --cache'
alias gitx='confirm && reset --merge ORIG_HEAD'

## functions
confirm() {
    read -r -p "Are you sure? [y/N]" response
    case $response in 
        [yY])
            true
            ;;
        *) 
            false
            ;;
    esac
}

