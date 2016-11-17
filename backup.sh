rsync -av -e --delete ssh ~/documents noggin:~/
rsync -av --exclude '/home/matthew/.dotfiles/rsync_exclude.txt' -e ssh noggin:~/proj ~/
