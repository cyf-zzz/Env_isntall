#!/bin/bash

# 请将下载的jdk-xxx-linux-xxx.tar.gz包与此脚本放置同一目录
# 授予此脚本可执行权限（chmod +x install_jdk.sh）
# 执行此脚本（./install_jdk.sh）
# 退出后再执行（source /etc/profile）使环境变量生效

# 必须保证jvmpath路径不存在
jvmpath=/usr/local/jdk

# 如果jvmpath路径存在，退出脚本
if [ -d "$jvmpath" ]; then
    echo "jdk path already exists, please check it"
    exit 1
fi

# 不存在则创建jvmpath路径
mkdir -p $jvmpath

# 获取jdk-xxx-linux-xxx.tar.gz包名
jdkfile=`ls | grep jdk-xxx-linux-xxx.tar.gz`

# jdkfile不存在，退出脚本
if [ ! -f "$jdkfile" ]; then
    # 删除jvmpath路径
    rm -rf $jvmpath
    echo "jdk file not found, please check it"
    exit 1
fi

# 解压jdk-xxx-linux-xxx.tar.gz包到jvmpath路径
tar -zxvf $jdkfile -C $jvmpath
jdkdirname=`ls $jvmpath | grep jdk`

echo "jdk dirname is $jdkdirname"

# 设置环境变量
echo "export JAVA_HOME=$jvmpath/$jdkdirname" >> /etc/profile
echo "export JRE_HOME=$jvmpath/$jdkdirname/jre" >> /etc/profile
echo "export CLASSPATH=.:$jvmpath/$jdkdirname/lib:$jvmpath/$jdkdirname/jre/lib" >> /etc/profile
echo "export PATH=$PATH:$jvmpath/$jdkdirname/bin:$jvmpath/$jdkdirname/jre/bin" >> /etc/profile

# 使环境变量生效
source /etc/profile

# 查看java版本
java -version

# 查看java环境变量
echo $JAVA_HOME

# 退出脚本
exit 0