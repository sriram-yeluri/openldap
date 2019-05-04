
```sh
# How to take OpenLDAP backup manually
Use slapcat utility from OpenLDAP to create a backup file
`/appl/openldap/sbin/slapcat -b "cn=root,o=sccm" -l openldap-backupfile.ldif `
```


```sh
# How to restore OpenLDAP manually  

1. Stop OpenLDAP service by stopping slapd daemon
2. Go to /appl/openldap/var/openldap-data-sccm and delete all the files
3. Execute the slapadd command `./slapadd -q -l /appl/openldap/backup/backupfile.ldif`
4. `chmod -R 700 /appl/openldap/var/openldap-data-sccm `
5. Start OpenLDAP service by starting slapd daemon
```


```sh
# How to know the version of OpenLDAP
/appl/openldap/libexec/slapd -VV
(or)
/appl/openldap/bin/ldapsearch -VV
```
