FROM debian:buster

MAINTAINER Otto KUEGERL

ENV FHEM_VERSION 5.9
ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

# Install dependencies
RUN apt-get update && apt-get upgrade -y --force-yes && apt-get install -y --force-yes --no-install-recommends
RUN apt-get -y --force-yes install \
libalgorithm-merge-perl \
libavahi-compat-libdnssd-dev \
libclass-dbi-mysql-perl \
libclass-isa-perl \
libcommon-sense-perl \
libdatetime-format-strptime-perl \
libdbd-sqlite3-perl \
libdbi-perl \
libdevice-serialport-perl \
libdpkg-perl \
liberror-perl \
libfile-copy-recursive-perl \
libfile-fcntllock-perl \
libio-socket-ip-perl \
libio-socket-multicast-perl \
libio-socket-ssl-perl \
libnet-ssleay-perl \
libjson-perl \
libjson-xs-perl \
libmail-sendmail-perl \
libnet-telnet-perl \
libsoap-lite-perl \
libsocket-perl \
libswitch-perl \
libsys-hostname-long-perl \
libterm-readkey-perl \
libterm-readline-perl-perl \
libtext-diff-perl \
libwww-perl \
libxml-simple-perl \
libcgi-pm-perl \
libtimedate-perl \
libmail-imapclient-perl \
libgd-graph-perl \
libtext-csv-perl \
liblist-moreutils-perl \
ttf-liberation \
libimage-librsvg-perl \
libgd-text-perl \
libsocket6-perl \
libio-socket-inet6-perl \
libmime-base64-perl \
libimage-info-perl \
libsys-statistics-linux-perl \
libdigest-crc-perl \
libxml-parser-lite-perl \
libxml-treebuilder-perl \
libhtml-treebuilder-xpath-perl \
libhtml-tableextract-perl \
libconvert-base32-perl \
libauthen-oath-perl \
libcrypt-urandom-perl \
mailutils \
ssmtp \
mysql-server \
mysql-client \
libclass-dbi-mysql-perl \
librpc-xml-perl \
cpanminus


# Install perl packages
RUN apt-get -y --force-yes install \

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

# EXPOSE 8083

CMD bash /opt/fhem/start.sh
