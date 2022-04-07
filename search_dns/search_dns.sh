#!/bin/bash
LIST=(
	"hdv.tw"
	"www.hdv.tw"
	"sjcorp.com.tw"
	"www.sjcorp.com.tw"
	"gdpr.sjcorp.com.tw"
	"machine-video.com"
	"www.machine-video.com"
	"enmvc.machine-video.com"
	"enquiry.com.tw"
	"form.enquiry.com.tw"
	"jerryson.cn"
	"www.jerryson.cn"
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
echo "--check Domain Name  in zoo us server--"
for item in "${LIST[@]}"; do
	if nslookup $item|grep -q "203.98.64.144\|203.98.64.145";then
		echo $item
 	fi
done
echo

echo "--check Domain Name  in zoo tw server--"
for item in "${LIST[@]}"; do
	if nslookup $item|grep -q "61.221.12.84";then
		echo $item
 	fi
done


echo "search finmish"