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

cat ../www.viedemerde.fr/feeds/articles | awk '/'${FIRST}'/','/content>/' | grep 'content' | sed 's/^<content.*\[\(.*\)\]\].*content>$
#cat send the content of articles
#awk select the section of the corresponding article
#grep select the content line
#sed sanitize the line removing the extra symbols (<>[[]]<>)

#Laurent PAYET 7422 - laurent-payet@laposte@nospam.net

