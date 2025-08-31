#!/bin/bash
add()
{
read -p "enter the name of your database : " database
read -p "enter the name of your user : " dbuser
read -p "enter your password for database : " password
read -p "enter your root password for your database : " rootpass
read -p "enter your database port : " dbport
read -p "enter your nextcloud port : " nextcloud
echo -e "DBname=$database\nDBuser=$dbuser\nDBpassword=$password\nDBroot=$rootpass\nDBport=$dbport\nnextcloudport=$nextcloud" > .env

docker compose up -d


}
if [ $EUID -ne 0  ];
then
      echo "you should run it as root!"
      exit 1
fi
     
if [ -d /var/lib/docker ];
then 
      echo "let's go !"
      add
else
      echo "docker is not installed on your system , let's install ..." 
      curl -sSl https://get.docker.com | sh && add 
fi


