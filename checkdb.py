"""
    this program will generate a new terra.db file every time you call it
    Args:
        none
    Returns:
        output: sqlite database file
"""

# for file handling
import os
from typing import Any, Dict
import sqlite3
import pandas as pd


CONNECTION_OBJECT: str = "terra2023.db"
SQL_FILE: str = "terra2023.sql"


def run_query(q) -> pd.DataFrame:
    """
    # function to return a pandas dataframe from a query
    """
    try:
        with sqlite3.connect(CONNECTION_OBJECT) as conn:
            # cur = conn.cursor()   #Obtain a cursor object
            qr: pd.DataFram = pd.read_sql_query(q, conn)
    except sqlite3.Error as ex:
        print(ex)
    return qr


def run_command(c) -> None:
    """
    # function to run sqlite command
    """
    try:
        with sqlite3.connect(CONNECTION_OBJECT) as conn:
            # tells sqlite to autocommit any changes
            conn.isolation_level = None
            conn.execute(c)
    except sqlite3.Error as ex:
        print(ex)


# clear previous run
try:
    os.remove(CONNECTION_OBJECT)
except os.error as ex_remove:
    print(ex_remove)

# Read the contents of your .sql file
with open(SQL_FILE, "r", encoding="UTF-8") as input_file:
    sql_script: str = input_file.read()

# Connect to your SQLite database
db = sqlite3.connect(CONNECTION_OBJECT)
cursor = db.cursor()

# Execute the SQL script
cursor.executescript(sql_script)

# Commit changes and close the connection
db.commit()
db.close()
