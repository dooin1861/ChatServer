FROM gradle:jdk17-alpine

WORKDIR /app
COPY . .

# Gradle 빌드
RUN gradle bootJar --no-daemon

# JAR 파일 이름 확인 및 복사
RUN find /app/build/libs/ -type f -name "*.jar" -exec cp {} app.jar \;

# JAR 파일 실행
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
