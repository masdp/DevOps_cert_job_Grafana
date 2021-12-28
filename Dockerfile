FROM maven:3.6.3-openjdk-8-slim AS build
WORKDIR /tmp
RUN apt-get update -y
RUN apt-get install git -y
RUN git clone https://github.com/masdp/DevOps_cert_job_Grafana.git
RUN mvn package -f /tmp/DevOps_cert_job_Grafana/App42/pom.xml

FROM tomcat:8.0-alpine AS prod
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=build /tmp/DevOps_cert_job_Grafana/App42/target/App42PaaS-Java-MySQL-Sample-0.0.1-SNAPSHOT/ /usr/local/tomcat/webapps/ROOT/
ADD Config.properties /usr/local/tomcat/ROOT/Config.properties
COPY --from=build /tmp/DevOps_cert_job_Grafana/javamelody-core-1.90.0.jar /usr/local/tomcat/webapps/ROOT/WEB-INF/lib/javamelody-core-1.90.0.jar
COPY --from=build /tmp/DevOps_cert_job_Grafana/jrobin-1.5.9.1.jar /usr/local/tomcat/webapps/ROOT/WEB-INF/lib/jrobin-1.5.9.1.jar
