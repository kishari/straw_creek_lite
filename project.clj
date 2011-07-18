(defproject mabisz "0.1.0-SNAPSHOT"
  :description "MabiszCalculator"
  :library-path "lib"
  :dependencies [[org.springframework/spring-context "3.0.1.RELEASE-A"]
		 		 [org.springframework/spring-web "3.0.1.RELEASE-A"]
  				 [commons-pool/commons-pool "1.5.4"]
  				 [log4j/log4j "1.2.14"]
  				 [net.sf.opencsv/opencsv "2.1"]
  				 [joda-time/joda-time "1.6"]
				 [org.drools/drools-api "5.0.1"]
  				 [org.drools/drools-compiler "5.0.1"]
  				 [javax/javaee-api "6.0"]
				 [xerces/xercesImpl "2.7.1"]]
  :omit-default-repositories true
  :repositories {"dbx-maven-repository" "http://maven.dbx.hu/"})


