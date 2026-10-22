#/bin/bash

user_id=$(id -u) #--get userid
logs_folder="/var/log/learn_shell"
logfile="${logs_folder}/${0}.log"

if [ $user_id -eq 0 ]; then
    echo "root user processing....r"
    else
    echo "You are not root user, Please run the script with root user"
    exit 1
fi
#--create a dir for logs
mkdir -p $logs_folder

timestamp(){
   echo "time at :$(date +"%F %T")"
}

echo "Start_time=$(timestamp)"

for package in $@; 
do
    #--check package already installed or not
    dnf list installed ${package} -y & >> $logfile
    
    if [ $? -eq 0 ]; then
        echo "$package is already installed ...skipping"
else
    echo "${package} is not installed, Processing installation"
    dnf install ${package} -y      & >> $logfile
    echo "installation is success ....." & >> $logfile
    validate $? "${package} installation"
fi
done

validate() {
    if [ $1 -eq 0 ]; then  
        echo "$2 installation is success"
    else
       echo "$2 installation failed, Please check the issue with the server"
        exit 1
    fi

}
    echo "end time=$(timestamp)"
  echo "installation is success ....."  