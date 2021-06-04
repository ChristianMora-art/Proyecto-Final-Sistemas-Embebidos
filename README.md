# Proyecto-Final-Sistemas-Embebidos
Este documento es la guía para la configuración inicial de la Raspberry Pi para el uso del sistema de adquisición de multicanal
Este proyecto fue realizado por Alejandro Medina y Christian Mora para la materia de Sistemas Embebidos 2021-I de la Maestría en Ingeniería Electrónica e IoT de la Pontificia Universidad Javeriana.  

--------------------------------------------------------------
Recursos e instrucciones necesarias para la ejecución correcta. 
--------------------------------------------------------------
El flujo y esquema del proyecto son los siguiente:
![alt text](https://github.com/ChristianMora-art/Proyecto-Final-Sistemas-Embebidos/blob/main/Im%C3%A1genes/ProyectoFinal.png)

![alt text](https://github.com/ChristianMora-art/Proyecto-Final-Sistemas-Embebidos/blob/main/Im%C3%A1genes/Flowchart.png)

Para el desarrollo del proyecto se utilizó una Raspberry Pi 4 Modelo B (TX), una interfaz de audio Focusrite Scarlett 2i4 (2 canales de entrada, Línea u XLR) y un Macintosh iMac (27-inch, Late 2013) macOS High Sierra. 

![alt text](https://github.com/ChristianMora-art/Proyecto-Final-Sistemas-Embebidos/blob/main/Im%C3%A1genes/Raspberry_Pi_4_Model_B.jpg)
![alt text](https://github.com/ChristianMora-art/Proyecto-Final-Sistemas-Embebidos/blob/main/Im%C3%A1genes/Scarlett2i4.jpeg)

* La conexiones analógicas En las siguientes imágenes se aprecia la conexión necesaria:

![alt text](https://github.com/ChristianMora-art/Proyecto-Final-Sistemas-Embebidos/blob/main/Im%C3%A1genes/con1.jpg)
![alt text](https://github.com/ChristianMora-art/Proyecto-Final-Sistemas-Embebidos/blob/main/Im%C3%A1genes/con2.jpg)
--------------------------------------------------------------
En el presente se encuentran los siguientes scripts (presentados en orden):
En la RPi:
- Launcher.sh & drivercheck.sh
- audio_process3.py
- securecopy.sh

En el dispositivo receptor:
- Decryption.sh
--------------------------------------------------------------
Para copia segura a dispositivo de destino
--------------------------------------------------------------
1. Crear llaves private.pem y public.pem en dispositivo de destino
2. Copiar llave public.pem a la Raspberry /home/pi/Proyectos/ProyectoFinal/
En el archivo "crearLLaves.sh" están los comandos necesarios para crear el par de llaves asimétricas que deben generarse por el dispositivo receptor, una vez creadas este par de llaves, se debe enviar la llave pública a la RPi para que esta pueda encriptar la llave simétrica que debe ser creada en la RPi (cuyo comando de generación también se encuentra en este archivo).

--------------------------------------------------------------
* Instrucciones en la RPi 
--------------------------------------------------------------
1. Crear una ruta /home/pi/Proyectos/ProyectoFinal/
2. Copiar todos los archivos de códigos a esta ruta.
3. Crear la llave simétrica aesKey.txt con el código hallado en "crearLLaves.sh".
4. Copiar los servicios audio.service y drivercheck.service a la ruta /etc/systemd/system/
sudo systemctl start audio.service
sudo systemctl start drivercheck.service
5. Permitir que se suban los servicios, para cuando la máquina se inicie o reinicie 
sudo systemctl enable audio.service
sudo systemctl enable drivercheck.service
6. Crear autorización entre la RPi y el dispositivo de destino:
* Si es un dispositivo UNIX basta con ejecutar estos comandos:
ssh-keygen
ssh-copy-id username@IP
* Si es un dispositivo Windows (en este ejemplo se envía la llave pública del dispositivo Windows a la RPi, debe ser al contrario):
ssh-keygen
luego, buscar la ruta de la llave pública generada y enviarla a la RPi al directorio /usr/bin/
hacer un scp C:\Users\USER/.ssh/id_rsa.pub pi@IP:/home/pi/.ssh/id_rsa.pub.backup
luego hacer desde la RPi: cat  /home/pi/.ssh/id_rsa.pub.backup >> /home/pi/.ssh/autorized_keys

--------------------------------------------------------------
* Para correr el proceso de Python3
1. Instalar la librería de python3 numpy y sounddevice
pip install numpy
python3 -m pip install sounddevice --user
2. Instalar la librería de python3 scipy
pip3 install scipy
--------------------------------------------------------------


--------------------------------------------------------------
