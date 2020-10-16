#!/bin/bash

#查询
curl 'https://www.english-corpora.org/coca/x3.asp?xx=1&w11=xi%27%27an&r=' -H 'authority: www.english-corpora.org' -H 'upgrade-insecure-requests: 1' -H 'user-agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36' -H 'sec-fetch-mode: nested-navigate' -H 'sec-fetch-user: ?1' -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3' -H 'sec-fetch-site: same-origin' -H 'referer: https://www.english-corpora.org/coca/x2.asp' -H 'accept-encoding: gzip, deflate, br' -H 'accept-language: zh-CN,zh;q=0.9' -H 'cookie: __utma=32550378.1409275916.1552527858.1552885938.1552909710.5; _ga=GA1.2.1409275916.1552527858; ASPSESSIONIDQGDDQTSS=IHBOKIHDMCIPBFMPBKMLFOCN; ii=0' --compressed >> page-load.html
#第一个
#curl "https://www.english-corpora.org/coca/x3.asp?node=^&p=1^&w11=xian^&r=" -H "authority: www.english-corpora.org" -H "upgrade-insecure-requests: 1" -H "user-agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36" -H "sec-fetch-mode: nested-navigate" -H "sec-fetch-user: ?1" -H "accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3" -H "sec-fetch-site: same-origin" -H "referer: https://www.english-corpora.org/coca/x3.asp?node=^&p=2^&w11=xian^&r=" -H "accept-encoding: gzip, deflate, br" -H "accept-language: zh-CN,zh;q=0.9" -H "cookie: __utma=32550378.1409275916.1552527858.1552885938.1552909710.5; _ga=GA1.2.1409275916.1552527858; ASPSESSIONIDQGDDQTSS=IHBOKIHDMCIPBFMPBKMLFOCN; ii=0" --compressed >>> page-1.html
#下一页
#curl 'https://www.english-corpora.org/coca/x3.asp?node=&p=2&w11=xian&r=' -H 'authority: www.english-corpora.org' -H 'upgrade-insecure-requests: 1' -H 'user-agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36' -H 'sec-fetch-mode: nested-navigate' -H 'sec-fetch-user: ?1' -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3' -H 'sec-fetch-site: same-origin' -H 'referer: https://www.english-corpora.org/coca/x3.asp?xx=1&w11=xi%27%27an&r=' -H 'accept-encoding: gzip, deflate, br' -H 'accept-language: zh-CN,zh;q=0.9' -H 'cookie: __utma=32550378.1409275916.1552527858.1552885938.1552909710.5; _ga=GA1.2.1409275916.1552527858; ASPSESSIONIDQGDDQTSS=IHBOKIHDMCIPBFMPBKMLFOCN; ii=0' --compressed >>> page-2.html


for (( i = 1; i <= 100; i++ )); do
	#statements
	#<td ID="showCell_1_1"><a target="x4" href="x4.asp?rs=3&t=5004454&ID=870825627">
	#awk '{if($0~"\"showCell_1_${i}\"") print}' page-load.html
	# cell=`awk '{if($0~"\"showCell_1_${i}\"") print }' page-load.html`
	cell=`grep "\"showCell_1_${i}\"" page-load.html`
	#echo ${cell}

	#对IFS变量 进行替换处理
	# OLD_IFS="$IFS"
	# IFS="="
	# array=(${cell})
	# IFS="$OLD_IFS"	 
	# echo ${array[0]}
	array=${cell#*&t=}
	echo ${array}
	#对IFS变量 进行替换处理
	OLD_IFS="$IFS"
	IFS="&ID="
	array2=(${array})
	IFS="$OLD_IFS"	 
	tt=${array2[0]}

	# echo ${tid}
	aaa=${array#*&ID=}
	echo $aaa

	OLD_IFS="$IFS"
	IFS="\">"
	array3=(${aaa})
	IFS="$OLD_IFS"	 
	tid=${array3[0]}
	echo $tt
	echo $tid
	#tt=5004454
	#tid=870825627
	curl 'https://www.english-corpora.org/coca/x4.asp?t=${tt}&ID=${tid}' -H 'authority: www.english-corpora.org' -H 'upgrade-insecure-requests: 1' -H 'user-agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36' -H 'sec-fetch-mode: nested-navigate' -H 'sec-fetch-user: ?1' -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3' -H 'sec-fetch-site: same-origin' -H 'referer: https://www.english-corpora.org/coca/x3.asp?xx=1&w11=xi%27%27an&r=' -H 'accept-encoding: gzip, deflate, br' -H 'accept-language: zh-CN,zh;q=0.9' -H 'cookie: __utma=32550378.1409275916.1552527858.1552885938.1552909710.5; _ga=GA1.2.1409275916.1552527858; ASPSESSIONIDQGDDQTSS=IHBOKIHDMCIPBFMPBKMLFOCN; ii=0' --compressed  >> data-${i}-${tid}.html
done











