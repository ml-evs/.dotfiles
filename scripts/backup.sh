#!/bin/bash -l
# from https://stackoverflow.com/questions/2205282/ssh-agent-and-crontab-is-there-a-good-way-to-get-these-to-meet
echo -e "\e[94mBacking up papers..."
rsync -av --delete -e "ssh -i /home/matthew/.ssh/id_rsa_rsync" /home/matthew/documents me388@cluster2.tcm.phy.cam.ac.uk:/u/fs1/me388/ &&\
echo -e "\e[93mBacking up proj..."
rsync -av --exclude-from '/home/matthew/.dotfiles/rsync_exclude.txt' -e "ssh -i /home/matthew/.ssh/id_rsa_rsync" me388@cluster2.tcm.phy.cam.ac.uk:/u/fs1/me388/proj /home/matthew &&\
echo -e "\e[91mBacking up LiPX..."
rsync -av --delete --exclude-from '/home/matthew/.dotfiles/rsync_exclude.txt' -e "ssh -i /home/matthew/.ssh/id_rsa_rsync" me388@cluster2.tcm.phy.cam.ac.uk:/u/fs1/me388/proj/LiPX /home/matthew/proj/ &&\
echo -e "\e[92mBacking up KPX..."
rsync -av --delete --exclude-from '/home/matthew/.dotfiles/rsync_exclude.txt' -e "ssh -i /home/matthew/.ssh/id_rsa_rsync" me388@cluster2.tcm.phy.cam.ac.uk:/u/fs1/me388/proj/KPX  /home/matthew/proj/
