#!/bin/bash
# init jdk env
mkdir -pv /tmp/packages
cd /tmp/packages
curl -LO http://192.168.10.45/mirrors/jdk/rpms/jdk-8u181-linux-x64.rpm
yum localinstall -y  *

cat >> /etc/profile <<EOF
export JAVA_HOME=/usr/java/jdk1.8.0_181-amd64
export PATH=$PATH:$JAVA_HOME:bin:$JAVA_HOME/jre/bin
export CLASSPATH=$JAVA_HOME/lib:JAVA_HOME/lib/tools.jar
EOF

source /etc/profile
java -version

echo "clean packages"

rm -r /tmp/packages
