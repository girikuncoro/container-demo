#!/bin/bash -e
GO=go1.10.3.linux-amd64.tar.gz
curl -O https://dl.google.com/go/$GO
tar -zxvf $GO
mv go /usr/local

cat <<EOF>> ~/.bashrc
export PATH=$PATH:/usr/local/go/bin
export GOPATH=/home/vagrant
EOF

cp /vagrant/rootfs.tar.gz /home/vagrant/
cd /home/vagrant && tar -zxvf rootfs.tar.gz
