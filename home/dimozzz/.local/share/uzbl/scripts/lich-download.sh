#!/bin/sh
DOWNLOADER="wget --user-agent=Firefox --content-disposition --load-cookies=$XDG_DATA_HOME/uzbl/cookies.txt"
URL="$1"
SAVE="Save file"
CANCEL="Cancel saving"
UP=".."
#If you modify the above 3 variables, make sure you name them in such a manner that you will never have a folder with that same name
 
TARGET="$HOME/downloads"
FGCOLOR="#B8DDEA"
BGCOLOR="#222222"
SELCOLOR="#B8DDEA"
 
#could have "hardcoded" these or course but this is easier in case you want to modify something :)
 
while (true); do
DIRLIST=`ls -l $TARGET | grep ^d | awk '{print $9}'`
if dmenu --help 2>&1 | grep -q '\[-rs\] \[-ni\] \[-nl\] \[-xs\]'
then
    SELECTION=`echo -e -n "$SAVE\n$CANCEL\n$UP\n$DIRLIST" | dmenu -nb "$BGCOLOR" -nf "$FGCOLOR" -sb "$SELCOLOR" -sf "$BGCOLOR" -p "$TARGET" -xs -rs -l 20`
else
    SELECTION=`echo -e -n "$SAVE\n$CANCEL\n$UP\n$DIRLIST" | dmenu -nb "$BGCOLOR" -nf "$FGCOLOR" -sb "$SELCOLOR" -sf "$BGCOLOR" -p "$TARGET"`
fi
if [ "$SELECTION" = "$SAVE" ]; then 
    break
fi
if [ "$SELECTION" = "$CANCEL" ]; then 
        exit
fi
if [ -z "$SELECTION" ]; then 
        exit
fi
if [ "$SELECTION" = "$UP" ]; then 
        TARGET=$(dirname $TARGET)
else
    TARGET="$TARGET/$SELECTION"
fi
done
 
cd "$TARGET"
#urxvt -bg "$BGCOLOR" -fg "$FGCOLOR" -title "Download" -e "echo \"Target: $TARGET/\" && $DOWNLOADER $URL && echo \"Download complete. Press any key to close\" && read"

urxvt -sh 0 -title "Download" -e sh -c "echo \"Target: $TARGET/\" && $DOWNLOADER $URL && echo \"Download complete. Press any key to close\" && read"