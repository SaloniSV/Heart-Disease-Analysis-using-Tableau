from csv import excel_tab
import pypyodbc as odbc
import pandas as pd

DRIVER_NAME = 'SQL SERVER'
SERVER_NAME = 'SIDRAM-LAPTOP\MSSQLSERVER01'
DATABASE_NAME = 'Heart_Failure_Prediction'


connection_string = f"""
   DRIVER={{{DRIVER_NAME}}};
   SERVER={SERVER_NAME};
   DATABASE={DATABASE_NAME};
   Trust_connection=yes;
 """

# Establish a connection
connection = odbc.connect(connection_string)

excel_file_path = ('D:\\Saloni\\SEIS 630-02 Database Management System and Design\\Final project\\heart.csv')
df = pd.read_csv('D:\Saloni\SEIS 630-02 Database Management System and Design\Final project\heart.csv')  # Assuming it's a CSV file, not an Excel file

table_name = 'HEART_FAILURE'
insert_query = f"INSERT INTO {table_name} (Age,Sex,ChestPainType,RestingBP,Cholesterol,FastingBS,RestingECG,MaxHR,ExerciseAngina,Oldpeak,ST_Slope,HeartDisease) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)"

cursor = connection.cursor()

for index, row in df.iterrows():
    values = tuple(row)
    cursor.execute(insert_query, values)

connection.commit()

connection.close()