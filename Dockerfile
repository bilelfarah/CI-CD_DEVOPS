FROM openjdk:8-jdk-alpine
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} tpAchatProject-1.0.jar
ENTRYPOINT ["java","-jar","tpAchatProject-1.0.jar"]
EXPOSE 8089