#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon May 24 16:05:59 2021

@author: christianrafaelmoraparga
"""
#https://realpython.com/playing-and-recording-sound-python/#:~:text=record%20audio%20yourself.-,Recording%20Audio,scipy%20and%20wave%20libraries%2C%20respectively.


import sounddevice as sd
from scipy.io.wavfile import write
import subprocess, time, requests

fs = 44100  # Sample rate
seconds = 3  # Duration of recording

def internet_conect():
    bandera = 1
    while bandera:
        try:
            request = requests.get("https://www.google.com", timeout=5)
        except (requests.ConnectionError, requests.Timeout):
            print("Sin conexion a internet.")
            bandera=1
        else:
            print("con conexion")
            bandera=0
            
while True:
    internet_conect()
    signal = sd.rec(int(seconds * fs), samplerate=fs, channels=2)
    print('grabando')
    sd.wait()# Wait until recording is finished
    print('terminó')
    write('salida.wav', fs, signal)  # Save as WAV file
    subprocess.Popen('sudo -u pi /home/pi/Proyectos/ProyectoFinal/securecopy.sh', shell=True, stdout=subprocess.PIPE)
    #subprocess.call("/home/pi/Proyectos/ProyectoFinal/securecopy.sh")
    time.sleep(20)


    

'''
import matplotlib.pyplot as plt
import numpy as np

Time = np.linspace(0, len(signal) / fs, num=len(signal))

plt.figure(1)

fig, axs = plt.subplots(2); plt.title("Signal Wave...")
fig.suptitle('Vertically stacked subplots')
axs[0].plot(Time, signal[:,0])
axs[1].plot(Time, signal[:,1])
plt.show()
'''
