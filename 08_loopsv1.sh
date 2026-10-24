# #/bin/bash
# 
user_id=$(id -u) #--get userid
logs_folder="/var/log/Learn_shell"
logs_file="${logs_folder}/${0}.log"
#-- add clours to messages
R='\e[31m' # Red
G='\e[32m' # Green
Y='\e[33m' # Yellow
N='\e[0m'  # No Color


if [ $user_id -eq 0 ]; then
    echo "root user processing...."
    else
    echo "You are not root user, Please run the script with root user"
    exit 1
fi

#--create a dir for logs
mkdir -p $logs_folder

timestamp(){
   echo "time at :$(date "+%F_%T")"
}

validate() {
    if [ $1 -ne 0 ]; then   
       echo -e "${R}$2 installation failed, see logs${N}"
        exit 1
    fi

}

echo "Start_time=$(timestamp)" | tee -a $logs_file

for Package in "$@";
do
        dnf list installed | grep $Package &>> $logs_file

        if [ $? -eq 0 ]; then
            echo -e "${G}$Package is already installed ...${Y}skipping${N}"
        else
            dnf install $Package -y &>> $logs_file
            validate $? "${G}Installing ${Package}${N}" 
        fi


done    

echo "End_time=$(timestamp)" | tee -a $logs_file

echo "total time to run : $seconds"

