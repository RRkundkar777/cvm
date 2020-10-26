#! /usr/bin/bash

# Creating a Skeleton Program File
touch shell.c
echo "/* Title : " >> shell.c
echo "Author : " >> shell.c
echo "Date : " >> shell.c
echo "Status : " >> shell.c
echo "Last Edited :  */" >> shell.c
echo "#include<stdio.h>" >> shell.c
echo "#include<stdlib.h>" >> shell.c
echo "#include<limits.h>" >> shell.c
echo "int main(){" >> shell.c
echo -e "\n" >> shell.c

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
		echo "	return 0;" >> shell.c
		echo "}" >> shell.c
		
		if [ -w shell.c ]
		then
			gcc shell.c -o shell
			rm shell.c
		fi
		
		if [ -w shell ]
		then
			./shell
			rm shell
		fi
		
		touch shell.c
		echo "/* Title : " >> shell.c
		echo "Author : " >> shell.c
		echo "Date : " >> shell.c
		echo "Status : " >> shell.c
		echo "Last Edited :  */" >> shell.c
		echo "#include<stdio.h>" >> shell.c
		echo "#include<stdlib.h>" >> shell.c
		echo "#include<limits.h>" >> shell.c
		echo "int main(){" >> shell.c
		echo -e "\n" >> shell.c
		
	#Exiting the Shell
	elif [ $line == "exit" ]
	then
		break
	else 
		echo $line >> shell.c
	fi
done

#REMOVAL OF DUMPS
# If shell.c exist only then remove it
if [ -w shell.c ]
then
	rm shell.c
fi
# If shell exists only then remove it
if [ -w shell ]
then
	rm shell
fi
