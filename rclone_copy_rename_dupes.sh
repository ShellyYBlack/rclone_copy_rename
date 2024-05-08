#!/bin/bash

# List all files and IDs, and save as TXT
rclone lsf -R --files-only --format pi GDrive:Born\ Digital/Born\ Digital\ Initiative\ 1.0/Electronic\ File\ Transfers/Test > $HOME/Desktop/path_ID_list.txt

while IFS=';' read -r path ID
do
    if ! [ -f $HOME/Desktop/rclone/$path ]; then
        rclone backend copyid -Pv --log-file $HOME/Desktop/log.txt GDrive: $ID $HOME/Desktop/rclone/$path
        i=1
    elif [ -f $HOME/Desktop/rclone/$path ]; then
        rclone backend copyid -Pv --log-file $HOME/Desktop/log.txt GDrive: $ID $HOME/Desktop/rclone/"${path%.*}"_copy""$i""."${path##*.}"
    fi
    (( ++i ))
done < $HOME/Desktop/path_ID_list.txt
