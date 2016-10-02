#!/bin/bash

mysql --defaults-file=/root/.my.cnf.admin -h 127.0.0.1 -P6032 -e 'select hostgroup_id, hostname, port, status  from mysql_servers'
