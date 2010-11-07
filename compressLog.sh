#!/bin/bash

yesterday=$(date -d yesterday +"%Y-%m-%d")

#echo $yesterday > /home/ubuntu/glassfishv3/glassfish/domains/services/logs/screek/yest

callerIdFile=/home/ubuntu/glassfishv3/glassfish/domains/services/logs/screek/callerIds.log.$yesterday
callerIdZipFile=/home/ubuntu/glassfishv3/glassfish/domains/services/logs/screek/callerIds.log.$yesterday.zip

#echo $callerIdFile
#echo $callerIdZipFile

zip -q -j $callerIdZipFile $callerIdFile

rm $callerIdFile

screekLogFile="/home/ubuntu/glassfishv3/glassfish/domains/services/logs/screek/screekv0.3.1.log.$yesterday"
screekLogZipFile="/home/ubuntu/glassfishv3/glassfish/domains/services/logs/screek/screekv0.3.1.log.$yesterday.zip"

zip -q -j $screekLogZipFile $screekLogFile

rm $screekLogFile

#PdfRender logot is tomoritsuk
pdfRenderLogFile=/home/ubuntu/glassfishv3/glassfish/domains/services/logs/flipfop/flipfop.log.$yesterday
pdfRenderLogZipFile=/home/ubuntu/glassfishv3/glassfish/domains/services/logs/flipfop/flipfop.log.$yesterday.zip

zip -q -j $pdfRenderLogZipFile $pdfRenderLogFile

rm $pdfRenderLogFile
