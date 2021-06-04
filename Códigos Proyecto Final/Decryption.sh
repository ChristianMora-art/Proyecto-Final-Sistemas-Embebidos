#!/bin/bash
#Este archivo debe estar en el directorio donde se reciban los datos de salida de la RPi (dispositivo Receptor), este se llama "bash /directorio_de_recepcion/Decryption.sh"	
for f in *.enc
do [ -f $f ] 
	filename=$f
	fileaeskey=$(basename $filename .wav.enc)
	openssl rsautl -decrypt -inkey private.pem -in "${fileaeskey}"aesKey.txt.crypted -out "${fileaeskey}"aesKey.txt
	openssl enc -d -aes-256-cbc -in $f -out "${fileaeskey}"salida.wav -pass file:./"${fileaeskey}"aesKey.txt
	rm $f
	rm "${fileaeskey}"aesKey.txt
	rm "${fileaeskey}"aesKey.txt.crypted
done