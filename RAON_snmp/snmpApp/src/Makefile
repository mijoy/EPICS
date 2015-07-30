TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

netsnmp_DIR = /usr/lib
# for jessie, need to check for Wheezy
# jhlee
netsnmp_DIR += /usr/lib/x86_64-linux-gnu

# need to check where it is in Wheezy
USR_CFLAGS  += `net-snmp-config --cflags`
USR_LDFLAGS += `net-snmp-config --libs`
PROD_LDLIBS += `net-snmp-config --libs`


#==================================================
# Build an IOC support library


LIBRARY += RAON_snmp
DBDINC         += snmpRecord snmpstrRecord
DBD            += snmpRecord.dbd snmpstrRecord.dbd
DBD            += snmpDevSoft.dbd
RAON_snmp_SRCS += snmpDevAsync.c snmpRecord.c snmpstrRecord.c
RAON_snmp_LIBS += netsnmp

#=============================
# Build the IOC application

PROD_IOC = snmp
# snmp.dbd will be created and installed
DBD += snmp.dbd

# snmp.dbd will be made up from these files:
snmp_DBD += base.dbd
snmp_DBD += snmpRecord.dbd

# Include dbd files from all support applications:
#snmp_DBD += xxx.dbd
snmp_DBD += snmpDevSoft.dbd

# Add all the support libraries needed by this IOC
#snmp_LIBS += xxx
snmp_LIBS += RAON_snmp

# snmp_registerRecordDeviceDriver.cpp derives from snmp.dbd
snmp_SRCS += snmp_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
snmp_SRCS_DEFAULT += snmpMain.cpp
snmp_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#snmp_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
snmp_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

