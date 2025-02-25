TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS BELOW HERE

# Use typed rset structure (see 3.16.1 release notes)
USR_CPPFLAGS += -DUSE_TYPED_RSET

# xxxRecord.h will be created from xxxRecord.dbd
DBDINC += xxxRecord

# Install xxxSupport.dbd into <top>/dbd
DBD += xxxSupport.dbd

# Build an IOC support library
LIBRARY_IOC += E3633ASupport

# Compile and add code to the support library
E3633ASupport_SRCS += xxxRecord.c
E3633ASupport_SRCS += devXxxSoft.c

# Link locally-provided code into the support library,
# rather than directly into the IOC application, that
# causes problems on Windows DLL builds
E3633ASupport_SRCS += dbSubExample.c
E3633ASupport_SRCS += devE3633AVersion.c
E3633ASupport_SRCS += E3633AHello.c
E3633ASupport_SRCS += initTrace.c

E3633ASupport_LIBS += $(EPICS_BASE_IOC_LIBS)

# Auto-generate a header file containing a version string.
# Version comes from the VCS if available, else date+time.
GENVERSION = E3633AVersion.h
# Macro name
GENVERSIONMACRO = E3633AVERSION

# Build the IOC application
PROD_IOC = E3633A

# E3633A.dbd will be created and installed
DBD += E3633A.dbd

# E3633A.dbd will include these files:
E3633A_DBD += base.dbd
E3633A_DBD += xxxSupport.dbd
E3633A_DBD += dbSubExample.dbd
E3633A_DBD += devE3633AVersion.dbd
E3633A_DBD += E3633AHello.dbd
E3633A_DBD += initTrace.dbd
E3633A_DBD += asyn.dbd
E3633A_DBD += drvAsynIPPort.dbd
E3633A_DBD += drvAsynSerialPort.dbd
E3633A_DBD += calc.dbd
E3633A_DBD += stream-scalcout.dbd
E3633A_DBD += stream.dbd
E3633A_DBD += asSupport.dbd
# E3633A_registerRecordDeviceDriver.cpp derives from E3633A.dbd
E3633A_SRCS += E3633A_registerRecordDeviceDriver.cpp

# Build the main IOC entry point where needed
E3633A_SRCS_DEFAULT += E3633AMain.cpp
E3633A_SRCS_vxWorks += -nil-

# Link in the code from our support library
E3633A_LIBS += E3633ASupport
E3633A_LIBS += asyn
E3633A_LIBS += calc
E3633A_LIBS += autosave
E3633A_LIBS += stream
# To build SNL programs, SNCSEQ must be defined
# in the <top>/configure/RELEASE file
ifneq ($(SNCSEQ),)
    # Build sncExample into E3633ASupport
    sncExample_SNCFLAGS += +r
    E3633A_DBD += sncExample.dbd
    # A .stt sequence program is *not* pre-processed:
    E3633ASupport_SRCS += sncExample.stt
    E3633ASupport_LIBS += seq pv
    E3633A_LIBS += seq pv

    # Build sncProgram as a standalone program
    PROD_HOST += sncProgram
    sncProgram_SNCFLAGS += +m
    # A .st sequence program *is* pre-processed:
    sncProgram_SRCS += sncProgram.st
    sncProgram_LIBS += seq pv
    sncProgram_LIBS += $(EPICS_BASE_HOST_LIBS)
endif

# Link QSRV (pvAccess Server) if available
ifdef EPICS_QSRV_MAJOR_VERSION
    E3633A_LIBS += qsrv
    E3633A_LIBS += $(EPICS_BASE_PVA_CORE_LIBS)
    E3633A_DBD += PVAServerRegister.dbd
    E3633A_DBD += qsrv.dbd
endif

# Finally link IOC to the EPICS Base libraries
E3633A_LIBS += $(EPICS_BASE_IOC_LIBS)

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD EXTRA GNUMAKE RULES BELOW HERE

# Explicit dependency needed for generated header file
devE3633AVersion$(DEP): $(COMMON_DIR)/$(GENVERSION)
