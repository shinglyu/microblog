echo "Please input the title:"

read TITLE
SLUGIFIED="$(echo -n "${TITLE}" | sed -e 's/[^[:alnum:]]/-/g' \
  | tr -s '-' | tr A-Z a-z)"

TIME=$(date +%Y-%m-%d\ %H:%M:%S\ +01:00)
DATE=$(date +"%Y-%m-%d-")

#echo $TITLE
#echo $SLUGIFIED
OUTFILE="_posts/${DATE}${SLUGIFIED}.md"

cp template.md $OUTFILE
# sed -i 's/title:  "Your Title Here" /title: "$OUTFILE"/g'
sed -i "s/title: TODO/title: $TITLE/g" $OUTFILE
sed -i "s/date: 2010-01-01 00:00:00 +08:00/date: $TIME/g" $OUTFILE
# cp _drafts
echo "File gereated: $OUTFILE"
cat $OUTFILE
vim $OUTFILE
