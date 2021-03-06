
@echo off

rmdir /s/q temp
mkdir temp

echo satrt download...  
git clone https://github.com/daweifly1/cloud-demo.git

echo  download ok ...  
echo satrt insatll springcloud erueka1...  
cd cloud-demo

echo path %~dp0


call mvn install

cd register-center-web
call mvn clean package  -Ptest -Dserver.port=8881 -Dhostname=peer1 -DdefaultZone=http://peer2:8882,http://peer3:8883 -Dfinal.project.name=registration-center-web

copy  %~dp0cloud-demo\register-center-web\target\registration-center-web-exec.jar    %~dp0temp\registration-center-web-exec.jar 

call mvn clean  package  -Ptest -Dserver.port=8882 -Dhostname=peer2 -DdefaultZone=http://peer1:8881,http://peer3:8883 -Dfinal.project.name=registration-center-web1

copy  %~dp0cloud-demo\register-center-web\target\registration-center-web1-exec.jar    %~dp0temp\registration-center-web1-exec.jar 

call mvn clean  package  -Ptest -Dserver.port=8883 -Dhostname=peer3 -DdefaultZone=http://peer1:8881,http://peer2:8882 -Dfinal.project.name=registration-center-web2

copy  %~dp0cloud-demo\register-center-web\target\registration-center-web2-exec.jar    %~dp0temp\registration-center-web2-exec.jar 


echo ######################################################################################### 

cd %~dp0temp/

echo satrt  erueka1... 
start  java -jar registration-center-web-exec.jar 
echo satrt  erueka2... 
start  java -jar registration-center-web1-exec.jar 

echo satrt  erueka3... 
start  java -jar registration-center-web2-exec.jar 

rmdir /s/q %~dp0cloud-demo

echo ok...


