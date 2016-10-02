import ConfigParser
import MySQLdb as mdb
import os.path
import sys

def get_login_info():
    # this needs to be changed for when it hits 
    # proxy client directly within the container
    filename = "/var/tmp/my.cnf"

    if not os.path.exists(filename):
        sys.exit("Error: {0} not found.".format(filename))

    Config = ConfigParser.ConfigParser()
    Config.read(filename)

    return {
           'user' : Config.get("client", "user"),
           'password' : Config.get("client", "password"),
           'host': '127.0.0.1',
           'port': 6033,
           }

def connect():
    login_info = get_login_info()

    if login_info['password'] == "unset":
        return mdb.connect(host=login_info['host'],
                           port=login_info['port'],
                           user=login_info['user'],
                          )

    return mdb.connect(host=login_info['host'],
                       port=login_info['port'],
                       user=login_info['user'],
                       passwd=login_info['password'],
                      )

def run_sql(stmt, output="stdout"):
    """
    Run any sql passed via stmt
    stmt = the sql stmt to run
    output = valid options are return, stdout, and None
    """
    conn = connect()

    cur = conn.cursor(mdb.cursors.DictCursor)
    cur.execute(stmt)
    rows = cur.fetchall()

    if output == "stdout":
        for row in rows:
            print row
    elif output == "return":
        return rows


