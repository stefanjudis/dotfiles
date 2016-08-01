ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} (╯°□°)╯"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%} ヾ(⌐■_■)ノ"

function prompt_char {
  if [ $UID -eq 0 ]; then echo "%{$fg[red]%}#%{$reset_color%}"; else echo ">"; fi
}

PS1_EMOJIS=("😀" "😬" "😁" "😂" "😃" "😄" "😅" "😆" "😇" "😉" "😊" "🙂" "🙃" "☺️" "😋" "😌" "😍" "😘" "😗" "😙" "😚" "😜" "😝" "😛" "🤑" "🤓" "😎" "🤗" "😏" "😶" "😑" "🙄" "🤔" "😳" "😞" "😟" "😠" "😔" "😕" "🙁" "😣" "😖" "😩" "😤" "😮" "😱" "😨" "😰" "😯" "😦" "😧" "😢" "😥" "😪" "😓" "😭" "😲" "🤐" "😷" "😴" "💩" "😺" "😸" "😹" "😻" "😼" "😽" "🙀" "😿" "😾" "👏" "👋" "👂" "👁" "💋" "🕶" "🐶" "🐱" "🐭" "🐹" "🐰" "🐻" "🐼" "🐨" "🐯" "🦁" "🐮" "🐷" "🐽" "🐸" "🐙" "🐵" "🙈" "🙉" "🙊" "🐒" "🐔" "🐧" "🐦" "🐤" "🐣" "🐥" "🐺" "🐗" "🐴" "🦄" "🐝" "🐛" "🐌" "🐞" "🐜" "🕷" "🦂" "🦀" "🐍" "🐢" "🐠" "🐟" "🐡" "🐬" "🐳" "🐋" "🐊" "🐆" "🐅" "🐃" "🐂" "🐄" "🐪" "🐫" "🐘" "🐐" "🐏" "🐑" "🐎" "🐖" "🐀" "🐁" "🐓" "🦃" "🕊" "🐕" "🐩" "🐈" "🐇" "🐿" "🐾" "🐉" "🐲" "🕸" "🍤" "🏇")

_p1_emoji () {
  printf "${PS1_EMOJIS[$RANDOM % 152]} ${PS1_EMOJIS[$RANDOM % 152]} ${PS1_EMOJIS[$RANDOM % 152]}  "
}

PROMPT='%(?, ,%{$fg[red]%}FAIL: $?%{$reset_color%})
%{$fg_bold[blue]%}%n%{$reset_color%} $(_p1_emoji)  %{$fg_bold[blue]%}%~%{$reset_color%}$(git_prompt_info)

%_$(prompt_char) '

RPROMPT='%{$fg[green]%}[%*]%{$reset_color%}'
