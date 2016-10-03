#!/bin/bash
# todo: Query rules may need some unique constraint otherwise we can keep inserting the same rule when we might not want to.

# todo: figure out why this query blocks p2.py as well.

user="admin"
password=$(./get_login_info.sh ${user}|cut -d: -f2)


echo "Lesson 1: Blocking the query and returning an error."
echo "  o match  - digest"
echo "  o action - error_msg"
echo

LESSON="$0"

stmt="delete from mysql_query_rules where comment like '%lesson%'; LOAD MYSQL QUERY RULES TO RUNTIME"
mysql -vvv -u ${user} -p${password} -h 127.0.0.1  -P6032  -e "${stmt}"

stmt="INSERT INTO mysql_query_rules (active, digest, error_msg, comment) VALUES (1, '0x65496B34FF40E16A', 'This query has been blocked', \"${LESSON}\"); LOAD MYSQL QUERY RULES TO RUNTIME"
mysql -vvv -u ${user} -p${password} -h 127.0.0.1  -P6032  -e "${stmt}"
echo
echo

./show_mysql_query_rules.sh

./show_stats_mysql_query_digest.sh
