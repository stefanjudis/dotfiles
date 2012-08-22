export PATH=/opt/local/bin:/opt/local/sbin:/Users/stefan:/usr/local:/opt/local/narwhal/bin:$PATH

#node settings for finding global installed modules
export NODE_PATH="/opt/local/lib/node_modules"

# Load ~/.extra, ~/.bash_prompt, ~/.exports, ~/.aliases and ~/.functions
# ~/.extra can be used for settings you don’t want to commit
for file in ~/.{bash_prompt,bash_aliases,bash_functions,bash_exports}; do
	[ -r "$file" ] && source "$file"
done
unset file

# git completion
source ~/Shell/.git-completion.sh

# z script
. ~/Shell/z/z.sh


# Colorful terminal
export CLICOLOR=1
export LSCOLORS=export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# setting bash auto completion
 if [ -f /opt/local/etc/bash_completion ]; 
 then
 . /opt/local/etc/bash_completion
 fi

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh
