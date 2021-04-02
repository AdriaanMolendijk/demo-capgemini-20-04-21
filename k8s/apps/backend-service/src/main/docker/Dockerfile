FROM maven:3-jdk-14 as builder
COPY pom.xml .
RUN mvn dependency:resolve-plugins dependency:resolve dependency:go-offline

COPY src/ ./src/
RUN mvn package

ARG JAR_FILE=target/*.jar
RUN cp ${JAR_FILE} application.jar
RUN java -Djarmode=layertools -jar application.jar extract

FROM adoptopenjdk:14-jre-hotspot

WORKDIR application
COPY --from=builder dependencies/ ./
COPY --from=builder spring-boot-loader/ ./
COPY --from=builder snapshot-dependencies/ ./

ENV JAVA_OPTS=""
ENV SPRING_OPTS="--spring.profiles.active=prod"
ENV MEM_OPTS=""

EXPOSE 8080

COPY --from=builder application/ ./
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS $MEM_OPTS -Djava.security.egd=file:/dev/./urandom org.springframework.boot.loader.JarLauncher $SPRING_OPTS" ]
