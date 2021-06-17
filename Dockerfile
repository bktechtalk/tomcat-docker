FROM centos:latest

MAINTAINER selfIT.lab@home.com
RUN yum install tar wget -y
RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat/
RUN wget https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.58/bin/apache-tomcat-8.5.58.tar.gz
RUN tar -xvzf apache-tomcat-8.5.58.tar.gz
RUN mv apache-tomcat-8.5.58/* .  
RUN yum -y install java
RUN java -version

RUN rm -rf apache-tomcat-8.5.58

WORKDIR /opt/tomcat/webapps
RUN curl -O -L https://github.com/AKSarav/SampleWebApp/raw/master/dist/SampleWebApp.war

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
