# cloud-demo
spring-cloud学习demo



registration-center-web注册中心
测试环境构建脚本
mvn clean package  -Ptest -Dserver.port=8882 -Dhostname=peer1 -DdefaultZone=http://peer2:8883

mvn clean package  -Ptest -Dserver.port=8883 -Dhostname=peer2 -DdefaultZone=http://peer1:8882


执行
java -jar registration-center-web-exec.jar

或者执行时候指定端口  java -jar 打包之后的SpringBoot.jar  --server.port=8000


gateway 支持数据库配置路由信息
delete from gateway_api_define;
INSERT INTO gateway_api_define (id, path, service_id, retryable, strip_prefix, url, enabled) VALUES ('api-a', '/api-a/**', null,0,1, 'service-ribbon', 1);
INSERT INTO gateway_api_define (id, path, service_id, retryable, strip_prefix, url, enabled) VALUES ('api-b', '/api-b/**', null,0,1, 'service-feign', 1);





