#!/bin/bash
. /etc/profile
cd "${0%/*}"

echo "clean resources..."
rm -rf ./admin

echo "copy resources..."
cp -rf /home/ubuntu/build/. ./

echo "kill application..."
jps -l |grep admin |cut -d' ' -f1 |xargs kill -9 > /dev/null 2>&1

echo "start application..."
nohup java -jar ruoyi-admin.jar > ruoyi-admin.log 2>&1 &