# 1- Maven
FROM maven:3.6.0-jdk-11-slim
# 2- Files
COPY src /student/src
COPY pom.xml /student
# 3- Run Commend mvn
RUN mvn -f /student/pom.xml clean package
RUN mvn -f /student/pom.xml install package
# 4- Java
FROM openjdk:11-jre-slim
# 5- Run App Commend
ENTRYPOINT["java","-jar","/student/target/docker-test-0.0.1-SNAPSHOT.jar"]