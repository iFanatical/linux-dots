#!/bin/sh
sed -i \
         -e 's/#1c1f24/rgb(0%,0%,0%)/g' \
         -e 's/#efefef/rgb(100%,100%,100%)/g' \
    -e 's/#1c1f24/rgb(50%,0%,0%)/g' \
     -e 's/#51afef/rgb(0%,50%,0%)/g' \
     -e 's/#1c1f24/rgb(50%,0%,50%)/g' \
     -e 's/#efefef/rgb(0%,0%,50%)/g' \
	"$@"
