启动 Docker
sudo systemctl enable docker
sudo systemctl start docker

##  基于docker container修改容器并生成新image
// https://www.jb51.net/article/200508.htm

### 启动容器
docker run -it image_id /bin/sh
### 拷贝宿主机文件到容器
docker cp /opt/test/file.txt mycontainer-id:/opt/testnew/
### 拷贝容器文件到宿主机
docker run -it --name polkadot parallelfinance/polkadot:v0.9.28
docker cp polkadot:/usr/local/bin/polkadot ./bin-node
### 使用修改后的容器新建镜像
docker commit -m "描述内容" -a "author name" 32555789dd00 aipaper/devinz83:v2
### 检查镜像
docker images


## 加入当前用户到docker组
### 直接使用docker命令而不是 `sudo docker`
sudo gpasswd -a $USER docker 
newgrp docker

### mac上的docker容器访问mac宿主机
docker.for.mac.localhost

### docker前台转后台
ctrl + p + q


#use config.yml, generate and run parachain network
docker-compose -f output/docker-compose.yml up -d --build

# upgrade collator node version
docker-compose -f output/docker-compose.yml up -d --build parachain-2012-0


# clean up
docker rm -f $(docker ps -aq)
docker-compose -f output/docker-compose.yml down
docker volume prune -f && docker network prune -f
docker rmi -f $(docker images | grep output | awk '{print $3}')

# grep log
docker logs -f output_parachain-2012-0_1 2>&1 | grep "xcm::convert"

# 运行
docker exec -it container /bin/bash