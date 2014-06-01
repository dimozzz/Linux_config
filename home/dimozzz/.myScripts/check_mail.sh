#!/bin/bash
gmail_login=""
gmail_password=""
fetch="$(wget --secure-protocol=TLSv1 --timeout=3 -t 1 -q -O - https://${gmail_login}:${gmail_password}@mail.google.com/mail/feed/atom --no-check-certificate )"
line1="$(echo "$fetch" | sed 's/<fullcount>/\n<fullcount>/')"
line2="$(echo "$line1" | sed 's/<\/fullcount>/<\/fullcount>\n/')"
line="$(echo "$line2" | grep 'fullcount')"
unread="$(echo "$line" | sed "s/<fullcount>\(.*\)<\/fullcount>/\1/")"
if [ -z "$unread" ]; then
echo “!”
else
echo $unread
fi
