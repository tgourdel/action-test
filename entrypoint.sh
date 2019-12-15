#!/bin/sh -l

echo "Hello Talend user"

echo "You are going to build and publish ${INPUT_PROJECT} project to Talend Management Console"

sh -c "mvn -s /maven-settings.xml \
            -f ${GITHUB_WORKSPACE}/${INPUT_PROJECT}/poms/pom.xml \
            -Dlicense.path=n/a \
            -Dupdatesite.path=${INPUT_P2_URL} \
            -Dservice.url=${INPUT_CLOUD_URL} \
            -Dcloud.token=${INPUT_CLOUD_TOKEN} \
            -Dcloud.publisher.screenshot=${INPUT_SCREENSHOT} \
            -Pcloud-publisher clean deploy $*"

# -e  -am -pl jobs/process/${INPUT_JOB_NAME}_${INPUT_JOB_VERSION}
