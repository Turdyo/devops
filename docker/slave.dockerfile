FROM jenkins/inbound-agent

# Install utilities for connecting to Jenkins
USER root
RUN apt-get update && apt-get install -y ssh

# Install utilities for Docker
RUN apt-get update && apt-get install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common && curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && apt-get update && apt-get install -y docker-ce docker-ce-cli containerd.io

USER jenkins
ENTRYPOINT ["jenkins-agent"]