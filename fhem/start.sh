#!/bin/bash

set -e
cd /opt/fhem
port=7072

cp /opt/fhem/www/images/default/fhemicon_dark_cpid.png /opt/fhem/www/images/default/fhemicon_dark.png

echo "Starte FHEM"
perl fhem.pl fhem.cfg | tee /opt/fhem/log/fhem.log
