#!/bin/bash

user="admin"
password=$(./get_login_info.sh ${user}|cut -d: -f2)

mysql -u ${user} -p${password} -h 127.0.0.1 -P6032 -e 'select * from stats_mysql_query_digest_reset order by sum_time desc'

