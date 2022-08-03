##  基于docker container修改容器并生成新image
// https://www.jb51.net/article/200508.htm

# 启动容器
docker run -it image_id /bin/sh
# 拷贝宿主机文件到容器
docker cp /opt/test/file.txt mycontainer-id:/opt/testnew/
# 使用修改后的容器新建镜像
docker commit -m "描述内容" -a "author name" 32555789dd00 aipaper/devinz83:v2
# 检查镜像
docker images

