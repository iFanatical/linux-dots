#!/bin/sh
sed -i \
         -e 's/rgb(0%,0%,0%)/#1c1f24/g' \
         -e 's/rgb(100%,100%,100%)/#efefef/g' \
    -e 's/rgb(50%,0%,0%)/#1c1f24/g' \
     -e 's/rgb(0%,50%,0%)/#51afef/g' \
 -e 's/rgb(0%,50.196078%,0%)/#51afef/g' \
     -e 's/rgb(50%,0%,50%)/#1c1f24/g' \
 -e 's/rgb(50.196078%,0%,50.196078%)/#1c1f24/g' \
     -e 's/rgb(0%,0%,50%)/#efefef/g' \
	"$@"