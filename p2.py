#!/usr/bin/env python

from mysql_utility import run_sql


if __name__ == "__main__":

    stmt = """
           SELECT /* Look mom no hands */ count(*)
           FROM sakila.payment;  
           """
    while True:       
        run_sql(stmt)

    
