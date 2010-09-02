#!/bin/sh

scp -r -i /home/kishari/.ssh/vvdev.pem /home/kishari/screek/rules ubuntu@aws-3.dbx.hu:/home/ubuntu/screek
scp -i /home/kishari/.ssh/vvdev.pem /home/kishari/screek/log4j.properties ubuntu@aws-3.dbx.hu:/home/ubuntu/glassfishv3/glassfish/domains/screek/lib/classes
scp -i /home/kishari/.ssh/vvdev.pem /home/kishari/screek/screek.properties ubuntu@aws-3.dbx.hu:/home/ubuntu/glassfishv3/glassfish/domains/screek/lib/classes
scp -i /home/kishari/.ssh/vvdev.pem /home/kishari/screek/screek.war ubuntu@aws-3.dbx.hu:/home/ubuntu/glassfishv3/glassfish/domains/screek/autodeploy
