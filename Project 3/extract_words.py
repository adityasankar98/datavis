import re
from collections import defaultdict

#Extract and lowercase all words and write to allwords.txt

open_file = open("brothers.txt", "r")
#open_file = open("sample.txt", "r")

str1 = ""
words_list = []

contents = open_file.readlines()

for i in range(len(contents)):
	contents[i] = contents[i].replace("'","")
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


#Ross's UniqueWords Method
unique_dict = {}
for word in allwords:
	if word in unique_dict:
		unique_dict[word] += 1
	else:
		unique_dict[word] = 1		

#Extract unique words and write to uniquewords.txt
file = open("uniquewords.txt","w+")
for key in unique_dict:
        file.write(str(key)+"\n")
file.close()

#Extract unique frequencies and write to wordfrequency.txt
'''
file = open("wordfrequency.txt","w+")
for key in unique_dict:
        file.write(str(unique_dict[key])+"\n")

file.close()
'''

word_freq = {}
for key in unique_dict:
    if unique_dict[key] in word_freq:
        word_freq[unique_dict[key]] += 1
    else:
        word_freq[unique_dict[key]] = 1

file = open("wordfrequency.txt","w+")

for key in word_freq:
    file.write(str(key)+":" + " " + str(word_freq[key]) + "\n")
'''
    for key in unique_dict:
    file.write(str(unique_dict[key])+"\n")
'''
file.close()



