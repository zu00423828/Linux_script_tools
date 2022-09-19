#!/bin/bash
server_list=()
LIST=(
	"$@"
	)
echo "-- server search initialize --"
while IFS='' read -r line || [[ -n "$line" ]]; do
    echo "  |-->" $line
    server_list+=($line)
done < "server.list"

echo -e "\n-- start search  --\n"
echo "  -web domain : server ip-   "
for item in "${LIST[@]}"; do
 	ip=`nslookup $item|grep Address|tail -n 1|cut -f2 -d:`
    echo "    |-->" $item : $ip
done

len=${#server_list[@]}
for ((i=0;i<$len;i+=2));do
    echo -e "\n  -check Domain Name in ${server_list[$i]} server-   "
    for item in "${LIST[@]}"; do
        if nslookup $item|grep -q ${server_list[$i+1]};then
            echo "    |-->" $item
        fi
    done
done
echo -e "\n-- search finish -- "
