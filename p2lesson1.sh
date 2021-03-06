#!/bin/bash
#

user="admin"
password=$(./get_login_info.sh ${user}|cut -d: -f2)

echo "Lesson 1: Caching the query"
echo "  o match  - digest"
echo "  o action - cache_ttl"
echo

LESSON="$0"

stmt="delete from mysql_query_rules where comment like '%lesson%'; LOAD MYSQL QUERY RULES TO RUNTIME"
mysql -vvv -u ${user} -p${password} -h 127.0.0.1  -P6032  -e "${stmt}"

stmt="INSERT INTO mysql_query_rules (active, digest, cache_ttl, comment) VALUES (1, '0x6190CA8304E06189', 5000, \"${LESSON}\"); LOAD MYSQL QUERY RULES TO RUNTIME"
mysql -vvv -u ${user} -p${password} -h 127.0.0.1  -P6032  -e "${stmt}"
echo
echo

./show_mysql_query_rules.sh

./show_stats_mysql_query_digest.sh
