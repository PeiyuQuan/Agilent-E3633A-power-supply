TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = DC
# DC.dbd will be created and installed
DBD += DC.dbd

# DC.dbd will be made up from these files:
DC_DBD += base.dbd

# Include dbd files from all support applications:
#DC_DBD += xxx.dbd
DC_DBD += asyn.dbd
DC_DBD += stream.dbd
DC_DBD += drvAsynIPPort.dbd
DC_DBD += drvAsynSerialPort.dbd
DC_DBD += stream-scalcout.dbd
DC_DBD += calc.dbd
# Add all the support libraries needed by this IOC
#DC_LIBS += xxx
DC_LIBS += asyn
DC_LIBS += stream
DC_LIBS += calc
# DC_registerRecordDeviceDriver.cpp derives from DC.dbd
DC_SRCS += DC_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
DC_SRCS_DEFAULT += DCMain.cpp
DC_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#DC_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
DC_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

