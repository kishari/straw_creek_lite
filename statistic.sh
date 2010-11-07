#!/bin/bash

if test $# -eq 0; then
	logFile="callerIds.log"
	if [ -f $logFile ]; then
		echo Statisztika a mai naprol:
		echo "("Lekerdezes idopontja: $(date)")"
		echo "------------------------"

		sed -e 's/.*callerId: //g' $logFile >> tempCallerIds
		sort tempCallerIds > sorted
		uniq sorted > uniqSorted
	
		rm tempCallerIds
		rm sorted
		
		sumCounter=0;
		while read line; do
	
			counter=0;
			grep -c "$line" $logFile | bc > lastNum;
			while read n; do
				#echo $line;	
				counter=`expr $counter + $n`;
			done < "lastNum"
			echo $line:$counter
			sumCounter=`expr $sumCounter + $counter`;
		done < "uniqSorted"

		echo "----------"
		echo "Osszesen: "$sumCounter
		rm lastNum
		rm uniqSorted
	
		exit 2
	else
		echo "A mai napra még nincs callerIds.log fájl!"
		exit 2
	fi
fi

havistat=0
while getopts 'a:' OPTION
do
	case $OPTION in
	  	a)	havistat=1
			month="$OPTARG"
			;;
	  	[?])	printf "Hasznalat: %s [-a] [datum]\n" $(basename $0) >&2 
			printf "Pelda: bash statistic.sh 2010-10-03\n"
			printf "[-a] Az egesz honaprol csinal statisztikát.\nPelda: bash statistic.sh -a 2010-10\n"
			printf "Ha nem adunk meg parametert, akkor az aktualis naprol keszit statisztikat.\nPelda: bash statistic.sh\n"
			exit 2
			;;
	esac
done
shift $(($OPTIND - 1))



if [ $havistat -eq 0 ]; then
	if [ ${#1} -ne 10 ];then
		echo "Hibas input: "$1
		echo "Helyes input formatum: yyyy-mm-dd"
		exit 2
	fi
	echo Statisztika a kovetkezo naprol: $1
	echo "("Lekerdezes idopontja: $(date)")"
	echo "------------------------------"
	
	unzip -q "callerIds.log."$1."zip"
	f="callerIds.log."$1
	#echo $f
	if [ -f $f ]; then
		sed -e 's/.*callerId: //g' $f >> tempCallerIds

		sort tempCallerIds > sorted
		uniq sorted > uniqSorted
	
		rm tempCallerIds
		rm sorted

		sumCounter=0;
		while read line; do
	
			counter=0;
			grep -c "$line" $f | bc > lastNum;
			while read n; do
				#echo $line;	
				counter=`expr $counter + $n`;
			done < "lastNum"
			echo $line:$counter
			sumCounter=`expr $sumCounter + $counter`;
		done < "uniqSorted"

		echo "----------"
		echo "Osszesen: "$sumCounter

		rm lastNum
		rm uniqSorted
		rm "callerIds.log."$1
	else
		echo "Nincs callerId logbejegyzés az adott napra!"
	fi


else #összesített a teljes hónapra

	if [ ${#month} -ne 7 ];then
		echo "Hibas input: "$month
		echo "Helyes input formatum: yyyy-mm"
		exit 2
	fi
	echo Statisztika a kovetkezo honaprol: $month
	echo "("Lekerdezes idopontja: $(date)")"
	echo "--------------------------------"
	
	zipFiles="callerIds.log."$month"-*.zip"
	#echo files: $files

	set -- "$zipFiles" 
	IFS=" "; declare -a Array=($*) 
	
	
	if [ ${#Array[@]} -ne 0 ]; then
		for dailyLogZip in ${Array[@]}; do #Végigmegyünk az összes fájlon (pl bemenet 2010-11 akkor minden 2010-11-* végződésű callerIds.log fájlon)
			unzip -q $dailyLogZip
			
			len=`expr length "$dailyLogZip"`;
			name=`echo "$dailyLogZip"`
			dailyLog=${name:0:len-4}
			
	    		echo "processing $dailyLog ..."
				sed -e 's/.*callerId: //g' $dailyLog >> callerIds
		
				sort callerIds > sortedCallerIds
				uniq sortedCallerIds > uniqSortedCallerIds

				rm sortedCallerIds
				rm callerIds
	
				while read line; do
					counter=0;
					grep -c "$line" $dailyLog | bc > lastNum;
					while read n; do
						#echo $n
						counter=`expr $counter + $n`;
					done < "lastNum"
					echo $line:$counter >> allstat
				done < "uniqSortedCallerIds"
				
				rm lastNum
				rm uniqSortedCallerIds
				rm $dailyLog
		done #Végigmentünk a logfájlokon

			sort allstat > allstatSorted

			rm allstat

			sumCounter=0
			summa=0
			first=1
			lastCaller=""
			while read line; do
				set -- "$line" 
				IFS=":"; declare -a row=($*)
				caller=${row[0]}
				value=${row[1]}		

				if [ $first -eq 1 ]; then
					lastCaller=$caller
					first=0
				fi

				if [ $caller == $lastCaller ]; then	
					summa=`expr $summa + $value`;		
				else
					echo $lastCaller : $summa
					sumCounter=`expr $sumCounter + $summa`;
					summa=0
					summa=`expr $summa + $value`;
				fi				
	
		
				lastCaller=$caller	
			done  < "allstatSorted"
	
			echo $lastCaller : $summa

			sumCounter=`expr $sumCounter + $summa`;
			echo "----------"
			echo "Osszesen: "$sumCounter

			rm allstatSorted			
	else
		echo "Nincs callerId logbejegyzes az adott honapban: "$month
	fi		
fi


