#!/bin/bash
#~~~~~~~~~~#
# Finally Understand: Crucial Keys, Continuous Protection Patch
#~~~~~~~~~~#

echo "Will you be using the local machine to save these files or a dedicated backup server?"
echo "1 = Local machine"
echo "2 = Dedicated backup server"

read -p "Enter: " userinput


if [ $userinput == '1' ]; then
  mkdir /var/log/ftp 
  mkdir /opt/backup

  cp /etc/vsftpd.conf /var/log/ftp
  cp /etc/vsftpd.conf /opt/backup

  cp -r /etc/ssh /var/log/ftp
  cp -r /etc/ssh /opt/backup

  cp -r /home /var/log/ftp
  cp -r /home /opt/backup

  tar -czf ~/home/backup.tar.gz /var/log/ftp

else 
  echo "What is the IP of your backup server?"
  read -p "Enter IP: " backupip
  mkdir ~/backup

  cp /etc/vsftpd.conf ~/backup

  cp -r /etc/ssh ~/backup

  cp -r /home ~/backup

  tar -czf ~/home/backup.tar.gz ~/backup
fi
  scp ~/home/backup.tar.gz root@$backupip:/root

