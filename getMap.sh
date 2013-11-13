#!/bin/bash
echo 'Generating Data ...';
echo 'This will take some time, so go and get a coffee';

a=0;
while read line
do a=$(($a+1));
sleep 0.5;
echo "Requesting: "$line;
curl -s -S --data "pdbCode=$line&page=generate&mapformat=ccp4&maptype=2fofc" http://eds.bmc.uu.se/cgi-bin/eds/gen_maps_zip.pl > /dev/null
done < "data.txt"


echo "Waiting for data to generate";
sleep 240;


a=0;
while read line
do a=$(($a+1));
wget http://eds.bmc.uu.se/tmp/eds/$line.ccp4.gz
done < "data.txt"

