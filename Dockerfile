# Usamos Java 21
FROM eclipse-temurin:21-jdk-alpine

VOLUME /tmp
COPY target/*.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]