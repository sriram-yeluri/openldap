#!/usr/bin/env bash

# Configuration and Make steps for openldap
#
# --enable-overlays       enable all available overlays
# --enable-static         build static libraries
# --enable-shared         build shared libraries
# --enable-bdb            enable Berkeley DB backend
# --enable-debug          enable debugging
# --enable-dynamic        enable linking built binaries with dynamic libs
# --enable-syslog         enable syslog support
# make test will run all openldap predefined test cases, for around 30 to 40 minutes.


OPENLDAP_REL_VER=2.4.46
PREFIX=/appl/openldap 

# Compile and Install Openldap
#download openldap sources from "ftp://ftp.openldap.org/pub/OpenLDAP/openldap-release/"
#mkdir -p /appl/openldap && cd /appl/openldap
mkdir -p /appl && cd /appl
wget ftp://ftp.openldap.org/pub/OpenLDAP/openldap-release/openldap-$OPENLDAP_REL_VER.tgz
gunzip -c openldap-$OPENLDAP_REL_VER.tgz | tar xvfB -
cd openldap-$OPENLDAP_REL_VER

./configure --prefix="$PREFIX" \
--exec-prefix="$PREFIX" \
--bindir="$PREFIX"/bin \
--sbindir="$PREFIX"/sbin \
--libexecdir="$PREFIX"/libexec \
--sysconfdir="$PREFIX"/etc \
--sharedstatedir="$PREFIX"/com \
--localstatedir="$PREFIX"/var \
--libdir="$PREFIX"/lib \
--includedir="$PREFIX"/include \
--oldincludedir="$PREFIX"/usr/include \
--datarootdir="$PREFIX"/share \
--datadir="$PREFIX"/share \
--infodir="$PREFIX"/info \
--localedir="$PREFIX"/locale \
--enable-overlays \
--enable-slapd \
--enable-bdb \
--enable-static \
--enable-shared \
--enable-debug \
--enable-syslog &&
make depend && make 
#&& make install
