#!../../bin/linux-x86_64/E3633A

#- You may have to change E3633A to something else
#- everywhere it appears in this file

< envPaths


epicsEnvSet(STREAM_PROTOCOL_PATH,"$(TOP)/DCApp/Db")
epicsEnvSet("PREFIX", "UWXRD:E3633A_1:")
epicsEnvSet("PORT", "serial1")


## Register all support components
dbLoadDatabase "$(TOP)/dbd/DC.dbd"
DC_registerRecordDeviceDriver(pdbbase)
drvAsynSerialPortConfigure("serial1","/dev/ttyUSB0",0,0,0)
asynOctetSetInputEos("serial1",0,"\n")
asynOctetSetOutputEos("serial1",0,"\n")
asynSetOption("serial1",0,"baud","1200")
asynSetOption("serial1",0,"bits","8")
asynSetOption("serial1",0,"stop","2")
asynSetOption("serial1",0,"parity","none")
asynSetOption("serial1",0,"clocal","N")
asynSetOption("serial1",0,"crtscts","N")
asynSetTraceIOMask("serial1",0,2)
asynSetTraceMask("serial1",0,9)

## Load record instances
#dbLoadRecords("db/xxx.db","user=uwchamber")
dbLoadRecords("$(TOP)/db/Agilent_E3633A.db","P=$(PREFIX),PORT=serial1")
#cd "/home/uwchamber/epics/DC/iocBoot/iocDC"
iocInit

## Start any sequence programs
#seq sncxxx,"user=uwchamber"
