#!/bin/sh -l

echo "Hello Talend user"

# Decrypt the file
mkdir $HOME/secrets
# --batch to prevent interactive command --yes to assume "yes" for questions
gpg --quiet --batch --yes --decrypt --passphrase="${INPUT_LICENSE_PASSPHRASE}" \
--output $HOME/secrets/license $GITHUB_WORKSPACE/$LICENSE_PATH

echo "You are going to build ${INPUT_PROJECT} project"
echo "Maven Command: mvn -s /maven-settings.xml -f ${GITHUB_WORKSPACE}/${INPUT_PROJECT}/poms/pom.xml -Pcloud-publisher clean deploy $*"

export MAVEN_OPTS="-Dlicense.path=${HOME}/secrets/license -Dupdatesite.path=${INPUT_P2_URL} -Dservice.url=${INPUT_CLOUD_URL} -Dcloud.token=${INPUT_CLOUD_TOKEN} -Dcloud.publisher.screenshot=${INPUT_SCREENSHOT}"
echo $MAVEN_OPTS

sh -c "mvn -s /maven-settings.xml \
            -f ${GITHUB_WORKSPACE}/${INPUT_PROJECT}/poms/pom.xml \
            -Pcloud-publisher clean deploy $*"


# -e  -am -pl jobs/process/${INPUT_JOB_NAME}_${INPUT_JOB_VERSION}
