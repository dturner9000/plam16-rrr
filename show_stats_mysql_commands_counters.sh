#!/bin/bash

mysql --defaults-file=/root/.my.cnf.admin -h 127.0.0.1 -P6032 -e 'select * from stats_mysql_commands_counters where Total_Time_us > 0'

