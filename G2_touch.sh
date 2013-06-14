#!/bin/bash
ls -l new.txt # to show its time record if there is a file "new.txt"
touch -c new.txt # if no create an empty file
ls -l new.txt # to show the file time record
touch new.txt # to update the access and modification time to the current time
stat new.txt
touch -t 201304171415 new.txt # to set a certain time instead of the current time
ls -l new.txt # to show the time record
touch -r a.txt new.txt # use this file's time instead of the current time, same as the command --file
ls -l new.txt
touch -d '2013-04-17 15:11:11' new.txt # to set the date time, same as the command --date
ls -l new.txt
touch -c new1.txt # if the file does not exist, no create
touch -a new.txt # change only the access time
stat new.txt
touch -m new.txt # change only the modification time
stat new.txt
touch -a -t 201304171450 new.txt # set a certain time instead of the current time as the access time
stat new.txt


for i in {1..6}
do
  touch $i.txt
done

if [ -e a.txt ];then
  echo "File a.txt exists"
else
touch a.txt;
  echo "File a.txt created"
fi

#edit for exam
#edit for exam 14-06-2013
