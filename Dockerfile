FROM openjdk:8
ADD target/users-mysql.jar users-mysql.jar
EXPOSE 8086
1ENTRYPOINT ["java", "-jar", "users-mysql.jar"]