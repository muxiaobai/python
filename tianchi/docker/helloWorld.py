import json
list_result = []
with open('/tcdata/num_list.csv',encoding='utf-8') as f:
    sourceInLine=f.readlines()
    for line in sourceInLine:
        temp1=line.strip('\n')
        list_result.append(int(temp1))
#     document = f.read()
#     list_result=document.split("\n")# 以回车符\n分割成单独的行
#     length=len(list_result)
#   print(document)
sum_num = sum(list_result)

import heapq
max_list = heapq.nlargest(10, list_result)

result= {
	"Q1":"Hello world",
	"Q2": sum_num,
	"Q3":max_list
}
with open ("result.json","w") as f:
	json.dump(result,f)
