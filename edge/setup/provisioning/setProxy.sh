#!/bin/sh

#Backup the original ApiProduct Payload
source ../setenv.sh

if [ ! -f Product.json.orig ]; then
	cp Product.json Product.json.orig
fi

if [ ! -f joe-app.xml.orig ]; then
	cp joe-app.xml joe-app.xml.orig
fi

if [ -z $1 ]; then
	echo "Enter the ApiProxy(ies) to attach in ApiProduct (Comma separated):"
	while [ -z $apiproxy ]; do
		read apiproxy
	done
else
	apiproxy=$1
fi


value=$apiproxy
apiproxy=`echo $value | sed -e 's/ //g' | sed -e 's/,/","/g'`

echo "Filling the ProxyDetail in ApiProduct"

TMP_FILE=`mktemp /tmp/config.XXXXXXXXXX`
sed -e "s/PROXY/\"$apiproxy\"/" Product.json > $TMP_FILE
mv $TMP_FILE Product.json

#updating the callback URL
echo "Updating the authentication redirect URL"

TMP_FILE=`mktemp /tmp/policy.XXXXXXXXXX`
sed -e 's@CALLBACKTOCHANGE@'"$authredirect_url"'@g' joe-app.xml > $TMP_FILE

#sed -e "s/CALLBACKTOCHANGE/\"$callback_url\"/" joe-app.xml > $TMP_FILE
mv $TMP_FILE joe-app.xml
