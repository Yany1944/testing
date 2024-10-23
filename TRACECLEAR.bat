@echo off
title Serial Checker
mode con: cols=120 lines=120

echo [92mDisk
echo [92m------------[91m
wmic diskdrive get serialnumber
echo [92mMotherboard
echo [92m------------[91m
wmic baseboard get serialnumber,product,Manufacturer,version
echo [92mGPU
echo [92m------------[91m
wmic PATH Win32_VideoController GET Description,PNPDeviceID
nvidia-smi -L
echo [92mRAM
echo [92m------------[91m
wmic memorychip get devicelocatior,serialnumber
echo [92mBios
echo [92m------------[91m
wmic csproduct get uuid
wmic path win32_computersystemproduct get uuid
wmic bios get serialnumber
echo [92mCPU
echo [92m------------[91m
wmic cpu get processorid
@echo off 
wmic cpu get serialnumber
echo [92mChassis
echo [92m------------[91m
@echo off
wmic systemenclosure get serialnumber
echo [92mVOLUME
echo [92m------------[91m
@echo off 
vol
echo.
echo [92mWINDOWS PRODUCT ID
echo [92m------------[91m
@echo off 
wmic os get serialnumber
echo [92mMAC ADRESSES
echo [92m------------[91m
@echo off 
getmac
echo.
rem // echo [92mMacAddress
rem // echo [92m------------[91m
rem // wmic path Win32_NetworkAdapter where "PNPDeviceID like '%%PCI%%' AND NetConnectionStatus=2 AND AdapterTypeID='0'" get MacAddress

cmd /k

pause
