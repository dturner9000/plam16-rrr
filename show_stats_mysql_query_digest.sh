#!/bin/bash

mysql --defaults-file=/root/.my.cnf.admin -h 127.0.0.1 -P6032 -e 'select * from stats_mysql_query_digest order by sum_time desc'

