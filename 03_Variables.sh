#!/bin/bash

# --test about Variables--

var1=10
var2=20
var3=bhar

echo "Total is : $(($var1 + $var2)) + ${var3}"


#---Out_put::Total is : 30 + bhar


var1=10
var2=20
var3=bhar

echo "Total is : $(($var1 + $var2)) $var3" 
#---out_put Total is : 30 bhar

echo "Total is : $(($var1 + $var2))$var3" 
#---output Total is : 30bhar


Name="Bhargava A"

echo "My name is : $(${Name}nanda)" #---not working because of $() is used for command substitution, so it will try to execute the command ${Name}nanda which is not valid.

echo "My name is : ${Name}nanda" #--woerk because of ${Name} is used for variable substitution, so it will replace ${Name} with its value and then append nanda to it.








