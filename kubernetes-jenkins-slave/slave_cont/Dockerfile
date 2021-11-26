FROM jenkins/slave
USER root
RUN apt update && apt upgrade -y && \
    apt install -y sudo apt-transport-https gnupg2 software-properties-common && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && \
    apt update && \
    apt -y install docker-ce docker-ce-cli containerd.io && \
    usermod -aG docker jenkins
COPY ./create_agent.sh /home/jenkins/create_agent.sh
RUN  chmod 777 /home/jenkins/create_agent.sh
USER jenkins
CMD ["/bin/sh","/home/jenkins/create_agent.sh"]
