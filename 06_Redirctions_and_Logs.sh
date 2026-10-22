#!/bin/bash

User_id=$(id -u)
#--log folder path & File path
logs_folder="/var/log/learn_shell"
logfile="${logs_folder}/${0}.log"

if [ $User_id -ne 0 ]; then
    echo "You are not root user, Please run the script with root user"
    exit 1
fi

# validate() {
#     if [ $1 -ne 0 ]; then  ## $1 -ne 0 => 
#          echo "$2 installation failed, Please check the issue with the server" | tee -a $logfile
#         exit 1
#     else
#         echo "$2 installation is success" | tee -a $logfile
#     fi
# }

validate() {
    if [ $1 -eq 0 ]; then  
        echo "$2 installation is success" | tee -a $logfile
    else
       echo "$2 installation failed, Please check the issue with the server" | tee -a $logfile
        exit 1
    fi
}

# mkdir -p $logs_folder

# echo "start time : $(date)" &>> $logfile

# echo "Processing ....."

dnf install nginxx -y 


touch charan


# echo "installation is success ....."

# echo "End time : $(date +"%F %T")" &>> $logfile