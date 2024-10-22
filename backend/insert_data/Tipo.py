from MySQLdb import connect
DB_NAME = 'anatomia1'
DB_USER = 'root'
DB_PASSWORD = 'root'
DB_HOST = 'db'
conn = connect(
    db=DB_NAME,
    user=DB_USER,
    passwd=DB_PASSWORD,
    host=DB_HOST
)
cur = conn.cursor()
cur.execute("INSERT INTO api_tipo (tipo) VALUES ('Calidad')")
cur.execute("INSERT INTO api_tipo (tipo) VALUES ('Interpretación')")
# Confirms the transaction and closes the connection
conn.commit()
cur.close()
conn.close()
print("Los datos se han importado correctamente desde el archivo CSV.")