#!/bin/bash

#genera llave asimetrica privada
openssl genrsa -out private.pem 2048
#genera llave asimetrica publica
openssl rsa -in private.pem -out public.pem -outform PEM -pubout

#genera llave simetrica
openssl rand -base64 32|cut -c 1-31 > aesKey.txt
