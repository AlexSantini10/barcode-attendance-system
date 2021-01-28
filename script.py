from gpiozero import LED
import mysql.connector
from time import sleep
import asyncio

def replaceString(lettura):
    lettura = lettura.replace("'", "")
    lettura = lettura.replace("%", "")
    lettura = lettura.replace("|", "")
    lettura = lettura.replace("/", "")
    lettura = lettura.replace("\\", "")

    return lettura

async def onOffLed(led):
    print('led acceso')
    led.on()
    await asyncio.sleep(1)
    print('led spento')
    led.off()
            
try:
    led = LED(14)

    mydb = mysql.connector.connect(
            host = "localhost",
            user = "5ATL",
            passwd = "sistemi",
            database = "barcode"
        )  

    mycursor = mydb.cursor()

    while True:
        lettura = input()

        lettura = replaceString(lettura)

        query = f"SELECT ID, code FROM data WHERE code={lettura}"
        mycursor.execute(query)
        elements = mycursor.fetchall()

        if (len(elements)==0):
            print('codice non presente')
        else:
            print('codice presente')

            asyncio.run(onOffLed(led))
except:
    led.off()
    exit()