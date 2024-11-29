FROM gradle:jdk17-alpine

WORKDIR /app
COPY . /app

# Gradle 빌드
RUN gradle build -x test --no-daemon

# JAR 파일 실행
EXPOSE 8080
CMD ["java", "-jar", "/app/build/libs/*.jar"]
