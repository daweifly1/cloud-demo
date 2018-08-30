
@echo off

rmdir /s/q temppp
mkdir temppp

echo satrt download...  
git clone https://github.com/daweifly1/cloud-demo.git

echo  download ok ...  
echo satrt insatll springcloud erueka1...  
cd cloud-demo

echo path %~dp0


call mvn install

cd  service-ribbon
call mvn clean package  -Ptest -Dserver.port=8861 -Dhostname=peer1 -DdefaultZone=http://peer1:8881/eureka/,http://peer2:8882/eureka/ -Dfinal.project.name=service-ribbon1

copy  %~dp0cloud-demo\service-ribbon\target\service-ribbon1-exec.jar    %~dp0temppp\service-ribbon1-exec.jar 

call mvn clean package  -Ptest -Dserver.port=8862 -Dhostname=peer2 -DdefaultZone=http://peer1:8881/eureka/,http://peer2:8882/eureka/  -Dfinal.project.name=service-ribbon2

copy  %~dp0cloud-demo\service-ribbon\target\service-ribbon2-exec.jar    %~dp0temppp\service-ribbon2-exec.jar 


echo ######################################################################################### 

cd %~dp0temppp/

echo service-ribbon2... 
start  java -jar service-ribbon1-exec.jar 
echo service-ribbon2... 
start  java -jar service-ribbon2-exec.jar 


rmdir /s/q %~dp0cloud-demo

echo ok...


