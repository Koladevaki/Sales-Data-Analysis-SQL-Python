import mysql.connector
import pandas as pd
import matplotlib.pyplot as plt

# Connect to MySQL
connection = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Devaki@30",
    database="sales_project"
)

print("MySQL Connected Successfully!")

# Fetch sales data
query = "SELECT * FROM sales"

df = pd.read_sql_query(query, connection)

# Display data
print(df)

# Calculate revenue
df["revenue"] = df["quantity"] * df["unit_price"]

# Total revenue
print("Total Revenue:", df["revenue"].sum())

# Total quantity
print("Total Quantity:", df["quantity"].sum())

# City-wise revenue
city_sales = df.groupby("city")["revenue"].sum()

print("\nCity-wise Revenue:")
print(city_sales)

# Product-wise sales
product_sales = df.groupby("product")["quantity"].sum()

print("\nProduct-wise Sales:")
print(product_sales)

# Monthly revenue
df["order_date"] = pd.to_datetime(df["order_date"])

monthly_sales = df.groupby(
    df["order_date"].dt.month
)["revenue"].sum()

print("\nMonthly Revenue:")
print(monthly_sales)

# Bar chart
city_sales.plot(kind="bar", title="City-wise Sales")

plt.xlabel("City")
plt.ylabel("Revenue")
plt.tight_layout()
plt.show()

# Close connection
connection.close()