ROOT_DIR=$1
CONFIG_DIR="$ROOT_DIR/config"

# installing VS Code extensions
cat  "$CONFIG_DIR/visual-studio-code-extensions.txt" | xargs -L 1 code --install-extension