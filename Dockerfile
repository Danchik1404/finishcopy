FROM maven:3.8.5-openjdk-17 AS build

WORKDIR /app

COPY pom.xml .
COPY src ./src

RUN mvn clean package -DskipTests

FROM openjdk:17-jdk-slim

WORKDIR /app

COPY --from=build /app/target/MarketPlanet-0.0.1-SNAPSHOT.jar my-app.jar

CMD ["java", "-jar", "my-app.jar"]