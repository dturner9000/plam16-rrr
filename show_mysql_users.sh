#!/bin/bash

user="admin"
password=$(./get_login_info.sh ${user}|cut -d: -f2)

mysql -u ${user} -p${password} -h 127.0.0.1 -P6032 -e 'select * from mysql_users'

