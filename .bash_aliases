alias cls='clear'
#alias http='http --auth-type=jwt -j'
alias http_bearer='export JWT_AUTH_TOKEN=`cat ~/.bearer`'
#alias kweb='http -j --auth-type=jwt -j --pretty=all'
alias kedit='vi ~/.bash_aliases'
alias kga='git add *'
alias gck='git checkout'
alias gcm='git commit'
alias gpl='git pull'
alias kgmail='alpine'
alias gs='git status'
alias gps='git push'
alias klater='tmux detach'
alias knwork='tmux new -s mnrt_dev'
alias kreload='source ~/.bashrc'
alias kam='service apache2 restart & service mysql restart'
alias ksam='service apache2 stop & service mysql stop'
alias kap='service apache2 restart & service postgresql restart'
alias ksap='service apache2 stop & service postgresql stop'
alias kwork='tmux a -t mnrt_dev'
alias kws='service apache2 status & service postgresql status & service mysql status'
alias yii='php yii'
alias calculate='mdlt'
alias workspace='cd ~/workspace'
alias goworkspace='cd ~/workspace/go'
alias pworkspace='cd ~/workspace/docs'
alias .='cd ..'


# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# what using the cp command, please show progress in human readable format and maintain
# permissions -a = premissions, -h in human readable
alias cp="rsync -ah --progress"

# sometimes the habits from using windows just wont leave so make cls alias to clear
alias cls='clear'
alias CLS='clear'
alias CLEAR='clear'
alias CD='cd'

# if i just type up take me back one level up
alias up='echo "Moving back one directory" && cd ..'

# if i type home just bring me back to home/root folder
alias home='echo "Welcome, you are in your home folder now" && cd ~'

alias gr="go run"

kbearer(){
    export JWT_AUTH_TOKEN=$1;
}
kweb(){
http "$@" --auth-type=jwt -j  --pretty=all | less -R;
}


