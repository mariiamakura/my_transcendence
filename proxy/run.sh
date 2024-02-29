#!/bin/sh

#tells the shell to exit immediately if any command exits with 
#a non-zero status, effectively halting the script if any 
#errors occur.
set -e

#command takes the contents of the template 
#file /etc/nginx/default.conf.tpl, substitutes any environment 
#variables present in the template, and then saves the result 
#to the file /etc/nginx/conf.d/default.conf.
envsubst < /etc/nginx/default.conf.tpl > /etc/nginx/conf.d/default.conf

nginx -g 'daemon off;'
