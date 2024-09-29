FROM maven:3.8.4-openjdk-11 AS build
WORKDIR /app
COPY pom.xml /app/
COPY . /app
RUN mvn clean package -DskipTests

FROM openjdk:11
WORKDIR /app
# Copy the JAR explicitly
COPY --from=build /app/target/*.jar /app/app.jar
EXPOSE 8080
CMD ["java", "-jar", "app.jar"]
