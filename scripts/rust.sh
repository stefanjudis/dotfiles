#!/usr/bin/env sh

echo "#############################"
echo "# Installing rust and packages"
echo "#############################"
echo ""

echo "Installing rust..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo "Installing rust packages..."
# nothing here yet
