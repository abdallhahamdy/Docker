# 1- Maven
FROM maven:3.6.0-jdk-11-slim AS Build

# 2- Files
COPY src /student/src
COPY pom.xml /student

# 3- Run Commend mvn
RUN mvn -f /student/pom.xml clean package
RUN mvn -f /student/pom.xml install package

# 4- Java
FROM openjdk:11-jre-slim
# FROM openjdk:17-jdk-alpine


EXPOSE 8080

COPY --from=build /student/target/docker-test-0.0.1-SNAPSHOT.jar /student/docker-test.jar

ENTRYPOINT ["java","-jar","/student/docker-test.jar"]
# ENTRYPOINT["java","-jar", "/app.jar"]
