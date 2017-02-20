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
    echo "Please define ~/.contentful.json ...";
    return;
  fi

  DATA=($(jq -r '.website' ~/.contentful.json));
  SPACE_ID=($(echo $DATA | jq -r '.spaceId'));
  CDA_TOKEN=($(echo $DATA | jq -r '.cdaToken'));

  if [ $1 == "entry" ]; then
    if ! [ $# -eq 2 ]; then
      echo "Wrong parameter usage: \n  $ ctf entry <entryId>";
    else
      ENTRY_ID=$2;
      echo "Calling -> https://cdn.contentful.com/spaces/${SPACE_ID}/entries?access_token=${CDA_TOKEN}&sys.id=${ENTRY_ID}\n";
      curl "https://cdn.contentful.com/spaces/${SPACE_ID}/entries?access_token=${CDA_TOKEN}&sys.id=${ENTRY_ID}" | jq ".items[0]";
    fi

    return;
  fi


  if [ $1 == "list" ]; then
    if ! [ $# -eq 2 ]; then
      echo "Wrong parameter usage: \n  $ ctf list <contentTypeId>";
    else
      CONTENT_TYPE=$2;
      echo "Calling -> https://cdn.contentful.com/spaces/${SPACE_ID}/entries?access_token=${CDA_TOKEN}&content_type=${CONTENT_TYPE}\n";
      curl "https://cdn.contentful.com/spaces/${SPACE_ID}/entries?access_token=${CDA_TOKEN}&content_type=${CONTENT_TYPE}" | jq ".items";
    fi

    return;
  fi
}