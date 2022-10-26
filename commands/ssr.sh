
# 下载脚步
wget -N --no-check-certificate https://raw.githubusercontent.com/ToyoDAdoubi/doubi/master/ssr.sh && chmod +x ssr.sh && bash ssr.sh

# python3.10版本与脚本存在兼容问题，需要降低python版本
# 或者直接选用ubuntu18版本，不要选择22版本

#如果报错，尝试如下命令解决。
ln -s /usr/bin/python3 /usr/local/bin/python

#ubuntu
ufw status
ufw allow 2333
ufw reload
ufw enable


#centos
firewall-cmd --permanent --add-port=2333/tcp
firewall-cmd --reload

ubuntu防火墙
https://blog.csdn.net/weixin_33923148/article/details/91586274
sudo ufw status
sudo ufw enable
sudo ufw disable
sudo ufw default deny
sudo ufw allow 5000/tcp
ufw reload