ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} (╯°□°)╯"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%} ヾ(⌐■_■)ノ"

function prompt_char {
  if [ $UID -eq 0 ]; then echo "%{$fg[red]%}#%{$reset_color%}"; else echo "%{$fg[blue]%}>%{$reset_color%}"; fi
}

PS1_EMOJIS=("😀" "😬" "😁" "😂" "😃" "😄" "😅" "😆" "😇" "😉" "😊" "🙂" "🙃" "😋" "😌" "😍" "😘" "😗" "😙" "😚" "😜" "😝" "😛" "🤑" "🤓" "😎" "🤗" "😏" "😶" "😑" "🙄" "🤔" "😳" "😞" "😟" "😠" "😔" "😕" "🙁" "😣" "😖" "😩" "😤" "😮" "😱" "😨" "😰" "😯" "😦" "😧" "😢" "😥" "😪" "😓" "😭" "😲" "🤐" "😷" "😴" "💩" "😺" "😸" "😹" "😻" "😼" "😽" "🙀" "😿" "😾" "👏" "👋" "🕶" "🐶" "🐱" "🐭" "🐹" "🐰" "🐻" "🐼" "🐨" "🐯" "🦁" "🐮" "🐷" "🐽" "🐸" "🐙" "🐵" "🙈" "🙉" "🙊" "🐒" "🐔" "🐧" "🐦" "🐤" "🐣" "🐥" "🐺" "🐗" "🐴" "🦄" "🐝" "🐛" "🐌" "🐞" "🐍" "🐢" "🐠" "🐟" "🐡" "🐬" "🐳" "🐋" "🐊" "🐆" "🐅" "🐃" "🐂" "🐄" "🐪" "🐫" "🐘" "🐐" "🐏" "🐑" "🐎" "🐀" "🐁" "🐓" "🦃" "🕊" "🐕" "🐩" "🐈" "🐇" "🐿" "🐾" "🐉" "🐲")


PROMPT='
%(?, ,%{$fg[red]%}FAIL: $?%{$reset_color%})

%{$fg_bold[blue]%}%~%{$reset_color%} ${PS1_EMOJIS[$RANDOM % 152]}  ${PS1_EMOJIS[$RANDOM % 152]}  ${PS1_EMOJIS[$RANDOM % 152]}  $(git_prompt_info)

%_$(prompt_char) '

RPROMPT='%{$fg[green]%}[%*]%{$reset_color%}'

# color title bar in iterm
# https://www.felixjung.io/posts/custom-iterm2-titlebar-background-colors
echo -e "\033]6;1;bg;red;brightness;50\a"
echo -e "\033]6;1;bg;green;brightness;54\a"
echo -e "\033]6;1;bg;blue;brightness;62\a"
