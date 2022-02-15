#!../../bin/linux-x86_64/E3633A

#- You may have to change E3633A to something else
#- everywhere it appears in this file

< envPaths
cd "${TOP}"


## Register all support components
dbLoadDatabase "${TOP}/dbd/E3633A.dbd"
E3633A_registerRecordDeviceDriver pdbbase

epicsEnvSet ("STREAM_PROTOCOL_PATH", "${TOP}/E3633AApp/Db")
epicsEnvSet ("PREFIX", "SLAC:E3633A:")
epicsEnvSet ("PORT", "serial1")



drvAsynSerialPortConfigure("serial1", "/dev/ttyUSB0", 0, 0, 0)
asynOctetSetInputEos("serial1",0,"\n")
asynOctetSetOutputEos("serial1",0,"\n")
asynSetOption("serial1",0,"baud","9600")
asynSetOption("serial1",0,"bits","8")
asynSetOption("serial1",0,"stop","2")
asynSetOption("serial1",0,"parity","none")
asynSetOption("serial1",0,"clocal","N")
asynSetOption("serial1",0,"crtscts","N")

## Load record instances

dbLoadRecords ("${TOP}/E3633AApp/Db/Agilent_E3633A.db", "P=$(PREFIX), PORT=serial1")
dbLoadRecords ("$(ASYN)/db/asynRecord.db", "P=$(PREFIX), R=asyn1, PORT=serial1, ADDR=0, IMAX=80, OMAX=80")
dbLoadRecords ("$(AUTOSAVE)/db/save_restoreStatus.db", "P=SLAC:E3633A:")


#- Set this to see messages from mySub
#var mySubDebug 1

#- Run this to trace the stages of iocInit
#traceIocInit

#cd "${TOP}/iocBoot/${IOC}"
iocInit

## Start any sequence programs
#seq sncExample, "user=quan"
