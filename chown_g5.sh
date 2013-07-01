#!/bin/bash

chown otherUser MyFile
#Change the owner of MyFile in otherUser

chown him:us myDir
# Change the owner in him and the owner group in us of the directory myDir

chown -R him:us myDir
# -R recursive function so the change is made in all subfolders and files in the root folder
# The owner and owner group may be different,
# Since the group owner is not necessarily the primary group of the owner
# And the owner is not necessarily a member of the group.
# By default the owner is the one who creates a file or folder
# And the group is the primary group of the user

ls -l
# check rights

find . -type f -name '*.pdf' -print0 | xargs -0 chown someuser:somegroup
# xargs treat each input
# print0 escaped newlines
# we are looking for all types and pdf files we change the owner someuser to somegroup

for i in `ls *.pdf`
do chown someuser:somegroup $i
done;
# same action with loop
