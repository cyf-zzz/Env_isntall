#!/bin/bash

# ubuntu安装docker

# 卸载旧版
apt remove docker docker-engine docker.io containerd runc
echo "docker removed"

# 更新apt包索引
apt update

# 安装依赖包
apt install ca-certificates curl gnupg lsb-release
echo "dependencies installed"

# 添加Docker官方GPG密钥
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
echo "Docker GPG key added"

# 添加Docker aliyun仓库
add-apt-repository "deb [arch=amd64] https://mirrors.aliyun.com/docker-ce/linux/ubuntu $(lsb_release -cs) stable"
echo "Docker aliyun repository added"

# 更新apt包索引
apt update

# 安装docker
apt install docker-ce docker-ce-cli containerd.io
echo "docker installed"

# 启动docker
systemctl start docker

# 安装工具
apt install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
echo "tools installed"

# 重启docker
systemctl restart docker

# 添加docker用户组
groupadd docker

# 将当前用户加入docker用户组
usermod -aG docker $USER

# 重启docker
systemctl restart docker

# 安装docker-compose
apt install docker-compose
ecoh "docker-compose installed"

# 查看docker版本
docker --version
echo "docker version checked"

# 退出脚本
exit 0