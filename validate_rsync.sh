#!/bin/sh
# from https://www.linux.com/news/making-secure-remote-backups-rsync
case "$SSH_ORIGINAL_COMMAND" in 
*\&*) 
echo "Rejected1" 
;; 
*\(*) 
echo "Rejected2" 
;; 
*\{*) 
echo "Rejected3" 
;; 
*\;*) 
echo "Rejected5" 
;; 
*\<*) 
echo "Rejected6" 
;; 
*\>*) 
echo "Rejected7" 
;; 
*\`*) 
echo "Rejected8" 
;; 
*\|*) 
echo "Rejected9" 
;; 
rsync\ --server*) 
$SSH_ORIGINAL_COMMAND 
;; 
*) 
echo "Rejected10" 
;; 
esac 
