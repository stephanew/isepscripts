#!/bin/sh

# The command grep allows us to search a string in a file 

# show the lines which contain the searched string in a file
grep "String"  FileName   

# show the lines which contain the searched string in a file
# And   the N next lines
grep -AN "String"  FileName 

# show the lines which contain the searched string in a file
# And   the N previous lines
grep -BN "String"  FileName     

# show the lines which contain the searched string in a file,
# the N previous lines and the N next lines
grep -CN "String"  FileName

# show the lines which contain the searched string in a file,
# and the number of characters
grep -b "String"  FileName 

# show the lines which contain the searched string in a file,
# and the line number
grep -n  "String"  FileName		

# show the lines which contain the searched string in a Folder and sub Folder
grep -r  "String" FolderName 

# show the lines which contain the searched string in a File ignoring Upper and lower case
grep -i  "String" FileName

# We can also use regular expressions 
# . any characters
# ^ beginning of the line 
# $ end of the line
# []  one of the characters between the [  ]
# | or
grep -E ^string FileName
grep -E .ello FileName
grep -E $hello FileName
grep -E [Hh]ello FileName

#search the string "ORA-" in all log files
find . -name "*.log" -exec grep -Hn "ORA-" {} \;

cat essai1 | grep  ".*" >essai2 
#all text write in essai1 is writing in essai2

