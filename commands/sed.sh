https://blog.csdn.net/u011729865/article/details/71773840
https://kodango.com/sed-and-awk-notes-part-4
https://kodango.com/sed-and-awk-notes-part-5

# sed基础命令都是面向行的

# mac下，文本替换
sed -i '' 's/HostName.*$/HostName 18.217.2.40/g' ~/.ssh/config

# linux下，可多行操作，
# 目前 mac下以下命令无效
a.txt
```
a111
a222
a333
```
sed ":a;N;s/\n//g;ta" a.txt

#获取匹配行的行号
sed -n  '/Host ali_dev/=' .ssh/config

# sed -i "" "s/HostName.*$/HostName $ip/g" $HOME/.ssh/config
# line=$(sed -n  '/Host ali_dev/=' $HOME/.ssh/config)
# line=$(($line+1))