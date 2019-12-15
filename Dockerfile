# Container image that runs your code
FROM maven:3.6.3-jdk-8-slim

COPY entrypoint.sh /entrypoint.sh
COPY maven-settings.xml /maven-settings.xml

RUN mkdir -p /root/.installation
RUN chmod 777 -R /root/.installation

ENTRYPOINT ["/entrypoint.sh"]