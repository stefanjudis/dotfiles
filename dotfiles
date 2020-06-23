#!/usr/bin/env sh

set -e

ROOT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
COMMAND="$ROOT_DIR/commands/$1.sh"

if [ -e "$COMMAND" ]; then
  bash "$COMMAND" "$ROOT_DIR"
else
  echo "$1 is no defined command"
fi

