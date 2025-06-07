########################
# 1st stage: Maven build
########################
ARG MAVEN_VERSION
FROM maven:${MAVEN_VERSION} AS builder
WORKDIR /workspace

# 依存解決キャッシュを効かせるために先に pom.xml をコピー
COPY firstapp/pom.xml firstapp/
RUN mvn -f firstapp/pom.xml -q dependency:go-offline

# ソースをコピーして WAR を作成
COPY firstapp/src firstapp/src
RUN mvn -f firstapp/pom.xml -q clean package -DskipTests

########################
# 2nd stage: Tomcat
########################
FROM tomcat:9.0-jdk21-temurin
COPY --from=builder /workspace/firstapp/target/firstapp.war \
                    /usr/local/tomcat/webapps/ROOT.war
