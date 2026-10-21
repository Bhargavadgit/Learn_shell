#!/bin/bash


#----Functions we are using to perform the operations in the script, functions might contains coding,scripting,conditions etc..
#----we can create the function() once , we can call the functions multiple times in the script.
#-- I am creating the function to check to install few servers


#----need to know sudo acces or not

User_id=$(id -u)

if [ $User_id -ne 0 ]; then
    echo "You are not root user, Please run the script with root user"
    exit 1
fi

#---Validate is function name

#--we need to give Parameters to the Function
#--Parameter $1 is $? to check exit status of last command
#--Parameter $2 is servername to install


#--Call function    ---- Validate $? "Nginx"

validate() {
    if [ $1 -ne 0 ]; then
        echo "$2 installation failed, Please check the issue with the server"
        exit 1
    else
        echo "$2 installation is success"    
    fi
}

echo "Processing ....."

dnf install nginx -y
validate $? "Nginx Installation"

echo "installation is success ....."
