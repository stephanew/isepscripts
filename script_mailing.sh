#!/bin/bash

echo "<html><head></head><body><p>"> mail.html
echo "</p><h4>Nombre de mail envoye</h4><p>" >> mail.html
grep -c "From:" 2012.txt >> mail.html
echo "</p><h4>Expediteurs different</h4><p>" >> mail.html
grep "From:" 2012.txt | sort -n | uniq -c >> mail.html
echo "</p>" >> mail.html
echo "</body></html>" >> mail.html

