#/bin/bash

user_id=$(id -u) #--get userid

if [ $user_id -eq 0 ]; then
    echo "root user processing....r"
    else
    echo "You are not root user, Please run the script with root user"
    exit 1
fi

timestamp(){
    $(date +"%F %T")
}

Start_time=$(timestamp)

for package in $@; 
do
    #--check package already installed or not
    dnf list installed ${package}
    if [ $? -eq 0 ]; then
        echo "$package is already installed ...skipping"
else
    echo "${package} is not installed, Processing installation"
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