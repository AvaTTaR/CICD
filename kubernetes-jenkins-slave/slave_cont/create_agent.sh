#!/bin/bash
MASTER_URL=http://jenkins-server-inter:8080
MASTER_USERNAME=$JENKINS_ADMIN_ID
MASTER_PASSWORD=$JENKINS_ADMIN_PASSWORD
NODE_NAME=agent
NUM_EXECUTORS=$JENKINS_AGENT_EXECUTORS
i=1
# Download CLI jar from the master
curl ${MASTER_URL}/jnlpJars/jenkins-cli.jar -o ~/jenkins-cli.jar

while true 
do
# Create node according to parameters passed in
cat <<EOF | java -jar ~/jenkins-cli.jar -auth "${MASTER_USERNAME}:${MASTER_PASSWORD}" -s "${MASTER_URL}" create-node "${NODE_NAME}-${i}" | true 
<slave>
  <name>${NODE_NAME}-${i}</name>
  <description></description>
  <remoteFS>/home/jenkins/agent</remoteFS>
  <numExecutors>${NUM_EXECUTORS}</numExecutors>
  <mode>NORMAL</mode>
  <retentionStrategy class="hudson.slaves.RetentionStrategy\$Always"/>
  <launcher class="hudson.slaves.JNLPLauncher">
    <workDirSettings>
      <disabled>false</disabled>
      <internalDir>remoting</internalDir>
      <failIfWorkDirIsMissing>false</failIfWorkDirIsMissing>
    </workDirSettings>
  </launcher>
  <label></label>
  <nodeProperties/>
  <userId>${USER}</userId>
</slave>
EOF
# Creating the node will fail if it already exists, so |true to suppress the
# error. This probably should check if the node exists first but it should be
# possible to see any startup errors if the node doesn't attach as expected.


# Run jnlp launcher
java -jar /usr/share/jenkins/slave.jar -jnlpUrl ${MASTER_URL}/computer/${NODE_NAME}-${i}/slave-agent.jnlp -jnlpCredentials "${MASTER_USERNAME}:${MASTER_PASSWORD}"

i=$((i + 1))
done