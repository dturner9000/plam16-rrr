#!/usr/bin/env python

import time

from mysql_utility import run_sql


if __name__ == "__main__":

    stmt = """
           SELECT /* I'm sleeping */ sleep(5)
           """
    while True:
        run_sql(stmt, output=None)
        time.sleep(1)

