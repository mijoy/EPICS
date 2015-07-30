#!../../bin/linux-x86_64/snmp

## You may have to change snmp to something else
## everywhere it appears in this file

< envPaths

cd "${TOP}"
epicsEnvSet("MIBDIRS", "+${TOP}/mibs")

## Register all support components
dbLoadDatabase "dbd/snmp.dbd"
snmp_registerRecordDeviceDriver pdbbase

## Load record instances
#dbLoadRecords("db/xxx.db","user=mijoy0909Host")
dbLoadRecords("db/apc_pdu.db", "A=APC, P=PDU2, HOST=10.1.5.123, COM=public, USER=mijoy, V2C=SNMP_VERSION_2c, V3=SNMP_VERSION_3, PO=PowerNet-MIB::, AUTH_P=qwertyuiop12345, PRIV_P=qwertyuiop12345")

cd "${TOP}/iocBoot/${IOC}"
iocInit

## Start any sequence programs
#seq sncxxx,"user=mijoy0909Host"
