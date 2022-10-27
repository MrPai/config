https://codeantenna.com/a/vpXX0Xx9vj

awk '/MB/{getline a;print $0"\n"a}' a.txt

awk '/MB/{getline a;print a}' a.txt 

# 获取匹配行的下一行
awk '/Host ali_dev/{getline a;print a}' ~/.ssh/config