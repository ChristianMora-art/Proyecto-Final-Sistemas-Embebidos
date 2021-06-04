#!/bin/bash
#bash /home/pi/Proyectos/ProyectoFinal/drivercheck.sh & #Inicia script de checkeo en segundo plano
#jackd -d dummy &

sudo python3 /home/pi/Proyectos/ProyectoFinal/audio_process3.py # Inicia Script de adquisición de audio

echo "$(date)"_abri >> /home/pi/prueba.txt #revisa que se ejecuto systemd
