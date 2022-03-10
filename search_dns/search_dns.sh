#!/bin/bash
LIST=(
	"$@"
	)
echo "start search"
echo
echo "--echo Domain Name's IP Address--"
for item in "${LIST[@]}"; do
	echo ------- $item -------
 	nslookup $item|grep Address|tail -n 1|cut -f2 -d:
done
echo
echo "--check Domain Name  in zoo server--"
for item in "${LIST[@]}"; do
	if nslookup $item|grep -q "203.98.64.145";then
		echo $item
 	fi
done
echo
echo "search finmish"