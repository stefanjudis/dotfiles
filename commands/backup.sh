# get current location
ROOT_DIR=$1
CONFIG_DIR="$ROOT_DIR/config"

echo "running commands/backup.sh"

# backign up VS Code extensions
code --list-extensions > "$CONFIG_DIR/visual-studio-code-extensions.txt"