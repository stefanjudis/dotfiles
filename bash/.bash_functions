# create a new directory and enter it
function md() {
  mkdir -p "$@" && cd "$@"
}


# find shorthand
function f() {
  find . -name "$1"
}


# All the dig info
function digga() {
  dig +nocmd "$1" any +multiline +noall +answer
}


# Escape UTF-8 characters into their 3-byte format
function escape() {
  printf "\\\x%s" $(printf "$@" | xxd -p -c1 -u)
  echo # newline
}
