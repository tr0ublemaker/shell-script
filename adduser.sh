#!/bin/bash
logfile_name=add_users_`date +%Y_%m_%d`_00.log
i=1
flag=false
while [ -f $logfile_name ]; do
     logfile_name=add_users_`date +%Y_%m_%d`_0$i.log
     let i+=1
done
echo "Do you want to overwrite password if user exists (true/false)?"
read flag
cat demo.txt | while read line; do
    username=`echo $line | awk '{print $1}'`
    password=`echo $line | awk '{print $2}'`
    user=`awk -F : '{print $1}' /etc/passwd | grep "\<$username\>"`
    if [ -z $password ]; then
        password=$username'11'
    fi
    if [ "$username" == "$user" ]; then
          echo "The user $username exists"
          if [ "$flag" == "true" ]; then
              echo "$user: username overwrite." >> $logfile_name 
              echo "$username : $password" >> $logfile_name 
          else
              echo "$user: username creates failure,user exists." >> $logfile_name 
              continue 
          fi
     fi
    useradd -d /home/$username $username    
    echo "$username:$password" | chpasswd
done
