from MySQLdb import connect
from csv import reader
DB_NAME = 'anatomia1'
DB_USER = 'root'
DB_PASSWORD = 'root'
DB_HOST = 'db'
csv='aumentos'
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
with open(CSV_FILE_PATH, 'r', newline='', encoding='utf-8') as f:
    reader = reader(f)
    # Skips the first row if it contains column headers
    next(reader)
    for row in reader:
        # insert each line of csv file, in this example, product
        cur.execute("INSERT INTO api_aumento (zoom) VALUES (%s)", (row,))
# Confirms the transaction and closes the connection
conn.commit()
cur.close()
conn.close()
print("Los datos se han importado correctamente desde el archivo CSV.")