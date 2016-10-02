#!/usr/bin/env python

import time

from mysql_utility import run_sql


if __name__ == "__main__":

    stmt = """
           SELECT /* Don't wake me up I'm sleeping beauty*/ sleep(5)
           """
    while True:       
        run_sql(stmt)
        time.sleep(1)

    
