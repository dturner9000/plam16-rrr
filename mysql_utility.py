import MySQLdb as mdb

def get_login_info():
    # this needs to be changed for when it hits 
    # proxy client directly within the container
    return {
           'user' : 'dba',
           'password' : 'op3n',
           'host': '127.0.0.1',
           'port': 6033,
           }
    # root logins when I need it
#     return {
#            'user' : 'root',
#            'password' : 'unset',
#            'host': 'localhost',
#            'port': 3306,
#            }

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


