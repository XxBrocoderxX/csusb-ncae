#!/bin/bash
#~~~~~~~~~~#
# Finally Understand: Crucial Keys, Continuous Protection Patch
#~~~~~~~~~~#

echo "Will you be using the local machine to save these files or a dedicated backup server?"
echo "1 = Local machine"
echo "2 = Dedicated backup server"

read -p "Enter: " userinput
echo "Enter where you want these files backed up (e.g /opt/backup)"
read -p "Directory: " backupdir

if [ $userinput == '1' ]; then
  mkdir $backupdir 

  cp /etc/vsftpd.conf $backupdir

  cp -r /etc/ssh $backupdir

  cp -r /home $backupdir
  
  tar -czf ~/home/backup.tar.gz $backupdir

else 
  echo "What is the IP of your backup server?"
  read -p "Enter IP: " backupip
  mkdir $backupdir

  cp /etc/vsftpd.conf $backupdir

  cp -r /etc/ssh $backupdir

  cp -r /home $backupdir

  tar -czf ~/home/backup.tar.gz $backupdir
fi
  scp $backupdir/backup.tar.gz root@$backupip:/root

