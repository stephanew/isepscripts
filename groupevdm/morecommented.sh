#!/bin/bash

#List the top 5 articles ID most commented and print the content of the most one. : 


ARTICLES=`cat ../www.viedemerde.fr/feeds/comments | grep -o '<title type="html">Commentaire de la VDM #[0-9]\{7\}</title>' | sort -nk6 | uniq -c |  sed 's/^.*\([0-9]\).*\(#[0-9]\{7\}\).*$/\1\2/g' | sort -nrk1 | head -5
`;

#cat print the content of the comment feed
#grep find the titles of related articles
#sort sort on the id column
#uniq counts them
#sed delete the space before, between and after the couples formed by the occurence and the id of the article. The goal is to be able to treat each line in a for loop.
#sort sort the counted article on the first column
#head limits the result to 5 lines


printf '\nTop 5 des articles les plus commentés :\n';

for i in $ARTICLES; do
#for each of the previous lines

ARTICLE=`echo $i | grep -o '[0-9]\{7\}$'`;
#isolate the article id
NBCOM=`echo $i | grep -o '^[0-9]\{1,\}'`;
#isolate the number of comments
echo "l'article $ARTICLE a été commenté $NBCOM fois";
done;

FIRST=`echo $ARTICLES | cut -d "#" -f2 | grep -o '[0-9]\{7\}'`;
#echo send the complete line : NBcomm1#IDart1 NBcomm2#IDart...
#cut explode the previous string with # : NBcomm1 | IDart1 NBcomm2 |IDart...
#and select the second field
#grep select a range of 7 numbers, forming the ID of the most rated article

printf '\n Article le plus commenté : '${FIRST}':\n';

cat ../www.viedemerde.fr/feeds/articles | awk '/'${FIRST}'/','/content>/' | grep 'content' | sed 's/^<content.*\[\(.*\)\]\].*content>$/\1/g';
#cat send the content of articles
#awk select the section of the corresponding article
#grep select the content line
#sed sanitize the line removing the extra symbols (<>[[]]<>)

#Laurent PAYET 7422 - laurent-payet@laposte@nospam.net
