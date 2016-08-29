# sexy list handling
alias ll='ls -AFhlG'

# start couchdb
alias couchdb="sudo couchdb"

# start redisdb
alias redis="redis-server /opt/local/etc/redis.conf"

# start mongodb
alias mongodb="mongod --config /usr/local/etc/mongod.conf"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# colored cat command
alias ccat=' pygmentize -O style=monokai -f console256 -g'

# ip address
alias ip="echo Your ip is; dig +short myip.opendns.com @resolver1.opendns.com;"


# create new server on given port
alias server='open http://localhost:8000 && python -m SimpleHTTPServer'


# launch applications
alias chrome='open -a "/Applications/Google Chrome.app" --args --force-renderer-accessibility'
alias chromeDebug='chrome --remote-debugging-port=9222'

# git handling
cloneFunction() {
  git clone git@github.com:$1 $2
  cd $2
  subl .
}

alias clone=cloneFunction
alias t=trash