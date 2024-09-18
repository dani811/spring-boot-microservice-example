FROM maven:3.8.4-openjdk-11 AS build
WORKDIR /app
COPY **/pom.xml /app/
COPY . /app
RUN mvn clean package -DskipTests
FROM openjdk:11
WORKDIR /app
COPY --from=build target/*.jar /app/
EXPOSE 8080
CMD ["java", "-jar", "*.jar"]