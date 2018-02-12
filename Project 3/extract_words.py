import re
from collections import defaultdict

#Extract and lowercase all words and write to allwords.txt
open_file = open("brothers.txt", encoding = "utf8")
str1 = ""
words_list = []
contents = open_file.readlines()
for i in range(len(contents)):
    words_list.extend(contents[i].split())
words_list = [word.lower() for word in words_list]
for word in words_list:
    str1 += word+" "
allwords = re.findall("[a-z]+",str1)
open_file.close() 

file = open("allwords.txt","w+")
for word in allwords:
    file.write(word+"\n")
file.close()

#Extract unique words and write to uniquewords.txt
count = 0
str2 = ""
'''
for word in allwords:
    for i in range(len(allwords)):
        if word == allwords[i]:
            count += 1
    if count <= 1:
        str2 += word+" "
    count = 0
uniquewords = re.findall("[a-z]+",str2)
'''
uniquewords = defaultdict(int)
for word in allwords:
	if word in uniquewords:
		d[word] += 1
	
file = open("uniquewords.txt","w+")
for key in uniquewords:
	if d[key] > 0:
		file.write(word+"\n")
file.close

'''
for word in uniquewords:
    file.write(word+"\n")
file.close()
'''
#Extract word frequencies and write to wordfrequency.txt
count = 0
frequencies = []
for word in allwords:
    for i in range(len(allwords)):
        if word == allwords[i]:
            count += 1
    if count not in frequencies:
        frequencies.append(count)
    count = 0
frequencies.sort()

occurances = [0]*len(frequencies)
for word in allwords:
    for i in range(len(allwords)):
        if word == allwords[i]:
            count += 1
    for k in range(len(frequencies)):
        if frequencies[k] == count:
            occurances[k] += 1
    count = 0
    
file = open("wordfrequency.txt","w+")
for i in range(len(frequencies)):
    file.write(str(frequencies[i])+": "+str(occurances[i])+"\n")
file.close()