#!/bin/sh
sed -i \
         -e 's/#1E1E1E/rgb(0%,0%,0%)/g' \
         -e 's/#cdd3e0/rgb(100%,100%,100%)/g' \
    -e 's/#1E1E1E/rgb(50%,0%,0%)/g' \
     -e 's/#169F6F/rgb(0%,50%,0%)/g' \
     -e 's/#1E1E1E/rgb(50%,0%,50%)/g' \
     -e 's/#dbdbdb/rgb(0%,0%,50%)/g' \
	"$@"
