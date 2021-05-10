#! /usr/bin/bash

# Creating a Skeleton Program File
touch shell.cpp
echo "/* Title : " >> shell.cpp
echo "Author : " >> shell.cpp
echo "Date : " >> shell.cpp
echo "Status : " >> shell.cpp
echo "Last Edited :  */" >> shell.cpp
echo "#include<stdio.h>" >> shell.cpp
echo "#include<stdlib.h>" >> shell.cpp
echo "#include<limits.h>" >> shell.cpp
echo "#include<bits/stdc++.h>" >> shell.cpp
echo "using namespace std;" >> shell.cpp
echo "int main(){" >> shell.cpp
echo -e "\n" >> shell.cpp

echo "Ctrans 1.0.0 (default, Oct17 2020, 14:00:26)" 
echo "[GCC 9.3.0] on linux"


# Spawning a shell
shell_start=1
while [ $shell_start ]
do
	echo -n "Clang> "
	#Getting a user input
	read line
	# Running the Skeleton File
	if [ $line == "run" ]
	then
		echo "	return 0;" >> shell.cpp
		echo "}" >> shell.cpp
		
		if [ -w shell.cpp ]
		then
			g++ shell.cpp -o shell
			rm shell.cpp
		fi
		
		if [ -w shell ]
		then
			./shell
			rm shell
		fi
		
		touch shell.cpp
		echo "/* Title : " >> shell.cpp
		echo "Author : " >> shell.cpp
		echo "Date : " >> shell.cpp
		echo "Status : " >> shell.cpp
		echo "Last Edited :  */" >> shell.cpp
		echo "#include<stdio.h>" >> shell.cpp
		echo "#include<stdlib.h>" >> shell.cpp
		echo "#include<limits.h>" >> shell.cpp
		echo "int main(){" >> shell.cpp
		echo -e "\n" >> shell.cpp
		
	#Exiting the Shell
	elif [ $line == "exit" ]
	then
		break
	else 
		echo $line >> shell.cpp
	fi
done

#REMOVAL OF DUMPS
# If shell.cpp exist only then remove it
if [ -w shell.cpp ]
then
	rm shell.cpp
fi
# If shell exists only then remove it
if [ -w shell ]
then
	rm shell
fi
