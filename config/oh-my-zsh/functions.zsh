# find shorthand
function f() {
  find . -name "$1"
}

cd(){
  [[ -t 1 && $((RANDOM%20)) -eq 0 ]] && echo " -> 🐶 \"woof\""; builtin cd "$@";
}

# quickly look up a folder
# grep-folder perf-*
function grep-folder() {
  ll | grep $1
}

function prepare_video() {
  if ! [ $# -eq 2 ]; then
    echo "Wrong parameter usage: \n $ prepare_video <inputFile> <outputFileBase>"
    return 1
  fi

  ffmpeg -i $1 -vcodec h264 -acodec mp2 $2.mp4
  ffmpeg -i $2.mp4 -strict -2 $2.webm
}

function gif_to_video() {
  if ! [ $# -eq 1 ]; then
    echo "Wrong parameter usage: \n $ compress_video <inputFile> <outputFileBase>"
    return 1
  fi

  ffmpeg -i $0 -movflags faststart -pix_fmt yuv420p -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" $2.mp4
  ffmpeg -i $2.mp4 -strict -2 $2.webm
}


#
# watchman test.txt 1 echo 'Tada!'
#
function watchman {
  initial_time=$(stat -f '%Z' $1)
  while true; do
    changed_time=$(stat -f '%Z' $1)
    if [ $initial_time != $changed_time ]; then
      eval ${@:3}
      initial_time=$changed_time
    fi
    sleep $2
  done
}

#
# Find a port blocker
#
function find_port_blocker() {
  if ! [ $# -eq 1 ]; then
    echo "Please define the port you want to check \n $ find_port_blocker 8000"
    return 1
  fi

  lsof -i tcp:$1
}

# Change MAC adress to get around public wifi limitations
function hack_the_space() {
  NEW_MAC_ADDRESS=$(openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//')
  echo $NEW_MAC_ADDRESS
  sudo ifconfig en0 ether "$NEW_MAC_ADDRESS"
  echo "New MAC Address set"
}

# Load .env file
function loadEnv() {
  set -o allexport; source $1; set +o allexport
  printf "Loaded vars in $1"
}

function diff() {
  if [ "$#" -ne 2 ]; then
    command diff "$@"
    return
  fi

  git diff --no-index $1 $2;
}

# overwrite mv command to also work with one argument
function mv() {
  if [ "$#" -ne 1 ] || [ ! -f "$1" ]; then
    command mv "$@"
    return
  fi

  newfilename="$1"
  vared newfilename
  command mv -v -- "$1" "$newfilename"
}

# create files in subfolders
function touchp() {
  mkdir -p "$(dirname "$1")/" && touch "$1"
}

# git handling
function clone() {
  git clone $1
  cd $(basename ${1%.*})

  if test -f "./package.json"; then
    echo "..."
    echo "Found package.json... installing dependencies"
    echo "..."
    npm install
  fi
}

function open-gql-playground() {
  local ENDPOINT=$1
  local AUTH_TOKEN=$2

  open "graphql-playground://endpoint=$ENDPOINT?headers={\"Authorization\": \"Bearer $AUTH_TOKEN\"}"
}

function npm-diff() {
  npm diff --diff=$1@$2 --diff=$1@$3 | delta --width $(tput cols) | less
}
