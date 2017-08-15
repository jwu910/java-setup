#!/bin/sh
# This will install java versions 1.7 and 1.8

# Directory for Java install
# JAVA_DIR=/opt/java
JAVA_DIR=/home/joshua/programming/liferay/misc/scripts/java-setup/opt/java
OPT_JAVA_DIR=current


echo "Copying files to ${JAVA_DIR}"
cp ./jdk8.tar.gz $JAVA_DIR
cp ./jdk7.tar.gz $JAVA_DIR
cd $JAVA_DIR

echo "Unpacking files..."
tar -zxvf $JAVA_DIR/jdk8.tar.gz
mv $JAVA_DIR/jdk1.8* $JAVA_DIR/jdk8
tar -zxvf $JAVA_DIR/jdk7.tar.gz
mv $JAVA_DIR/jdk1.7* $JAVA_DIR/jdk7

echo "Folders jdk7 and jdk8 created"

# Create sym link pointing to default jdk8
ln -s $JAVA_DIR/jdk8 current
echo "Created current symbolic link for default jdk8"

ln -s $JAVA_DIR/current /usr/bin/current
echo "Linked /usr/bin/current to Java Current version"

cd -

# Update alternatives
exec<alt-list

while read line
do
  update-alternatives --install /usr/bin/$line $line /opt/java/$OPT_JAVA_DIR/bin/$line 2000
done

chmod a+x ./switch-java
mv ./switch-java /usr/bin/switch-java
echo "Moved java to /usr/bin"
echo "Run command 'switch-java' to change Java versions."

# Cleanup
rm $JAVA_DIR/*.tar.gz
