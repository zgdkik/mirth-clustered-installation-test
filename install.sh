#!/bin/bash

while getopts ab flag
do
    case "${flag}" in
        a) NODE="node_a";;
        b) NODE="node_b";;
    esac
done

if test -z "$NODE"
then
      echo "NODE not set"
      echo "Exiting ..."
      exit 1
fi

mkdir /tmp/mirthstuff/

# Download Mirth 3.10.1
echo "Downloading Mirth 3.10.1 ..."
wget -O /tmp/mirthstuff/mirth_3_10_1.tar.gz https://s3.amazonaws.com/downloads.mirthcorp.com/connect/3.10.1.b280/mirthconnect-3.10.1.b280-unix.tar.gz

echo "Extracting Mirth ..."
tar -xf /tmp/mirthstuff/mirth_3_10_1.tar.gz

echo "Renaming folder ..."
mv /tmp/mirthstuff/Mirth\ Connect/ /tmp/mirthstuff/mirthconnect_3_10_1/

echo "Extracting Clustering plugin ..."
unzip -q /home/kaur/clusteringadvanced-3.10.1.b291.zip -d /tmp/mirthstuff/mirthconnect_3_10_1/extensions/

echo "Setting server.id ..."
cp ${PWD}/$NODE/server.id /tmp/mirthstuff/mirthconnect_3_10_1/appdata/

echo "Mirth 3.10.1 installation complete!"

echo "\n---\n"

# Download Mirth 3.12.0
echo "Downloading Mirth 3.12.0 ..."
wget -O /tmp/mirthstuff/mirth_3_12_0.tar.gz https://s3.amazonaws.com/downloads.mirthcorp.com/connect/3.12.0.b2650/mirthconnect-3.12.0.b2650-unix.tar.gz

echo "Extracting Mirth ..."
tar -xf /tmp/mirthstuff/mirth_3_12_0.tar.gz

echo "Renaming folder ..."
mv /tmp/mirthstuff/Mirth\ Connect/ /tmp/mirthstuff/mirthconnect_3_12_0/

echo "Extracting Clustering plugin ..."
unzip -q /home/kaur/clusteringadvanced-3.12.0.zip -d /tmp/mirthstuff/mirthconnect_3_12_0/extensions/

echo "Setting server.id ..."
cp ${PWD}/$NODE/server.id /tmp/mirthstuff/mirthconnect_3_12_0/appdata/
echo "Mirth 3.12.0 installation complete!"
