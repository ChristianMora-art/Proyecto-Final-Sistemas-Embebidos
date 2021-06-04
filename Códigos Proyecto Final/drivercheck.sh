#!/bin/bash

sleep 30 #Retardo para dar tiempo a la Raspberry de reconocer el dispositivo
echo "$(date)"_DRIVERCHECK >> /home/pi/prueba2.txt
while true; do
	ban=$(cat /proc/asound/cards | grep Scarlett) #Revisa si la Raspberry reconoce el dispositivo
	if [ -z "$ban" ]; then #Verifica que el resultado de la busqueda sea vacio
		sudo reboot # Se reinicia el dispositivo si no reconoce la tarjeta de sonido
	else
        echo "$(date)"_DRIVERCHECK2 >> /home/pi/prueba2.txt
		sleep 30 #Espera 30 segs para realizar el checkeo nuevamente
	fi
done