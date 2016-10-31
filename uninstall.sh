#!/bin/bash

TARGET="/usr/local/bin"
CWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo ""
echo "====== Docker Humbler ======"
echo "Hello, the following symlinks are about to be removed:"
echo ""
echo "   $TARGET/humble"
echo "   $TARGET/humble-server"
echo ""
echo "IMPORTANT:"
echo "You will need to give **sudo permission* to this script."
echo ""
echo "Do you want to continue? (y/n)"
CONFIRM_OPERATION=false
read -s -n1 option
case $option in
    $'y') CONFIRM_OPERATION=true
esac

if [ "$CONFIRM_OPERATION" == "false" ]; then
    echo "Install aborted!"
    exit 0
fi

[ -f "$TARGET/humble" ] && sudo rm "$TARGET/humble"
[ -f "$TARGET/humble-server" ] && sudo rm "$TARGET/humble-server"
