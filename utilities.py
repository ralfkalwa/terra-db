"""
    utility functions for SQL queries and DB management commands
    Args:
        sql commands
    Returns:
        output: sqlite database file
"""

import os
import sqlite3
import pandas as pd

def run_query(q) -> pd.DataFrame:
    """
    function to return a pandas dataframe from a query
    """
    try:
        with sqlite3.connect(connection_object) as conn:
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
        with sqlite3.connect(connection_object) as conn:
            # tells sqlite to autocommit any changes
            conn.isolation_level = None
            conn.execute(c)
    except sqlite3.Error as ex:
        print(ex)

if __name__ == "__main__":
    def main()-> None:
        print("This is a utility file for SQL commands and DB management")

main()

