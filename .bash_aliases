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
alias ksam='service apache2 restart & service mysql restart'
alias ksam='service apache2 stop & service mysql stop'
alias ksap='service apache2 restart & service postgresql restart'
alias kkap='service apache2 stop & service postgresql stop'
alias kwork='tmux a -t mnrt_dev'
alias kws='service apache2 status & service postgresql status & service mysql status'
alias yii='php yii'
alias calculate='mdlt'
kbearer(){
    export JWT_AUTH_TOKEN=$1;
}
kweb(){
http "$@" --auth-type=jwt -j  --pretty=all | less -R;
}


