## 1 update local upstream
git remote rm upstream
#添加
git remote add upstream https://github.com/Mrpai/config
git fetch upstream
#查看
git remote -v

#取消
git branch --unset-upstream

# checkout tags
git checkout tags/2.9.6

# checkout branch
git checkout upstream/release-acala-2.9.6

# push to remote/origin
git push origin HEAD:refs/heads/release-acala-2.9.6
git push upstream test/weight-time

# set config
git config user.email "1164934857@qq.com"
git config user.name "MrPai"

git config --global user.email "1164934857@qq.com"
git config --global user.name "MrPai"

# list config
git config --list