#!/bin/bash

if [ -z "$1" ]
  then
    echo "No channel supplied"
    exit 1
fi

# Default to channel 1
CHANNEL=0x0$1

echo "Changing channels to $(($1+1))"

# Vendor and product ids for MX Mechanical and MX Master 3
LOGI_VID=046D
KYB_PID=B366
MSE_PID=B034

# Switch MX Mechanical to Channel 1
#
sudo hidapitester --vidpid ${LOGI_VID}:${KYB_PID} --usage 0x0202 --usagePage 0xff43 --open --length 20 --send-output 0x11,0x00,0x09,0x1E,${CHANNEL},0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00

# Switch MX Master 3 to Channel 1
#                                                                                                                 A       B       C   D       E      F    G
sudo hidapitester --vidpid ${LOGI_VID}:${MSE_PID} --usage 0x0202 --usagePage 0xFF43 --open --length 20 --send-output 0x11,0xFF,0x0a,0x1b,${CHANNEL},0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
exit 0



