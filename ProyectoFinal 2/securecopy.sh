#!/bin/bash

cd /home/pi/Proyectos/ProyectoFinal #ruta actual

#nombre para la llave simetrica y el archivo encriptado
newname=$(date +%Y_%m_%d_%H_%M_%S)"_"

#genera llave simetrica
openssl rand -base64 32|cut -c 1-31 > aesKey.txt

#Encripta archivo .wav con aeskey
openssl enc -aes-256-cbc -salt -in salida.wav -out "${newname}".wav.enc -pass file:./aesKey.txt 
#Encripta segun llave publica del receptor, encrypta aeskey con public pem recibida del receptor
openssl rsautl -encrypt -inkey public.pem -pubin -in ./aesKey.txt -out "${newname}"aesKey.txt.crypted 

#se cambia el nombre del archivo para que no se sobreescriba al hacer scp
#mv salida.wav.enc "${newname}".wav.enc 
#mv aesKey.txt.crypted "${newname}"aesKey.txt.crypted

echo "$(date)"_ENCRIPTO_securecopy >> /home/pi/prueba3.txt #verificacion de proceso

#Se envia el archivo de audio encriptado por SCP
scp /home/pi/Proyectos/ProyectoFinal/"${newname}".wav.enc christianrafaelmoraparga@192.168.1.109:/Users/christianrafaelmoraparga/Datos_Encriptados

#Se envia la llave simetrica encriptado por SCP
scp "${newname}"aesKey.txt.crypted christianrafaelmoraparga@192.168.1.109:/Users/christianrafaelmoraparga/Datos_Encriptados

#Eliminar los datos una vez enviados para que no se llene la memoria
rm "${newname}".wav.enc
rm "${newname}"aesKey.txt.crypted






#scp aesKey.txt.crypted christianrafaelmoraparga@192.168.1.109:/Users/christianrafaelmoraparga/Datos_Encriptados
#scp newname.wav.enc username@IP:/Users/
#scp aesKey.txt username@IP:/Users/

#scp "${newname}".wav.enc christianrafaelmoraparga@192.168.1.109:/Users/christianrafaelmoraparga/Datos_Encriptados

#tambien es funcional:
#rsync -a /home/pi/Proyectos/ProyectoFinal/"${newname}".wav.enc christianrafaelmoraparga@192.168.1.109:/Users/christianrafaelmoraparga/Datos_Encriptados
