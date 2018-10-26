ARG VERSION=7
FROM centos:${VERSION}
MAINTAINER SriramYeluri <yeluris@gmail.com>

ENV APP=/appl
ENV DATA=/data

RUN yum update -y && yum clean all

RUN yum -y install openldap compat-openldap openldap-clients openldap-servers openldap-servers-sql openldap-devel
