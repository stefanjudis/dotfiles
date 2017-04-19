# find shorthand
function f() {
  find . -name "$1"
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

function compress_video() {
  if ! [ $# -eq 2 ]; then
    echo "Wrong parameter usage: \n $ compress_video <inputFile> <outputFile>"
    return 1
  fi

  ffmpeg -i $1 -vcodec h264 -b:v 1000k -acodec mp2 $2
}