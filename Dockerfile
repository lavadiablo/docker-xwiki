FROM ubuntu:14.04

#Update
RUN apt-get update
RUN apt-get -y upgrade

#Pre-Installation
RUN apt-get -y --force-yes install wget
RUN apt-get -y --force-yes install tomcat7
RUN apt-get -y --force-yes install unzip
RUN wget "http://download.forge.ow2.org/xwiki/xwiki-enterprise-web-6.3.war" -P /var/lib/tomcat7/webapps
RUN unzip "/var/lib/tomcat7/webapps/xwiki-enterprise-web-6.3.war" -d /var/lib/tomcat7/webapps/xwiki
RUN rm /var/lib/tomcat7/webapps/xwiki-enterprise-web-6.3.war

RUN apt-get -y --force-yes install postgresql-client-9.3 

RUN wget http://jdbc.postgresql.org/download/postgresql-9.3-1102.jdbc4.jar -P /var/lib/tomcat7/webapps/xwiki/WEB-INF/lib/

RUN cd /usr/share/tomcat7 && ln -s /etc/tomcat7 conf
RUN ln -s /var/lib/tomcat7/webapps/ /usr/share/tomcat7/webapps


#Tomcat logs
VOLUME /usr/share/tomcat7/logs

#Config
COPY ./conf/hibernate.cfg.xml /var/lib/tomcat7/webapps/xwiki/WEB-INF/hibernate.cfg.xml
COPY ./conf/context.xml /etc/tomcat7/context.xml
RUN echo "environment.permanentDirectory=/var/local/xwiki/" >> /var/lib/tomcat7/webapps/xwiki/WEB-INF/xwiki.properties


#Start
CMD /usr/share/tomcat7/bin/catalina.sh run

#Port
EXPOSE 8080
