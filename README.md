# Proyecto-Final-Sistemas-Embebidos
Este documento es la guía para la configuración inicial de la Raspberry Pi para el uso del sistema de adquisición de multicanal
Este proyecto fue realizado por Alejandro Medina y Christian Mora para la materia de Sistemas Embebidos 2021-I de la Maestría en Ingeniería Electrónica e IoT de la Pontificia Universidad Javeriana.  

--------------------------------------------------------------
Organizar directorios para la ejecución correcta. 
--------------------------------------------------------------
1. Crear una ruta /home/pi/Proyectos/ProyectoFinal/
2. Copiar todos los archivos de códigos a esta ruta.
3. Copiar los servicios audio.service y drivercheck.service a la ruta /etc/systemd/system/
sudo systemctl start audio.service
sudo systemctl start drivercheck.service
4. Permitir que se suban los servicios, para cuando la máquina se inicie o reinicie 
sudo systemctl enable audio.service
sudo systemctl enable drivercheck.service
6. Crear autorización entre la RPi y el dispositivo de destino

* Para correr el proceso de Python3

1. Instalar la libreria de python sounddevice
2. Instalar la libreria de python scipy
--------------------------------------------------------------
--------------------------------------------------------------
Para copia segura a dispositivo de destino
--------------------------------------------------------------
1. Crear llaves private.pem y public.pem en dispositivo de destino
2. Copiar llave public.pem a la Raspberry /home/pi/Proyectos/ProyectoFinal/
--------------------------------------------------------------
--------------------------------------------------------------
