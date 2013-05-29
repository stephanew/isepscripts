#!/bin/sh

touch test.txt

# redirect the standard output
echo "This is a line of text." >> test.txt

# append some text at the end of the file
echo "This is some appended text." >> test.txt

# > is equivalent to 1> ("1" is for the standard output)
echo "This is a line of text." 1>> test.txt

# 2> is for stderr (standard error otuput)
# so this example will display the text in the
# terminal and store errors in err.txt
echo "This is a line of text." 2>> err.txt

# 2>&1 is for redirecting the stderr into stdout
# &> is for redirection both outputs.  Two examples
# are equivalent:
echo "This is a line of text." >> err.txt 2>&1
echo "This is a line of text." &> err.txt

#Count the number of lines in the file
nblines=`wc -l test.txt`
echo "There are now $nblines lines in the file test.txt"

nblineserr=`wc -l err.txt`
echo "There are now $nblineserr lines in the file err.txt"

#Replace a String
sed -i -e "s/This/That/g" test.txt 
