# Container image that runs your code
FROM maven:3.6.3-jdk-8-slim

ADD entrypoint.sh /entrypoint.sh
ADD maven-settings.xml /maven-settings.xml

ENTRYPOINT ["/entrypoint.sh"]