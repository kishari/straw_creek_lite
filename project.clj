(defproject screek "0.1.0-SNAPSHOT"
  :description "StrawCreek"
  :library-path "web/WEB-INF/lib"
  :dependencies [[org.antlr/antlr-runtime "3.1.1"]
  				 [org.springframework/spring "2.5.6"]
  				 [commons-pool/commons-pool "1.5.4"]
  				 [log4j/log4j "1.2.14"]
  				 [org.mvel/mvel2 "2.0.10"]
  				 [net.sf.opencsv/opencsv "2.1"]
  				 [joda-time/joda-time "1.6"]
  				 [org.drools/drools-api "5.0.1"]
  				 [org.drools/drools-core "5.0.1"]
  				 [org.drools/drools-compiler "5.0.1"]
  				 [javax/javaee-api "6.0"]]
  :repositories {"repository.jboss.org" "http://repository.jboss.com/maven2"
  				 "repository.java.net" "http://download.java.net/maven/2/"})

