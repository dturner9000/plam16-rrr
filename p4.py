#!/usr/bin/env python

import time

from mysql_utility import (
       get_login_info,
       connect,
       )
from random import randint

if __name__ == "__main__":


    connect_list = []
    for i in range(0,1000):
      print i
      connect_list.append(connect())

    time.sleep(86400)
