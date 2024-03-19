#!/bin/bash

# KYB_CH = channel on unifying receiver for the destination keyboard. Typically maps to the 1 minus the key # you press to switch keyboards
KYB_CH=0x00
# KYB_ID = ID of the keyboard (typically this maps to the order of keyboard devices you see in the unifying software app in Advanced settings)
KYB_ID=0x00

# MSE_CH = channel on unifying receiver for the destination mouse. Typically maps 1 minus the channel button you press on the mouse to switch
MSE_CH=0x00
# MSE_ID = ID of the mouse (typically this maps to the order of mouse devices you see in the unifying software app in Advanced settings)
MSE_ID=0x00

# These typically don't change, but tap Apple menu->About This Mac->System Report->USB->USB Receiver for Logitech
# and make sure Product ID (RCVR_PID) and Vendor ID (RCVR_VID) are accurate
LOGI_VID=046D
KBRD_PID=B366
MOUS_PID=B034

# Switch MX Mechanical to Channel 1
#
#./hidapitester --vidpid ${LOGI_VID}:${KBRD_PID} --usage 0x0001 --usagePage 0xFF00 --open --length 7 --send-output 0x10,${KYB_ID},0x09,0x1e,${KYB_CH},0x00,0x00A        B    C    D       E       F    G
./hidapitester --vidpid 046D:B366 --usage 0x0202 --usagePage 0xff43 --open --length 20 --send-output 0x11,0x00,0x09,0x1E,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00

# Switch MX Master 3 to Channel 1
#                                                                                                                 A       B       C   D       E      F    G
#hidapitester --vidpid ${RCVR_VID}:${RCVR_PID} --usage 0x0001 --usagePage 0xFF00 --open --length 7 --send-output 0x10,${MSE_ID},0x0a,0x1b,${MSE_CH},0x00,0x00
./hidapitester --vidpid 046D:B034 --usage 0x0202 --usagePage 0xFF43 --open --length 20 --send-output 0x11,0xFF,0x0a,0x1b,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
exit 0



