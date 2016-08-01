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

