#!/bin/bash

source ./setenv.sh

echo "Enter directory name for sample proxy to be deployed, followed by [ENTER]:"

read proxy

echo "Enter your password for the Apigee Enterprise organization $org, followed by [ENTER]:"

read -s password

FILE="../android-oauth/apiproxy/policies/Redirect-To-Login.xml"
#updating the callback URL
echo "Updating the callback URL"

if [ ! -f "Redirect-To-Login.xml.org" ]; then
	cp $FILE Redirect-To-Login.xml.org
fi

#cp Redirect-To-Login.xml.org Redirect-To-Login.xml

sed -e 's@CALLBACKTOCHANGE@'"$callback_url"'@g' Redirect-To-Login.xml.org > Redirect-To-Login.xml
mv Redirect-To-Login.xml $FILE

echo Deploying $proxy to $env on $url using $username and $org

../tools/deploy.py -n $proxy -u $username:$password -o $org -h $url -e $env -p / -d ../$proxy -h $url

mv Redirect-To-Login.xml.org $FILE

echo "If 'State: deployed', then your API Proxy is ready to be invoked."

echo "Change directory to the sample API proxy deployed, and run 'invoke.sh'"

./provisioning.sh $proxy $password
