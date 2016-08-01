# apache handling
alias ap_restart='sudo /opt/local/etc/LaunchDaemons/org.macports.apache2/apache2.wrapper restart'
alias ap_start='sudo /opt/local/etc/LaunchDaemons/org.macports.apache2/apache2.wrapper start'
alias ap_stop='sudo /opt/local/etc/LaunchDaemons/org.macports.apache2/apache2.wrapper stop'
alias ap_conf='cd /opt/local/apache2/conf/'
alias ap_vhosts='vim /opt/local/apache2/conf/extra/httpd-vhosts.conf'

# sexy list handling
alias ll='ls -AFhlG'


# mysql handling
alias mysqlstart='sudo /opt/local/bin/mysqld_safe5 &'
alias mysqlstop='sudo mysqladmin5 -uroot -proot shutdown'
alias mysqladmin='mysqladmin5 -uroot -proot'
alias mysql='mysql5'
alias mysqldump='mysqldump5'


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


# benchmarking stuff to remember
#siege -c20 www.stefanjudis.de/__get/all -b -t30sbenchmarking

# alias npme='npm --registry registry.npmjs.eu '

# enable harmony by default
# alias node='node --harmony'
