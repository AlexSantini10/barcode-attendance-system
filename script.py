import mysql.connector
from time import sleep
import asyncio
import traceback

iAmOnRaspberry = False    # Debug

if iAmOnRaspberry:
    from gpiozero import LED

def replaceString(lettura):
    lettura = lettura.replace("'", "")
    lettura = lettura.replace("%", "")
    lettura = lettura.replace("|", "")
    lettura = lettura.replace("/", "")
    lettura = lettura.replace("\\", "")

    return lettura

async def onOffLed(led):
    if iAmOnRaspberry:
        print('led acceso')
        led.on()
        await asyncio.sleep(1)
        print('led spento')
        led.off()
            
try:
    if iAmOnRaspberry:
        led = LED(14)

    mydb = mysql.connector.connect(
            host = "localhost",
            user = "root",
            passwd = "",
            database = "witchers"
        ) 

    mycursor = mydb.cursor()

    while True:
        lettura = input()

        lettura = replaceString(lettura)

        query = f"SELECT ID, codice FROM anagrafica WHERE codice={lettura}"
        mycursor.execute(query)
        elements = mycursor.fetchall()

        mycursor.execute(f"UPDATE toupdate SET isToUpdate='1'")
        mydb.commit()

        if (len(elements)==0):
            print('codice non presente')
        else:
            # 0 ID, 1 codice, 2 nome, 3 cognome, 4 email, 5 abitazione, 6 insegnante, 7 entrato
            query = f"SELECT * FROM anagrafica WHERE codice={lettura}"
            mycursor.execute(query)
            elements = mycursor.fetchall()
            elements = elements[0]

            if elements[7] == 1:
                mycursor.execute(f"INSERT INTO log (userID, entrataUscita) VALUES ('{elements[0]}', '{0}')")
                mydb.commit()

                mycursor.execute(f"UPDATE anagrafica SET entrato='0'")
                mydb.commit()
            else:
                mycursor.execute(f"INSERT INTO log (userID, entrataUscita) VALUES ('{elements[0]}', '{1}')")
                mydb.commit()
                mycursor.execute(f"UPDATE anagrafica SET entrato='1'")
                mydb.commit()

            if iAmOnRaspberry:
                asyncio.run(onOffLed(led))
except:
    print(traceback.print_exc())
    if iAmOnRaspberry:
        led.off()
    exit()