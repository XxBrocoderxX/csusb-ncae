#!/bin/bash
#~~~~~~~
# A second approach to this?
#         ___
#    .-"`   `"-.
#  .'           '.
# /               \
#/  #              \
#| #               |
#|                 |
#;     .-~~~-.     ;
# ;     )   (     ;
#  \   (     )   /
#   \   \   /   /
#    \   ) (   /
#     |  | |  |
#     |__|_|__|
#     {=======}
#     }======={
#     {=======}
#     }======={
#  jgs{=======}
#      `""u""`
#~~~~~~~

if [ "$EUID" -ne 0 ]; then
    echo 'script requires root privileges'
    exit 1
fi

while  2>1; do 
echo "Enter a source directory: (e.g /etc/ssh)"
read -p "Source directory: " sourcedir
echo "Enter a destination directory: (e.g /opt/backups"
read -p "Destination directory: " destdir

rsyanc -av $sourcedir $destdir

