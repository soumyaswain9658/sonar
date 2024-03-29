FROM openjdk:17
EXPOSE 8080
ADD target/netflix1.jar netflix1.jar
ENTRYPOINT ["java","-jar","/netflix1.jar"]	