#FROM openjdk:17
#EXPOSE 8080
#ADD target/springboot-images-new.jar springboot-images-new.jar
#ENTRYPOINT ["java", "-jar", "/springboot-images-new.jar"]
FROM openjdk:8-jdk-alpine as build
COPY . /usr/app
WORKDIR /usr/app
RUN chmod +x mvnw && ./mvnw clean package

FROM openjdk:8-jre-alpine
COPY --from=build /usr/app/target/*.jar springboot-images-new.jar
EXPOSE 8080

ENTRYPOINT ["java","-jar","springboot-images-new.jar"]