#!/bin/bash


User_id=$(id -u)
logs_folder="/var/log/Learn_shell"
logs_file="${logs_folder}/${0}.log"

if [ $User_id -ne 0 ]; then
    echo "You are not root user, Please run the script with root user"
    exit 1
    else
    echo "You are root user, Proceeding script......"
fi

#i need to store logs
mkdir -p $logs_folder
#--start time After "+"" no space
echo  "Start_Time at $(date +"%F %T")" &>> $logs_file

Validate() {
    if [ $1 -ne 0 ]; then
        echo "$2 installation failed, Please check the issue with the server" | tee -a $logs_file
        exit 1
    else
        echo "$2 installation is success" | tee -a $logs_file
    fi
}

dnf install nginx -y &>> $logs_file
validate $? "Nginx"
echo "if you want to check logs refer /var/log/Learn_shell/${0}.log"
echo "End_Time at $(date +"%F %T")" &>> $logs_file



