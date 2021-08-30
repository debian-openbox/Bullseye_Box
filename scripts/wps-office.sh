#!/bin/sh

if [ ! -d /home/$(logname)/Reports ]; then
    mkdir /home/$(logname)/Reports
fi


DIR=/home/$(logname)/Reports

# wget output file
FILE=wps-office.deb

# wget log file
LOGFILE=wget.log

# wget download url
URL=https://wdl1.pcfg.cache.wpscdn.com/wpsdl/wpsoffice/download/linux/10702/wps-office_11.1.0.10702.XA_amd64.deb

cd $DIR
wget $URL -O $FILE -o $LOGFILE

sudo chown -R 1000:1000 /home/$(logname)/Reports
sudo chmod +x /home/$(logname)/Reports/$FILE

