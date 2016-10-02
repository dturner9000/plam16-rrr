#!/usr/bin/env python

import time

from mysql_utility import run_sql
from random import randint

if __name__ == "__main__":


      stmt = """
             SELECT
                 max(rental_id) max_id,
                 min(rental_id) min_id
             FROM sakila.rental
             """
      rows = run_sql(stmt, output="return")[0]

      while True:       
          start_page = randint(rows['min_id'], rows['max_id'])

          stmt = """
                 SELECT /* pagiwhat? */ rental_id, customer_id
                 FROM sakila.rental
                 ORDER BY rental_id
                 LIMIT {0},10
                 ;  
                 """.format(start_page)

          print stmt
        
          run_sql(stmt, output=None)

#           run_sql("SELECT sleep(5)", output=None)
          time.sleep(.1)

    
