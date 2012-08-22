#up on level
alias ..='cd ..' 
alias ...='cd ../..' 

# go to sites directory
alias sites='cd /Users/stefan/Sites'

# go to last directory
alias -- -='cd -'

# apache handling
alias ap_restart='sudo /opt/local/etc/LaunchDaemons/org.macports.apache2/apache2.wrapper restart'
alias ap_start='sudo /opt/local/etc/LaunchDaemons/org.macports.apache2/apache2.wrapper start'
alias ap_stop='sudo /opt/local/etc/LaunchDaemons/org.macports.apache2/apache2.wrapper stop'
alias ap_conf='cd /opt/local/apache2/conf/'
alias ap_vhosts='vim /opt/local/apache2/conf/extra/httpd-vhosts.conf'

# sexy list handling
alias ll='ls -AFhlG'

# yt 
alias ytout='tail -f /Users/stefan/Sites/youtailor_trunk/var/log/test.out.log'
alias ytlog='tail -f /Users/stefan/Sites/youtailor_trunk/var/log/system.log'
alias yterror='tail -f /Users/stefan/Sites/youtailor_trunk/var/log/exception.log'
alias rmYTcache='rm -rf /Users/stefan/Sites/youtailor_trunk/var/cache/*'
alias rmLULcache='rm -rf /Users/stefan/Sites/magentovirgin/var/cache/*'

# needle handling
alias needle='cd /Users/stefan/Sites/needle/'
alias needleSync='bash /Users/stefan/Sites/needle/tools/syncToMagento.sh /Users/stefan/Sites/needle/ /Users/stefan/Sites/youtailor_trunk/'

# mysql handling
alias mysqlstart='sudo /opt/local/bin/mysqld_safe5 &'
alias mysqlstop='sudo mysqladmin5 -uroot -proot shutdown'
alias mysqladmin='mysqladmin5 -uroot -proot'
alias mysql='mysql5'
alias mysqldump='mysqldump5'

# start node autosave tool
alias startAutosave='/Users/stefan/sites/chrome-devtools-autosave-server/bin/autosave --config /Users/stefan/sites/chrome-devtools-autosave-server/config.js'

# start couch db
alias couchdb="sudo couchdb"

# my website handling
alias sj='cd /Users/stefan/Sites/stefanjudis/'

# connect to uberspace via ssh
alias uberssh="ssh stefanj@stefanj.aquarius.uberspace.de"

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# git handling
alias g="git"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# stylus alias for watching and compressing files
alias styluswatch="stylus -c -w"

# svn handling
alias svnAddAll="svn status | awk '{if ($1 == "?") print $2 }' | xargs svn add"
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"

# Colorful cat command
alias cat="pygmentize -O style=monokai -f console256 -g"

# ip address
alias ip="echo Your ip is; dig +short myip.opendns.com @resolver1.opendns.com;" 

# create new server on given port
alias server='open http://localhost:8000 && python -m SimpleHTTPServer'

# launch applications
alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
alias chrome_debug='chrome --remote-debugging-port=9222'
