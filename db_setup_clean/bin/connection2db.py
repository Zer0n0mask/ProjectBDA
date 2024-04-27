import mysql.connector

def connection_mysql(   script,
                        database = None,
                        keep_open = False, 
                        user = "root", 
                        password = "1234",
                        host = "localhost"):

    if database is None:
        conn = mysql.connector.connect(
            host=host,
            user=user,
            password=password
        )    
    else:
        conn = mysql.connector.connect(
            host=host,
            user=user,
            password=password, 
            database = database    
        )

    cursorObj = conn.cursor()
    
    cursorObj.execute(script)

    fetched_results = cursorObj.fetchall()
    
    cursorObj.close()

    conn.commit()


    if keep_open:
        return conn, cursorObj, fetched_results
    else:        
        conn.close()
        return fetched_results



import os
import subprocess

def run_sql_script( filepath, 
                    database = None, 
                    visible_output = False, 
                    user = "root", 
                    password = "1234",
                    host = "localhost"):
    print("scritp ran: ",filepath)
    if database is None:
        command = rf'mysql -h{host} -u{user} -p{password} < "{filepath}"'
    else:
        command = rf'mysql -h{host} -u{user} -p{password} -D {database} < "{filepath}"'
    
    try:
        output = subprocess.check_output(command, shell=True)
        if visible_output:
            print("Output:", output.decode('utf-8'))  # Assuming output is in UTF-8 encoding
    except subprocess.CalledProcessError as e:
        print("Error:", e)

    

def abspath(relative_path):
    relative_path.replace("\\", "\\\\")
    current_directory = os.getcwd()
    absolute_path = os.path.join(current_directory, relative_path)
    return absolute_path