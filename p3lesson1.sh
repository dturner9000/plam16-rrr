#!/bin/bash
#

user="admin"
password=$(./get_login_info.sh ${user}|cut -d: -f2)

echo "Lesson 1: Query Rewrite"
echo "  o match  - match_pattern"
echo "  o action - replace_pattern"
echo

LESSON="$0"

stmt="delete from mysql_query_rules where comment like '%lesson%'; LOAD MYSQL QUERY RULES TO RUNTIME"
mysql -vvv -u ${user} -p${password} -h 127.0.0.1  -P6032  -e "${stmt}"

stmt="INSERT INTO mysql_query_rules (active, match_pattern, replace_pattern, comment) VALUES (1, '.*pagiwhat.*', 'SELECT /* Query rewritten */ sleep(5)', \"${LESSON}\"); LOAD MYSQL QUERY RULES TO RUNTIME"
mysql -vvv -u ${user} -p${password} -h 127.0.0.1  -P6032  -e "${stmt}"
echo
echo

./show_mysql_query_rules.sh

./show_stats_mysql_query_digest.sh
