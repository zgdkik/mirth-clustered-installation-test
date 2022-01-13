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

#############################
#   Download Mirth 3.10.1   #
#############################

echo "Downloading Mirth 3.10.1 ..."
wget -O /tmp/mirthstuff/mirth_3_10_1.tar.gz https://s3.amazonaws.com/downloads.mirthcorp.com/connect/3.10.1.b280/mirthconnect-3.10.1.b280-unix.tar.gz

echo "Extracting Mirth ..."
tar -xf /tmp/mirthstuff/mirth_3_10_1.tar.gz -C /tmp/mirthstuff/

echo "Renaming folder ..."
mv /tmp/mirthstuff/Mirth\ Connect/ /tmp/mirthstuff/mirthconnect_3_10_1/

echo "Extracting Clustering plugin ..."
unzip -q /home/kaur/clusteringadvanced-3.10.1.b291.zip -d /tmp/mirthstuff/mirthconnect_3_10_1/extensions/

echo "Setting server.id ..."
mkdir /tmp/mirthstuff/mirthconnect_3_10_1/appdata/
cp ${PWD}/$NODE/server.id /tmp/mirthstuff/mirthconnect_3_10_1/appdata/

echo "Setting propeties ..."
sed -i 's/database = derby/database = postgres/' /tmp/mirthstuff/mirthconnect_3_10_1/conf/mirth.properties
sed -i 's/database.url = jdbc:derby:${dir.appdata}\/mirthdb;create=true/database.url = jdbc:postgresql:\/\/172.23.2.63:5432\/mirthconnect-cluster/' /tmp/mirthstuff/mirthconnect_3_10_1/conf/mirth.properties
sed -i 's/database.username =/database.username = mirthuser/' /tmp/mirthstuff/mirthconnect_3_10_1/conf/mirth.properties
sed -i 's/database.password =/database.password = mirthuserpw/' /tmp/mirthstuff/mirthconnect_3_10_1/conf/mirth.properties
sed -i 's/keystore.storepass = .*/keystore.storepass = storepass1337/' /tmp/mirthstuff/mirthconnect_3_10_1/conf/mirth.properties
sed -i 's/keystore.keypass = .*/keystore.keypass = keypass1337/' /tmp/mirthstuff/mirthconnect_3_10_1/conf/mirth.properties

echo "Adding licence key ..."
cat /home/kaur/mirth_licence_key >> /tmp/mirthstuff/mirthconnect_3_10_1/conf/mirth.properties

echo "Mirth 3.10.1 installation complete!"

echo ""
echo "---"
echo ""

#############################
#   Download Mirth 3.12.0   #
#############################

echo "Downloading Mirth 3.12.0 ..."
wget -O /tmp/mirthstuff/mirth_3_12_0.tar.gz https://s3.amazonaws.com/downloads.mirthcorp.com/connect/3.12.0.b2650/mirthconnect-3.12.0.b2650-unix.tar.gz

echo "Extracting Mirth ..."
tar -xf /tmp/mirthstuff/mirth_3_12_0.tar.gz -C /tmp/mirthstuff/

echo "Renaming folder ..."
mv /tmp/mirthstuff/Mirth\ Connect/ /tmp/mirthstuff/mirthconnect_3_12_0/

echo "Extracting Clustering plugin ..."
unzip -q /home/kaur/clusteringadvanced-3.12.0.b2560.zip -d /tmp/mirthstuff/mirthconnect_3_12_0/extensions/

echo "Setting server.id ..."
mkdir /tmp/mirthstuff/mirthconnect_3_12_0/appdata/
cp ${PWD}/$NODE/server.id /tmp/mirthstuff/mirthconnect_3_12_0/appdata/

echo "Setting propeties ..."
sed -i 's/database = derby/database = postgres/' /tmp/mirthstuff/mirthconnect_3_12_0/conf/mirth.properties
sed -i 's/database.url = jdbc:derby:${dir.appdata}\/mirthdb;create=true/database.url = jdbc:postgresql:\/\/172.23.2.63:5432\/mirthconnect-cluster/' /tmp/mirthstuff/mirthconnect_3_12_0/conf/mirth.properties
sed -i 's/database.username =/database.username = mirthuser/' /tmp/mirthstuff/mirthconnect_3_12_0/conf/mirth.properties
sed -i 's/database.password =/database.password = mirthuserpw/' /tmp/mirthstuff/mirthconnect_3_12_0/conf/mirth.properties

echo "Adding licence key ..."
cat /home/kaur/mirth_licence_key >> /tmp/mirthstuff/mirthconnect_3_12_0/conf/mirth.properties

echo "Mirth 3.12.0 installation complete!"
