# mac下的gsed和linux下的sed功能一样
brew install gsed

a.txt
```
a111
a222
a333
```
gsed ":a;N;s/a\n//g;ta" a.txt
 
gsed ':a;N;s/ali_dev\nHostName.*\n/ali_dev\nHostName 18.217.2.41/g;ta' ~/.ssh/config