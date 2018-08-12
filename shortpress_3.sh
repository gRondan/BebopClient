#!/bin/sh
#Set the SSID, Password and IP
SSID='wifing'	# Change this to your SSID
PW='wifing-pub' 		# Change this to the password of your wifi network
IP=172.16.138.130 	# Change this to the desired Bebop IP	

#Connect to defined Network
BLDC_Test_Bench -M 2 >/dev/null
sleep 1 &&
mount -o remount,rw / &&
sleep 1 &&
wpa_passphrase $SSID $PW > /etc/wpa_supplicant.conf && 
sleep 1 && 
ifconfig eth0 $IP && 
sleep 1 &&
mount -o remount,rw / &&
sleep 1 &&
wpa_passphrase $SSID $PW > /etc/wpa_supplicant.conf && 
sleep 1 && 
ifconfig eth0 $IP &&
sleep 1 &&
wpa_supplicant -B -D wext -i eth0 -c /etc/wpa_supplicant.conf &&
sleep 1 &&
BLDC_Test_Bench -M 2 >/dev/null
sleep 1 &&
BLDC_Test_Bench -M 2 >/dev/null
#wait 5 &&
#/sbin/udhcpc -i eth0 
