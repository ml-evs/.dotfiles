rsync -av --delete -e ssh ~/documents noggin:~/
rsync -av --exclude-from '/home/matthew/.dotfiles/rsync_exclude.txt' -e ssh noggin:~/proj ~/
rsync -av --delete --exclude-from '/home/matthew/.dotfiles/rsync_exclude.txt' -e ssh noggin:~/proj/LiPX ~/proj/
