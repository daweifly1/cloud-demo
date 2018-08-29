
@echo off

rmdir /s/q tempp
mkdir tempp

echo satrt download...  
git clone https://github.com/daweifly1/cloud-demo.git

echo  download ok ...  
echo satrt insatll springcloud erueka1...  
cd cloud-demo

echo path %~dp0


call mvn install

cd  provider-web
call mvn clean package  -Ptest -Dserver.port=8871 -Dhostname=peer1 -DdefaultZone=http://peer1:8881,http://peer2:8882,http://peer3:8883 -Dfinal.project.name=provider-web1

copy  %~dp0cloud-demo\provider-web\target\provider-web1-exec.jar    %~dp0tempp\provider-web1-exec.jar 

call mvn clean package  -Ptest -Dserver.port=8872 -Dhostname=peer2 -DdefaultZone=http://peer1:8881,http://peer2:8882,http://peer3:8883 -Dfinal.project.name=provider-web2

copy  %~dp0cloud-demo\provider-web\target\provider-web2-exec.jar    %~dp0tempp\provider-web2-exec.jar 


echo ######################################################################################### 

cd %~dp0tempp/

echo provider-web2... 
start  java -jar provider-web1-exec.jar 
echo provider-web2... 
start  java -jar provider-web2-exec.jar 


rmdir /s/q %~dp0cloud-demo

echo ok...


