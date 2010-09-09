#!/bin/sh

domainDir="$HOME/glassfishv3/glassfish/domains/screek"
#echo $domainDir
domainClassesDir="$domainDir/lib/classes"
#echo $domainClassesDir

knowledgeBasePath="$HOME/screek/StrawCreek/src/main/rules"
echo "knowledgeBasePath=$knowledgeBasePath" > screek.properties

ant -f build.xml deploy

Move screek.properties file to $domainClassesDir directory...
mv screek.properties $domainClassesDir
