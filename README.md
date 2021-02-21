# openldap

## Repository created for openldap

* Compiling openldap from source code
* Configuring openldap

## Installation

```sh
## Configuration is set to install the openldap to /appl/openldap folder. 
## So make sure permissions are set accordingly, before starting the installation. 

make install

# Go to the installation folder
cd /appl 
 
#Create Tar ball
tar -czvf openldap.tar.gz openldap

#Extract tar ball on any other target machines:
tar -xhzvf openldap.tar.gz
```
