#!/bin/bash

# Count number of Android and iOS devices on the network
# Finds devices from their open ports

CARBON_HOST="graphite.jvoss14.com"
CARBON_PORT="2003"

ANDROID_MAC="8c:79:67:e4:0d:4f"
IOS_MAC="90:60:f1:15:ff:62"

NET0_DEVICES=$(arp-scan --interface=wlan0 192.168.0.0/24)
NET1_DEVICES=$(arp-scan --interface=eth0 192.168.1.0/24)

ANDROID_COUNT=$(echo $NET0_DEVICES $NET1_DEVICES | grep -i $ANDROID_MAC | wc -l)
IOS_COUNT=$(echo $NET0_DEVICES $NET1_DEVICES | grep -i $IOS_MAC | wc -l)

TIME=$(date +%s)

echo "devices.ios" ${IOS_COUNT} ${TIME} | nc ${CARBON_HOST} ${CARBON_PORT}
echo "devices.android" ${ANDROID_COUNT} ${TIME} | nc ${CARBON_HOST} ${CARBON_PORT}

echo "Successful Devices upload: Android active: ${ANDROID_COUNT}. iOS Active: ${IOS_COUNT}."
