#!/bin/bash 

echo "Welcome in the ENCRYPTOR"
echo "------------------------"

user="$USER"
echo "Hello $user please write the First Name of the client:"

read firstname

mkdir $firstname ~/Desktop/$firstname
touch ~/Desktop/$firstname/credentials.txt

echo "Please enter the username and the password to provide:"
echo "Username: $username"
read username
echo "Password: "
read -s password 
echo "Username: $username ; Password: $password" > ~/Desktop/$firstname/credentials.txt 

# I have to write the NO part

echo "We are now starting the encryption, do you want to generate a password for your ZIP ? (Y/n)"

read -s reponse


if  [[ "$reponse" == "y" ]]
then 
    generatedpass=$(openssl rand -base64 10)
    echo "Please find here your password:
    =====================================
    $generatedpass
    ====================================="
fi

# I would like, if yes then It will generate the password AND autocomplete the openssl prompt if no then just continue

# Encryption Process is starting here

zipname="${firstname}Access"
echo "We are now starting the encryption, Please provide the ZIP Password:"
zip -erj ~/Desktop/$zipname.zip ~/Desktop/$firstname


# Once the encrypted ZIP created we remove the orginial file from the Desktop 

rm  -r ~/Desktop/$firstname

echo "Your folder is READY"
open ~/Desktop/
