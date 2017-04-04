#!/bin/bash
# workaround for image issue
# requires: password file in /var/tmp/my.cnf
# with the following:
# [client]
# user=<plam_rewrite_username>
# password=<plam_rewrite_password>

filename=/var/tmp/my.cnf

if [ -z $1 ] || [ "$1" == "admin" ];then
  user="admin"
  password=$(grep password ${filename} |cut -d= -f2 |sed "s/mster//;s/am/m/;s/$/in/")
elif [ "$1" == "plam_rewrite" ];then
  user=$1
  password=$(grep password ${filename} |cut -d= -f2)
fi

echo ${user}:${password}
