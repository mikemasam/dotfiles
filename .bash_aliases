alias sudo='sudo '
alias ok="ping google.com"
alias cls='clear'
alias c='clear'
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
alias knwork='tmux new -s pluto'
alias kreload='source ~/.bashrc'
alias kwam='service apache2 restart & service mysql restart'
alias kwams='service apache2 stop & service mysql stop'
alias kwap='service apache2 restart & service postgresql restart'
alias kwaps='service apache2 stop & service postgresql stop'
alias kwork='tmux a -t pluto'
alias kws='service apache2 status & service postgresql status & service mysql status'
alias yii='php yii'
alias calculate='mdlt'
alias workspace='cd ~/workspace'
alias goworkspace='cd ~/workspace/go/src'
alias viworkspace='cd ~/workspace/vim'
alias pworkspace='cd ~/workspace/docs'
alias .='cd ..'
alias public_ip='curl ipinfo.io/ip'
alias mnrt_upload_pos_apk='scp ~/workspace/docs/mnrtmobile/private_release/release/app-private_release-release.apk  maliasili@41.59.82.178:/home/maliasili'
alias ls='ls -AlhF --color=auto'
alias :q='exit'


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
alias gbuild_windows="env GOOS=windows GOARCH=386 go build"

mnrt_download_latest_db(){
  scp acex1@41.59.225.90:/home/acex1/database_backup/backup_latest_db.sql current_db.sql
}
mnrt_import_latest_db(){
  echo 'Backing up remote latest database........'
  ssh acex1@41.59.225.90 'bash -s' < ~/mnrt/remote-backup.sh
  echo 'Downloading latest database........'
  scp acex1@41.59.225.90:/home/acex1/database_backup/backup_latest_db.sql ~/mnrt/current_db.sql
  export _time='mnrt_'$(date +%s)
  echo 'Creating new database '$_time'........'
  psql -U postgres -c 'create database '$_time';'
  echo 'Importing latest database to '$_time'........'
  psql -U postgres $_time < ~/mnrt/current_db.sql
  echo 'Importing latest database to '$_time' successful'
  echo '---------------------------------------'
}

mnrt_pull_develop(){
  echo 'Making changes live........'
  ssh acex1@41.59.225.90 'bash -s' < ~/mnrt/remote-pull-changes.sh
  echo 'Done........'
}

kdeploy(){
  echo '....Starting K Deploy....'
  echo $1

  if [ $1 == 'mnrt' ]; then
    ssh acex1@41.59.225.90 'bash -s' < ~/deploy_script/mnrt.sh
  fi

  if [ $1 == 'cashx' ]; then
    ssh 139.59.185.170 'bash -s' < ~/deploy_script/cashx.sh
  fi

  if [ $1 == 'dereva' ]; then
    ssh masamtechnologies.com 'bash -s' < ~/deploy_script/dereva.sh
  fi

  echo 'Done........'
}

masam_public_ip(){
  export public_address=$(curl -s ipinfo.io/ip)
  #Create temporary file with new line in place
  cat ~/deploy_script/masam_public_ip.sh | sed -e "s/public_ip/"$public_address"/" > ~/deploy_script/masam_public_ip.sh.tmp
  #Copy the new file over the original file
  ssh masamtechnologies.com 'bash -s' < ~/deploy_script/masam_public_ip.sh.tmp
  rm ~/deploy_script/masam_public_ip.sh.tmp
}

bash_test(){
  ssh acex1@41.59.225.90 'bash -s' < ~/mnrt/remote-backup.sh
}
kbearer(){
  export JWT_AUTH_TOKEN=$1;
}
kweb(){
  http "$@" --auth-type=jwt -j  --pretty=all | less -R;
}


