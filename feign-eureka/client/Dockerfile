FROM openjdk:8-jdk-alpine
LABEL author="liubin"
LABEL email="everyhook@live.cn"
ADD target/*.jar /opt/app.jar
WORKDIR /opt/
RUN echo "Asia/Shanghai" > /etc/timezone
EXPOSE 8080
ENTRYPOINT java ${JVM_OPTS} -jar /opt/app.jar