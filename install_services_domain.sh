#!/bin/sh

domainDir="$HOME/glassfishv3/glassfish/domains/services"
#echo $domainDir
domainClassesDir="$domainDir/lib/classes"
#echo $domainClassesDir

knowledgeBasePath="$HOME/screek/StrawCreek/src/main/rules"
echo "knowledgeBasePath=$knowledgeBasePath" > screek.properties

rm $HOME/screek/StrawCreek/web/WEB-INF/screek.war

ant -f build.xml deploy

echo Move screek.properties file to $domainClassesDir directory...
mv screek.properties $domainClassesDir