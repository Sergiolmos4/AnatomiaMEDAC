from MySQLdb import connect
from csv import reader
DB_NAME = 'anatomia1'
DB_USER = 'root'
DB_PASSWORD = 'root'
DB_HOST = 'db'
csv='BiopsiasCsv'
CSV_FILE = f'{csv}.csv'
CSV_FILE_PATH=f'/code/assets/{CSV_FILE}'
conn = connect(
    db=DB_NAME,
    user=DB_USER,
    passwd=DB_PASSWORD,
    host=DB_HOST
)
cur = conn.cursor()
# if not exists the Table TABLE_NAME
# Opens the CSV file and loads the data into the database table
# cur.execute("CREATE TABLE api_interpretacion (id SERIAL PRIMARY KEY, tipo VARCHAR(30), codigo VARCHAR(7) UNIQUE, descripcion TEXT)")
cur.execute("ALTER TABLE api_interpretacion ADD COLUMN tipo VARCHAR (50)")
conn.commit()
with open(CSV_FILE_PATH, 'r', newline='', encoding='utf-8') as f:
    reader = reader(f, delimiter=';')
    # Skips the first row if it contains column headers
    next(reader)
    for row in reader:
        # insert each line of csv file, in this example, product
        cur.execute("INSERT INTO api_interpretacion (tipo,codigo,descripcion) VALUES (%s,%s,%s)",(row[2],row[3],row[4]))
        # Confirms the transaction and closes the connection
conn.commit()
cur.execute("DELETE FROM api_interpretacion WHERE tipo='Calidad'")
conn.commit()
cur.execute("ALTER TABLE api_interpretacion DROP COLUMN tipo")
conn.commit()
cur.close()
conn.close()
print("Los datos se han importado correctamente desde el archivo CSV.")
