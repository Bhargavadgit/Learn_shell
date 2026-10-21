#!/bin/bash

#---you can get userid from the Terminal using user_id command, which will return the user id of the current user.
#---here i am giving manuvally 0 to check the condition, if the user id is 0 then it means the user is root user, otherwise it is not root user.

Echo "Please enter user_id"
read user_id

if [ $(user_id) -lt 1000 ]; then
    echo "You are root user"
else
    echo "You are not root user"
fi



