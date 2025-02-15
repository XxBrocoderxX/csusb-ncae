#!/bin/bash
#~~~~~~~~~~#
# Finally Understand: Crucial Keys, Continuous Protection Patch
#~~~~~~~~~~#

Echo "Will you be using the local machine to save these files or a dedicated backup server?"
Echo "1 = Local machine"
Echo "2 = Dedicated backup server"
read userinput


if userinput == "1":
  mkdir /var/log/ftp 
  mkdir /opt/backup

  cp /etc/vsftpd.conf /var/log/ftp
  cp /etc/vsftpd.conf /opt/backup

  cp -r /etc/ssh /var/log/ftp
  cp -r /etc/ssh /opt/backup

  cp -r /home /var/log/ftp
  cp -r /home /opt/backup

  tar -czf ~/home/backup.tar.gz /var/log/ftp

else: 
  echo "What is the IP of your backup server?"
  read backupip
  mkdir ~/backup

  cp /etc/vsftpd.conf ~/backup

  cp -r /etc/ssh ~/backup

  cp -r /home ~/backup

  tar -czf ~/home/backup.tar.gz ~/backup

  scp ~/home/backup.tar.gz root@$backupip:/root
