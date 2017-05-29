rsync -av --delete -e "ssh -i /home/matthew/.ssh/id_rsa" /home/matthew/documents me388@cluster2.tcm.phy.cam.ac.uk:~/
rsync -av --exclude-from '/home/matthew/.dotfiles/rsync_exclude.txt' -e "ssh -i /home/matthew/.ssh/id_rsa" me388@cluster2.tcm.phy.cam.ac.uk:~/proj /home/matthew
rsync -av --delete --exclude-from '/home/matthew/.dotfiles/rsync_exclude.txt' -e "ssh -i /home/matthew/.ssh/id_rsa" me388@cluster2.tcm.phy.cam.ac.uk:~/proj/LiPX /home/matthew/proj/
