#! /bin/bash
#READ POINTERS
line_pointer=0  # This pointer will read lines from input file
load_pointer=0  # This pointer will be used to display status bar

#FONT STYLES  
bold=$(tput bold)
normal=$(tput sgr0)

#FONT COLORS
yellow='\033[1;33m'
green='\033[1;32m'
nocolor='\033[0m'
red='\033[1;31m'
magenta='\033[1;35m'

#ACTUAL PROCESSOR CODE

#APPENDING TO PROGRAM FILE
touch cvmtemps.c   # File where program Source Code will be stored

# This Code reads input file line by line 
cat $1 | while read line # the | symbol indicates that the output of cat is input to the while loop (i.e. read)
do
	if [ "$line"  ==  "C#" ]    # Set line_pointer to 1
	then
		line_pointer=$((line_pointer+1))	
	fi
	
	if [ "$line"  ==  "#C" ]    #Stop appending to cvmtemps.c
	then
		line_pointer=0	
	fi
		
	if [ $line_pointer -ne 0 ]
	then
		if [ $line_pointer -eq 1 ]  #This line prevents "C#" from appending
		then
			line_pointer=$((line_pointer+1))
		else
			echo $line >> cvmtemps.c #This line starts appending our code to Program file
		fi 
	fi
done

#STATUS BAR (for compilation)
echo -n "Compiling.... ["
while [ $load_pointer  -ne 25 ]
do
	echo -n "#"
	sleep 0.04
	load_pointer=$((load_pointer+1))
done
echo "]"

#COMPIING THE PROGRAM FILE
gcc -o cvmtemps cvmtemps.c

#SUCCESS INDICATOR (Indicates success if there are no errors in file)
#Else throws an error

if [ -w cvmtemps ] #Since we stored the executable output in cvmtemps,
# cvmtemps must exist
#AND IF IT does not exist, then there maybe errors in Code
then
	echo -e "${bold}${green}cvm: ${nocolor}${normal}${magenta}Integration Successful${nocolor} "
else
	echo -e "${bold}${red}cvm: ${nocolor}${normal}${bold}Unable to Compile $1 (${yellow}Check the Syntax for errors${nocolor})${normal} "
	fi

#SLEEPING
sleep 2  #TO CONVEY THE USER THAT COMPILATION AND EXECUTION ARE SEPERATE PROCESSES

#STATUS BAR (for execution)
load_pointer=0
echo -n "Executing.... ["
while [ $load_pointer  -ne 25 ]
do
	echo -n "#"
	sleep 0.04
	load_pointer=$((load_pointer+1))
done
echo "]"

#EXECUTION WRT ARGUMENTS PASSED
if [ -w cvmtemps ]  #If output executable file exists
then
	if [ "$2" != "time" ] #If second argument is not time
	then
		./cvmtemps #Execute
	else
		echo -e "Total Execution times are:"  #Else show execution time	
		time ./cvmtemps > time.txt
		#removing the TIME DUMP
		rm time.txt
	fi
	# Removing the executable
	#Note that this is placed inside if [-w cvmtemps]
	#Because it can be removed only if it is CREATED
	rm cvmtemps
else
	echo -e "${bold}${red}error: ${nocolor}${normal}${bold} execution terminated (${yellow}Unable to Execute${nocolor})${normal} "
fi

#The Program File is necessarily removed because it is necessarily created
#(SEE LINE NO 20)
rm cvmtemps.c
