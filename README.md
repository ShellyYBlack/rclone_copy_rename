# rclone_copy_rename
This script will save a list of filepaths and IDs from a Google Drive remote using [rclone](https://rclone.org). Then it will copy the files, appending "copy_" and sequential numbers to duplicate names.

This is an alternative to using `rclone dedupe` which is destructive and requires Editor permissions. Additionally, whereas the dedupe option removes files that share names and hashes, this script allows you to keep them.
