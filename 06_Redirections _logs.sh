#!/bin/bash


User_id=$(id -u)
logs_folder="/var/log/Learn_shell"
logs_file="${logs_folder}/${0}.log"

if [ $User_id -lt 999 ]; then
    echo "You are root user, proceeding your request"
    else
    echo "You are not root user, Please run the script with root user"
    exit 1
fi

#i need to store logs
mkdir -p $logs_folder
#--start time
echo "Start_Time at $(date +%F %T)" >> $logs_file

Validate() {
    if [ $1 -ne 0 ]; then
        echo "$2 installation failed, Please check the issue with the server" | tee -a $logs_file
        exit 1
    else
        echo "$2 installation is success"    | tee -a $logs_file
    fi
}

dnf install nginx -y &>> $logs_file
validate $? "Nginx"
echo "End_Time at $(date +%F %T)" >> $logs_file



