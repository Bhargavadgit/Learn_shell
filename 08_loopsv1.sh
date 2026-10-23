# #/bin/bash
# 
user_id=$(id -u) #--get userid
logs_folder="/var/log/Learn_shell"
logs_file="${logs_folder}/${0}.log"

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

validate() {
    if [ $1 -ne 0 ]; then   
       echo "$2 installation failed, see logs"
        exit 1
    fi

}

echo "Start_time=$(timestamp)"

for Package in "$@";
do
        dnf list installed | grep $Package &>> $logs_file

        if [ $? -eq 0 ]; then
            echo "$Package is already installed ...skipping"
        else
            dnf install $Package -y &>> $logs_file
            validate $? "Installing ${Package}" 
        fi


done    

echo "End_time=$(timestamp)"

echo "total time = $(end_time)-$(start_time)"