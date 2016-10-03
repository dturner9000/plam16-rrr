#!/bin/bash
#
user="admin"
password=$(./get_login_info.sh ${user}|cut -d: -f2)

stmt="delete from mysql_query_rules where comment like '%lesson%'; LOAD MYSQL QUERY RULES TO RUNTIME"
mysql -vvv -u ${user} -p${password} -h 127.0.0.1  -P6032  -e "${stmt}"


./show_mysql_query_rules.sh

./show_stats_mysql_query_digest.sh
