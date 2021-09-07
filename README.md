# Spring Boot no Docker conectando-se ao contêiner do MySQL Docker

1. Use a imagem MySQL publicada por Docker Hub (https://hub.docker.com/_/mysql/)
Comando para executar o contêiner mysq
`docker run --name mysql-standalone -e MYSQL_ROOT_PASSWORD=password -e MYSQL_DATABASE=test -e MYSQL_USER=sa -e MYSQL_PASSWORD=password -d mysql:5.6`

2. No aplicativo Spring Boot, use o mesmo nome de contêiner da instância mysql em application.properties
`spring.datasource.url = jdbc:mysql://mysql-standalone:3306/test`

3. Criar um `Dockerfile` para criar uma imagem docker a partir do aplicativo Spring Boot
`DE openjdk:8
ADD target/users-mysql.jar users-mysql.jar
EXPOSE 8086
ENTRYPOINT ["java", "-jar", "users-mysql.jar"]`

4. Usando o Dockerfile, crie a imagem do Docker.
Do diretório do Dockerfile - `docker build . -t users-mysql`

5.Execute a imagem Docker (users-mysql) criado em #4.
`docker build . -t users-mysql`

## Comandos úteis do Docker
- `docker images`
- `docker container ls`
- `docker logs <container_name>`
- `docker container rm <container_name`
- `docker image rm <image_name`
