FROM debian:jessie

MAINTAINER Otto KUEGERL

ENV FHEM_VERSION 5.8
ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

# Install dependencies
RUN apt-get update && apt-get upgrade -y --force-yes && apt-get install -y --force-yes --no-install-recommends apt-utils
RUN apt-get -y --force-yes install \
apt-transport-https \
build-essential \
dfu-programmer \
etherwake \
git \
htop \
mc \
net-tools \
perl \
snmp \
snmpd \
sqlite3 \
sudo \
telnet \
usbutils \
vim \
wget

RUN apt-get autoclean -y --force-yes && apt-get autoremove -y --force-yes

# Install perl packages
RUN apt-get -y --force-yes install \
libalgorithm-merge-perl \
libauthen-oath-perl \
libavahi-compat-libdnssd-dev \
libclass-dbi-mysql-perl \
libclass-isa-perl \
libcommon-sense-perl \
libconvert-base32-perl \
libcrypt-urandom-perl \
libdatetime-format-strptime-perl \
libdbd-sqlite3-perl \
libdbi-perl \
libdevice-serialport-perl \
libdpkg-perl \
liberror-perl \
libfile-copy-recursive-perl \
libfile-fcntllock-perl \
libio-socket-ip-perl \
libio-socket-ssl-perl \
libjson-perl \
libjson-xs-perl \
libmail-sendmail-perl \
libnet-snmp-perl \
libsocket-perl \
libswitch-perl \
libsys-hostname-long-perl \
libterm-readkey-perl \
libterm-readline-perl-perl \
libtext-diff-perl \
libwww-perl \
libxml-simple-perl

RUN apt-get autoclean -y --force-yes && apt-get autoremove -y --force-yes

# Install FHEM
RUN echo Europe/Berlin > /etc/timezone && dpkg-reconfigure tzdata

RUN wget https://fhem.de/fhem-${FHEM_VERSION}.deb && dpkg -i fhem-${FHEM_VERSION}.deb
RUN userdel fhem

# working directory within container
WORKDIR "/opt/fhem"

COPY data/fhem.cfg.example ./fhem.cfg
# copy MYCFG-files to WORKDIR
# COPY data/mycfg/ ./
# RUN mkdir -p /opt/fhem/mycfg
COPY data/mycfg/ ./mycfg/

# copy CPID-Logo
COPY data/fhemicon_dark_cpid.png /opt/fhem/www/images/default
COPY start.sh ./

EXPOSE 8083 7072

CMD bash /opt/fhem/start.sh
