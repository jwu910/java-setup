#!/bin/sh
# This will install java versions 1.7 and 1.8

# Directory for Java install
JAVA_DIR=/opt/java

echo "Copying jdk8 to ${JAVA_DIR}"
sudo cp ./jdk8.tar.gz $JAVA_DIR/jdk8.tar.gz
sudo tar -zxvf $JAVA_DIR/jdk8.tar.gz

echo "Copying jdk7 to ${JAVA_DIR}"
sudo cp ./jdk7.tar.gz $JAVA_DIR/jdk7.tar.gz
sudo tar -zxvf $JAVA_DIR/jdk7.tar.gz
