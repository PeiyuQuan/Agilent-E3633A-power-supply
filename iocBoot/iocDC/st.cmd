#!../../bin/linux-x86_64/AJA

#- You may have to change AJA to something else
#- everywhere it appears in this file

< envPaths
epicsEnvSet ("STREAM_PROTOCOL_PATH", "${TOP}/AJAApp/Db")
epicsEnvSet("PREFIX", "UWXRD:AJA:")
epicsEnvSet("PORT", "serial1")


## Register all support components
dbLoadDatabase "${TOP}/dbd/AJA.dbd"
AJA_registerRecordDeviceDriver pdbbase
drvAsynSerialPortConfigure("serial1", "ttyUSB0", 0, 0, 0)
asynSetOption("serial1",0,"baud","38400")
asynSetOption("serial1",0,"bits","8")
asynSetOption("serial1",0,"stop","1")
asynSetOption("serial1",0,"parity","none")
asynSetOption("serial1",0,"clocal","Y")
asynSetOption("serial1",0,"crtscts","N")
asynSetTraceIOMask("serial1",0, ESCAPE|HEX)


asynSetTraceIOMask("serial1",0,2)
asynSetTraceMask("serial1",0,9)

## Load record instances
#dbLoadRecords("db/xxx.db","user=uwchamber")
dbLoadRecords("${TOP}/AJAApp/Db/AJA-powersupply.db","P=$(PREFIX),PORT=serial1")


iocInit

## Start any sequence programs
#seq sncxxx,"user=uwchamber"
