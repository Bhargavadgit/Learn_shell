#!/bin/bash


User_id=$(id -u)
logs_folder="/var/log/learn_shell"
logs_file="${logs_folder}/${0}.log"

if [ $User_id -lt 999 ]; then
        echo "You are root user, Please proceed with the operations"
else
        echo "You are not root user, Please run the script with root user"
        exit 1    
fi
#-- need to create a log folder -p it will create the folder if it is not present,
#-- if it is present it will not give any error
mkdir -p $logs_folder

#--create afile for current script logs

#--Call function    ---- Validate $? "Nginx"

validate() {
    if [ $1 -ne 0 ]; then
        echo "$2 installation failed, Please check the issue with the server" |  tee -a $logs_file
        exit 1
    else
        echo "$2 installation is success"   | tee -a $logs_file
    fi
}
#----start & end time i need to see in desktop
#----error logs need t go log file

echo "Script start time : $(date +"%F %T" )" &>> $logs_file | tee -a $logs_file
echo "Script started execution at $(date +"%F %T")" &>> $logs_file
echo "Processing ....."

dnf install mysql -y &>> $logs_file 
validate $? "MySQL "

echo "installation is success ....."
echo "Script end time : $(date +"%F %T" )" &>> $logs_file