ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}ˣ"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%} ✔"

function node_prompt_version {
  if which node &> /dev/null; then
    echo "%{$fg[green]%} ⬡ $(node -v)%{$reset_color%}"
  fi
}

PS1_EMOJIS=("😀" "😬" "😁" "😂" "😃" "😄" "😅" "😆" "😇" "😉" "😊" "🙂" "🙃" "😋" "😌" "😍" "😘" "😗" "😙" "😚" "😜" "😝" "😛" "🤑" "🤓" "😎" "🤗" "😏" "😶" "😑" "🙄" "🤔" "😳" "😞" "😟" "😠" "😔" "😕" "🙁" "😣" "😖" "😩" "😤" "😮" "😱" "😨" "😰" "😯" "😦" "😧" "😢" "😥" "😪" "😓" "😭" "😲" "🤐" "😷" "😴" "💩" "😺" "😸" "😹" "😻" "😼" "😽" "🙀" "😿" "😾" "👏" "👋" "🕶" "🐶" "🐱" "🐭" "🐹" "🐰" "🐻" "🐼" "🐨" "🐯" "🦁" "🐮" "🐷" "🐽" "🐸" "🐙" "🐵" "🙈" "🙉" "🙊" "🐒" "🐔" "🐧" "🐦" "🐤" "🐣" "🐥" "🐺" "🐗" "🐴" "🦄" "🐝" "🐛" "🐌" "🐞" "🐍" "🐢" "🐠" "🐟" "🐡" "🐬" "🐳" "🐋" "🐊" "🐆" "🐅" "🐃" "🐂" "🐄" "🐪" "🐫" "🐘" "🐐" "🐏" "🐑" "🐎" "🐀" "🐁" "🐓" "🦃" "🕊" "🐕" "🐩" "🐈" "🐇" "🐿" "🐾" "🐉" "🐲")


PROMPT='
%(?, ,%{$fg[red]%}FAIL: $?%{$reset_color%})

%{$fg_bold[blue]%}%~%{$reset_color%} $(node_prompt_version) $(git_prompt_info)

${PS1_EMOJIS[$RANDOM % 152]}  ➡ '

RPROMPT='%{$fg[green]%}[%*]%{$reset_color%}'

# color title bar in iterm
# https://www.felixjung.io/posts/custom-iterm2-titlebar-background-colors
echo -e "\033]6;1;bg;red;brightness;50\a"
echo -e "\033]6;1;bg;green;brightness;54\a"
echo -e "\033]6;1;bg;blue;brightness;62\a"
