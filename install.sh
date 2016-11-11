#!/bin/bash

TARGET="/usr/local/bin"
CWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo ""
echo "====== Docker Humbler ======"
echo "Hello, the following symlinks are about to be written:"
echo ""
echo "   $TARGET/humble"
echo ""
#echo "IMPORTANT:"
#echo "You will need to give **sudo permission* to this script."

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

echo "Install Docker Humble..."
[ ! -f "$TARGET/humble" ] && ln -s "$CWD/bin/humble.sh" "$TARGET/humble"
echo "completed!"
