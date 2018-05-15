#!/bin/sh
# from https://www.linux.com/news/making-secure-remote-backups-rsync
case "$SSH_ORIGINAL_COMMAND" in 
rsync\ --server*) 
$SSH_ORIGINAL_COMMAND 
;; 
*) 
echo "Key rejected: this ssh key can only call rsync" 
;; 
esac 
