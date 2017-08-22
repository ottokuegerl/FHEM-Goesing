#!/bin/bash

set -e
cd /opt/fhem
sh ./opt/fhem/cpid.sh
port=7072

echo "Starte FHEM"
perl fhem.pl fhem.cfg | tee /opt/fhem/log/fhem.log
