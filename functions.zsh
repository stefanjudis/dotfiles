# find shorthand
function f() {
  find . -name "$1"
}

# quickly look up a folder
# grep-folder perf-*
function grep-folder() {
  ll | grep $1
}


# lets toss an image onto my server and pbcopy those sweetcheeks.
function scpp() {
    scp "$1" stefanj@stefanj.aquarius.uberspace.de:~/html/share;
    echo "http://stefanjudis.de/share/$1" | pbcopy;
    echo "Copied to clipboard: stefanjudis.de/share/$1"
}

# quickly query entries from contentful
function ctf() {
  if ! [ -f ~/.contentful.json ]; then
    echo "Please define ~/.contentful.json ..."
    return 1
  fi

  if ! [ $# -gt 0 ]; then
    echo "Please define command to execute\n  $ ctf <command>"
    return 1
  fi

  DATA=($(jq '.'$2 ~/.contentful.json))
  SPACE_ID=($(echo $DATA | jq -r '.spaceId'))
  CDA_TOKEN=($(echo $DATA | jq -r '.cdaToken'))

  if [ $1 == "entry" ] && ! ctf_entry $SPACE_ID $CDA_TOKEN $3; then
    return 1
  fi

  if [ $1 == "list" ] && ! ctf_list $SPACE_ID $CDA_TOKEN $3; then
    return 1
  fi
}

function ctf_entry() {
  if ! [ $# -eq 3 ]; then
    echo "Wrong parameter usage: \n  $ ctf entry <configName> <entryId>"
    return 1
  else
    ENTRY_ID=$3
    echo "Calling -> https://cdn.contentful.com/spaces/${SPACE_ID}/entries?access_token=${CDA_TOKEN}&sys.id=${ENTRY_ID}\n"
    curl "https://cdn.contentful.com/spaces/${SPACE_ID}/entries?access_token=${CDA_TOKEN}&sys.id=${ENTRY_ID}" | jq ".items[0]"
  fi
}

function ctf_list() {
  if ! [ $# -eq 3 ]; then
    echo "Wrong parameter usage: \n  $ ctf list <configName> <contentTypeId>";
    return 1
  else
    CONTENT_TYPE=$3;
    echo "Calling -> https://cdn.contentful.com/spaces/${SPACE_ID}/entries?access_token=${CDA_TOKEN}&content_type=${CONTENT_TYPE}\n";
    curl "https://cdn.contentful.com/spaces/${SPACE_ID}/entries?access_token=${CDA_TOKEN}&content_type=${CONTENT_TYPE}" | jq ".items";
  fi
}

function prepare_video() {
  if ! [ $# -eq 2 ]; then
    echo "Wrong parameter usage: \n $ prepare_video <inputFile> <outputFileBase>"
    return 1
  fi

  ffmpeg -i $1 -vcodec h264 -b:v 1000k -acodec mp2 $2.mp4
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

# Create a git.io short URL
gitio() {
	if [ -z "${1}" ] || [ -z "${2}" ]; then
		echo "Usage: \`gitio slug url\`"
		return 1
	fi
	curl -i https://git.io/ -F "url=${2}" -F "code=${1}"
}

# Change MAC adress to get around public wifi limitations
hack_the_space() {
  NEW_MAC_ADDRESS=$(openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//')
  echo $NEW_MAC_ADDRESS
  sudo ifconfig en0 ether "$NEW_MAC_ADDRESS"
  echo "New MAC Address set"
}

# Create beautiful code images
carbon() {
  carbon-now <(pbpaste) -l /tmp/carbon
  open /tmp/carbon/
}

# Load .env file
loadEnv() {
  set -o allexport; source .env; set +o allexport
}