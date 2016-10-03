#!/bin/bash
#

user="admin"
password=$(./get_login_info.sh ${user}|cut -d: -f2)

echo "Lesson 1: Block Query"
echo "  o match  - client_addr"
echo "  o action - error_msg"
echo

LESSON="$0"

stmt="delete from mysql_query_rules where comment like '%lesson%'; LOAD MYSQL QUERY RULES TO RUNTIME"
mysql -vvv -u ${user} -p${password} -h 127.0.0.1  -P6032  -e "${stmt}"

stmt="INSERT INTO mysql_query_rules (active, username, client_addr, error_msg, comment) VALUES (1, 'plam_rewrite', '127.0.0.1', 'Your ip has been blocked', \"${LESSON}\"); LOAD MYSQL QUERY RULES TO RUNTI
ME"
mysql -vvv -u ${user} -p${password} -h 127.0.0.1  -P6032  -e "${stmt}"
echo
echo

./show_mysql_query_rules.sh

./show_stats_mysql_query_digest.sh
