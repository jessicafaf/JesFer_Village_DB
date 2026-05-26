"""
village_query.py — Python connector for JesFer Village DB
"""
import mysql.connector
import pandas as pd

conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="your_password",
    database="jesfer_village"
)

def get_energy_balance():
    df = pd.read_sql("SELECT * FROM v_daily_energy", conn)
    print("\n── Energy Balance ──")
    print(df.to_string(index=False))
    return df

def get_water_efficiency():
    df = pd.read_sql("SELECT * FROM v_water_efficiency", conn)
    print("\n── Water Efficiency ──")
    print(df.to_string(index=False))
    return df

if __name__ == "__main__":
    get_energy_balance()
    get_water_efficiency()