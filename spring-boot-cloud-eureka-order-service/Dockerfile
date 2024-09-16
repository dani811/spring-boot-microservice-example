# Usar la imagen base de Maven con Java 11 para construir el proyecto
FROM maven:3.8.4-openjdk-11 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Usar una imagen de Java 11 para ejecutar la aplicación
FROM openjdk:11
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8080
CMD ["java", "-jar", "app.jar"]
