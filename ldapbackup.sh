#!/bin/sh
#set the environment ST ET PR
ENV=ST
#/appl/openldap/sbin/slapcat -b "cn=root,o=sccm" -l $BACKUPDIR/$LDAPBK
#/appl/openldap/sbin/slapcat -b "cn=root,o=sccm" -l $BACKUPDIR/$LDAPBK
#The below script can be used to take backup of ldap-data twice a day at 4:00 CET and 22.00 CET and rotate the backup every fifth day
#and also take hourly backup of ldap-data with a back-up rotate ever 7 hours
#Useage of this script:
#Create a crontab: <Command> as the apacheds user
#Set the current date-time with the format YYYYMMDD-HH
dateTime=$(date +%y%m%d-%H)
#Set the current date-time with the format YYYYMMDD-HHMM
dateTimeHours=$(date +%y%m%d-%H%M)
#Set the date-time Prior to 5 days with the format YYYYMMDD-HH
dateTimePrior=$(date +%y%m%d-%H -d "5 days ago")
#Set morning date-time with the format YYYYMMDD-04
dateTimeMorning=$(date +%y%m%d)-04
#Set night date-time with the format YYYYMMDD-22
dateTimeNight=$(date +%y%m%d)-22
#Set applicationPath
#applicationPath="/var/lib/apacheds-2.0.0_M23/default"
#set houly/daily backup name
LDAPBKHourly=$ENV-ldap-backup-${dateTimeHours}.ldif
LDAPBKHourlyPrior=$ENV-ldap-backup-$(date +%y%m%d-%H%M -d "7 hour ago").ldif
LDAPBKDaily=$ENV-ldap-backup-${dateTime}.ldif
LDAPBKDailyPrior=$ENV-ldap-backup-${dateTimePrior}.ldif
#Set backUpPath
#backUpPath="/var/lib/ldap-backup"
BACKUPDIR=/data/openldap_backup

#do not modify below script
echo "----------------------------------------------------------------------"
if [[ ("${dateTime}" == "${dateTimeMorning}") || ("${dateTime}" == "${dateTimeNight}") ]] ; then
#cp -r -p ${applicationPath}/partitions ${backUpPath}/partitions-${dateTime}
    /appl/openldap/sbin/slapcat -b "cn=root,o=sccm" -l ${BACKUPDIR}/${LDAPBKDaily}
    echo "Daily backup is created with name ${LDAPBKDaily} at $(date)"
    cd ${BACKUPDIR}
    if [[ -f ${BACKUPDIR}/${LDAPBKDailyPrior} ]] ; then
        cd ${BACKUPDIR}
        rm -rf ${LDAPBKDailyPrior}
        echo "Backup prio to 5 days with name ${LDAPBKDailyPrior} was deleted at $(date)"
    else
        cd ${BACKUPDIR}
        echo "${LDAPBKDailyPrior} not found path = $pwd"
    fi
else
    /appl/openldap/sbin/slapcat -b "cn=root,o=sccm" -l ${BACKUPDIR}/${LDAPBKHourly}
    #cp -r -p ${applicationPath}/partitions ${backUpPath}/partitions-${dateTimeHours}
    echo "Hourly backup is created with name ${LDAPBKHourly} at $(date)"
fi
#find ${BACKUPDIR}/$ENV-ldap-backup-$(date +%y%m%d-%H%M -d "7 hour ago").ldif -type d -exec rm -rf {} \;
if [[ -f ${BACKUPDIR}/${LDAPBKHourlyPrior} ]] ; then
    cd ${BACKUPDIR}
    rm -rf ${LDAPBKHourlyPrior}
echo $(date +%y%m%d-%H%M) Ldap $(date +%y%m%d-%H%M -d "7 hour ago") 7 hours is deleted
fi
