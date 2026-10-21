#!/bin/bash

#---you can get userid from the Terminal using (id -u), which will return the user id of the current user.
#---here i am giving manuvally 0 to check the condition, if the user id is 0 then it means the user is root user, otherwise it is not root user.

echo "Please enter user_id:"
read -s user_id

if [ ${user_id} -lt 1000 ]; then
    echo "You are root user.....
    Access granted to perform the operations"
else
    echo "You are not root user Please Proceed with root user/ contact your system administrator"
fi



