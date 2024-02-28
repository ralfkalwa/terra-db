"""
    this program will test the new generated terra DB file every time you call it
    Args:
        none
    Returns:
        output: sqlite database file
"""

import os
import sqlite3
import pandas as pd

CONNECTION_OBJECT: str = "terra2023.db"
SQL_FILE: str = "terra2023.sql"


def run_query(q) -> pd.DataFrame:
    """
    function to return a pandas dataframe from a query
    """
    try:
        with sqlite3.connect(CONNECTION_OBJECT) as conn:
            # cur = conn.cursor()   #Obtain a cursor object
            qr: pd.DataFrame = pd.read_sql_query(q, conn)
    except sqlite3.Error as ex:
        print(ex)
    return qr


def run_command(c) -> None:
    """
    function to run sqlite command
    """
    try:
        with sqlite3.connect(CONNECTION_OBJECT) as conn:
            # tells sqlite to autocommit any changes
            conn.isolation_level = None
            conn.execute(c)
    except sqlite3.Error as ex:
        print(ex)


def execute_many_selects(cursor, queries: list) -> list:
    """
    Execute multiple SELECT queries and return the results as a list.
    :param cursor: SQLite cursor
    :param queries: List of SELECT queries
    :return: List of result sets
    """
    return [cursor.execute(query).fetchall() for query in queries]


# clear previous run
try:
    os.open(CONNECTION_OBJECT, os.O_RDONLY)
except os.open as ex_open:
    print(ex_open)

# Read the contents of your .sql file
queries: list = [
    'SELECT * FROM STADT WHERE EINWOHNER > 1000000 AND L_ID = "D";',
    'SELECT * FROM INSEL WHERE I_NAME LIKE "%ka%";',
    'SELECT * FROM BERG WHERE HOEHE > 3000;',
    'SELECT DISTINCT L_ID FROM LAND ORDER BY L_ID;',
    'SELECT * FROM WUESTE WHERE substr(W_NAME,1,1) = "E";',
    'SELECT * FROM STADT WHERE EINWOHNER >= 4008000;',
    'SELECT * FROM FLUSS WHERE substr(FLUSS, 1, 1) = "Z" AND LAENGE = 1030;',
    'SELECT * FROM STADT WHERE L_ID="D" ORDER BY L_ID;',
    'SELECT COUNT(L_ID) FROM STADT;',
    'SELECT COUNT(EINWOHNER) FROM STADT WHERE EINWOHNER >= 1000000;',
    'SELECT COUNT(L_ID) FROM STADT WHERE L_ID = "USA" AND EINWOHNER <= 1000000;',
    'SELECT * FROM STADT WHERE ST_NAME LIKE "Aa%" AND LT_ID = "NRW";']

# Connect to your SQLite database
db = sqlite3.connect(CONNECTION_OBJECT)
cursor = db.cursor()

# Execute the queries
results = execute_many_selects(cursor, queries)

# Process the results (e.g., print or use them as needed)
for result_set in results:
    print(result_set)

# close the connection
db.close()
