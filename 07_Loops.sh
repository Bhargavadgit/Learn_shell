# #/bin/bash

# 
user_id=$(id -u) #--get userid
logs_folder="/var/log/Learn_shell"
logfile="${logs_folder}/${0}.log"

if [ $user_id -eq 0 ]; then
    echo "root user processing...."
    else
    echo "You are not root user, Please run the script with root user"
    exit 1
fi
#--create a dir for logs
mkdir -p $logs_folder

timestamp(){
   echo "time at :$(date +"%F_%T")"
}

echo "Start_time=$(timestamp)"

validate() {
    if [ $1 -eq 0 ]; then  
        echo "$2 installation is success"
    else
       echo "$2 installation failed, Please check the issue with the server"
        exit 1
    fi

}

 for package in "$@"; 
 do
     #--check package already installed or not
    # dnf list installed $package  &>> $logfile  
    dnf list installed | grep $package &>> $logfile
    dnf list installed "$package" &>> $logfile
    validate $? "$package" 
     if [ $? -eq 0 ]; then
         echo "$package is already installed ...skipping"
         validate $? "$package"
 else
     echo "${package} is not installed, Processing installation"
    dnf install $package -y &>> $logfile
     validate $? "$package"
     echo "${package}installation is success ....." &>> $logfile
 fi
 done

#for package in "$@"; do

    #echo "Checking package: $package"

    #if dnf list installed "$package" >> "$logfile" 2>&1; then
      #  echo "$package is already installed. Skipping."
   # else
     #   echo "$package is not installed. Installing..."

      #  if dnf install "$package" -y >> "$logfile" 2>&1; then
      #      echo "$package installation succeeded"
      #  else
      #      echo "$package installation failed. Check $logfile"
       #     exit 1
      #  fi
   # fi

#done
    echo "end time=$(timestamp)"
  #echo "installation is success ....."  

  

