#!/bin/bash

JAVA_LOC=/opt/java

sudo echo "Java Version Manager"

cd $JAVA_LOC

if [ -e current ]; then
    cur_vers=`ls -ls | grep current | awk '{print $NF}' | sed 's/\///g'`
else
    cur_vers=""
fi

flag=0

x=1
stop=`ls $JAVA_LOC | grep jdk | wc -l | awk '{print $1}'`
while [ $x -le $stop ]
do
    versions[$x]=`ls $JAVA_LOC | grep jdk | head -$x | tail -1`
    #echo ${versions[x]}
    line=${versions[x]}
    if [ "$cur_vers" == "$line" ]; then
        line="$line <--"
        flag=1
    fi
    echo "$x.) $line"
    x=$((x+1))
done

if [ $flag -eq 0 ]; then
    echo "**WARNING: Current version of Java does not exist.**"
fi

printf "Change to which version (1 - $stop)? "
read choice

choice=`echo $choice | awk '{print $1}'`

re='^[0-9]+$'

if ! [[ $choice =~ $re ]] || [ $choice -gt $stop ] || [ $choice -lt 1 ]; then
    echo "Error: Invalid choice.  Exiting."
    exit
fi

sudo rm current
sudo ln -s ${versions[choice]} current
