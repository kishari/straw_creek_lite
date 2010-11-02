#!/bin/bash

if test $# -eq 0 
then
	printf "Hasznalat: %s: [-a] konyvtar\n" $(basename $0) >&2
	printf "[-a] Tobb konyvtarbol csinal statisztikát.\nPelda: sh statistic.sh -a 2010-11 --> Minden 2010. 11. havi mappaban vegigmegy! (Novemberi statisztikat ad vissza)\n"
	exit 2
fi

havistat=0
while getopts 'a:' OPTION
do
	case $OPTION in
	  	a)	havistat=1
			bval="$OPTARG"
			;;
	  	[?])	printf "Hasznalat: %s: [-a] konyvtar\n" $(basename $0) >&2
			printf "[-a] Tobb konyvtarbol csinal statisztikát.\nPelda: sh statistic.sh -a 2010-11 --> Minden 2010. 11. havi mappaban vegigmegy! (Novemberi statisztikat ad vissza)\n"
			exit 2
			;;
	esac
done
shift $(($OPTIND - 1))



if [ $havistat -eq 0 ]; then
	echo Statisztika a kovetkezo mappabol: $1

	for f in $1/callerIds.log*; do
		if [ -e "${f}" ]; then
			sed -e 's/.*callerId: //g' ${f} >> tempCallerIds
		fi
	done

	if [ -f tempCallerIds ]; then
		sort tempCallerIds > sorted
		uniq sorted > uniqSorted
		
		rm tempCallerIds
		rm sorted
		
		while read line; do

 			row=$line;
 			#echo row: $row;

 			counter=0;
			for f1 in $1/callerIds.log*; do
 				if [ -e "${f1}" ]; then
					grep -c $row ${f1} | bc > lastNum;
					while read n; do
						#echo $line;	
						counter=`expr $counter + $n`;
					done < "lastNum"
 				fi
 			done
 		echo $row:$counter
		done < "uniqSorted"

		rm lastNum
		rm uniqSorted
	else
		echo "Nincs logbejegyzés az adott napra!"
	fi


else #összesített a teljes hónapra

	echo Statisztika a kovetkezo mappabol: $bval

	dirs=$bval"-*"
	#echo dirs: $dirs

	set -- "$dirs" 
	IFS=" "; declare -a Array=($*) 

	for dir in ${Array[@]}; do #Végigmegyünk az összes mappán (pl bemenet 2010-11 akkor minden 2010-11-* mappán)
    		#echo "$dir"
		for f in $dir/callerIds.log*; do
			if [ -e "${f}" ]; then
				sed -e 's/.*callerId: //g' ${f} >> tempCallerIds
			fi
		done

		if [ -f tempCallerIds ]; then
			sort tempCallerIds > sorted
			uniq sorted > uniqSorted

			rm sorted
			rm tempCallerIds
		
			while read line; do
	
 				row=$line;
 				#echo row: $row;

 				counter=0;
				for f1 in $dir/callerIds.log*; do
 					if [ -e "${f1}" ]; then
						grep -c $row ${f1} | bc > lastNum;
						while read n; do
							#echo $line;	
							counter=`expr $counter + $n`;
						done < "lastNum"
 					fi
 				done
				#echo $row:$counter
 				echo $row:$counter >> "tempstat_"$dir
			done < "uniqSorted"

			rm lastNum
			rm uniqSorted
		else
			echo "Nincs callerId logFile az adott napi mappában: "$dir
		fi		
	done

	#Végigmegyünk a tempstat fájlokon, és beletesszük egy közös fájlba őket (allstat)
	for dir in ${Array[@]}; do
		if [ -f "tempstat_"$dir ]; then
			while read line; do
				r=$line;
				echo $r >> allstat
			
			done  < "tempstat_"$dir
			
			rm "tempstat_"$dir
		fi
	done
	
	if [ -f allstat ]; then
		sort allstat > allstatSorted
		rm allstat
	else
		echo "Az adott hónapra nincs callerId logbejegyzés: "$bval
	fi
	
	
	if [ -f "sum_"$bval ]; then #Ha létezik a megadott hónappal összegző file, akkor azt töröljük
		rm "sum_"$bval
	fi

	if [ -f allstatSorted ]; then
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
				echo $lastCaller : $summa >> "sum_"$bval
				summa=0
				summa=`expr $summa + $value`;
			fi
		
			lastCaller=$caller	
		done  < "allstatSorted"

		echo $lastCaller : $summa
		echo $lastCaller : $summa >> "sum_"$bval

		rm allstatSorted
	fi

fi


