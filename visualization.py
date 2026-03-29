import psycopg2
import pandas as pd
import matplotlib.pyplot as plt

# Docker connection
conn = psycopg2.connect(
    host="localhost",
    database="customer_db",
    user="admin",
    password="admin"
)

query = "SELECT * FROM analytics_layer.customer_summary;"
df = pd.read_sql(query, conn)

print(df)

# First diagram
plt.figure("Average Spending per Region")
plt.bar(df['region'], df['avg_spent'])
plt.title("Average Spending per Region")
plt.xlabel("Region")
plt.ylabel("Avg Spending")
plt.show()

# Second diagram
plt.figure("Total Customers per Region")
plt.bar(df['region'], df['total_customers'])
plt.title("Total Customers per Region")
plt.xlabel("Region")
plt.ylabel("Number of Customers")
plt.show()

conn.close()