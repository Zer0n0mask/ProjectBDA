from bin.connection2db import connection_mysql as connect
from bin.connection2db import run_sql_script
from bin.connection2db import abspath

import os


host = "localhost"
user = "root"
password = "1234"

#Create relational database
absolute_path = abspath(r"relational\relational_setup.sql")
run_sql_script(absolute_path,host=host, user=user, password=password)

#Populate relational database
folder_path = abspath(r"relational\insert statements")
print("Relational population files:", folder_path)
files = os.listdir(folder_path)
for file in files:
    filepath = os.path.join(folder_path, file)
    run_sql_script(filepath, database="grad_db",host=host, user=user, password=password)

#Create dimensional database
absolute_path = abspath(r"dimensional\dimensional_setup.sql")
run_sql_script(absolute_path, host=host, user=user, password=password)

# Run ETL
folder_path = abspath(r"dimensional\etl")
print("Dimensional population files:", folder_path)
files = os.listdir(folder_path)
for file in files:
    filepath = os.path.join(folder_path, file)
    run_sql_script(filepath, database="grad_dimensional",host=host, user=user, password=password)
