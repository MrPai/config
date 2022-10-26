## 升级旧版本(一个命令就够了)
npm update -g @open-web3/parachain-launch


whereis parachain-launch
# /home/ubuntu/.nvm/versions/node/v14.17.0/bin/parachain-launch
# 注意区分npm安装的global package目录与yarn安装的 global package目录
# 注意分别添加目录到环境变量中，然后source ~/.bash_profile

# 卸载
npm uninstall -g @open-web3/parachain-launch

# 通过yarn的方式安装
yarn global add @open-web3/parachain-launch


# 通过 yarn安装的在 yarn的bin目录下
# 注意与node下的bin目录区分
export PATH="$PATH:$(yarn global bin)"
yarn global dir

#use config.yml, generate and run parachain network
parachain-launch generate config.yml
docker-compose -f output/docker-compose.yml up -d --build