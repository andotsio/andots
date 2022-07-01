#!/bin/bash
read -p 'Enter node_exporter version name for node (ex: 1.3.1: ' NODE_VERSION
echo Configuring for node_exporter version : $NODE_VERSION
#check is install
EXISTS_FILE=/usr/local/node_exporter-linux/node_exporter
if [ -f  "$EXISTS_FILE" ]; then
	echo $EXISTS_FILE exists ...
	exit 1
else
        echo CONTINUING ...
fi
#install node_exporter
sudo wget https://github.com/prometheus/node_exporter/releases/download/v$NODE_VERSION/node_exporter-$NODE_VERSION.linux-amd64.tar.gz
sudo tar -zxvf node_exporter-$NODE_VERSION.linux-amd64.tar.gz -C /usr/local
sudo mv /usr/local/node_exporter-$NODE_VERSION.linux-amd64 /usr/local/node_exporter-linux
#add system service
sudo bash -c 'cat > /etc/systemd/system/node_exporter.service  <<EOF
[Unit]
Description=Prometheus node_exporter daemon
After=network.target

[Service]
Type=simple
User=root
Group=root
ExecStart=/usr/local/node_exporter-linux/node_exporter
Restart=on-failure
LimitNOFILE=65536

[Install]
WantedBy=multi-user.target

EOF'
sudo systemctl enable node_exporter
sudo systemctl stop node_exporter
sudo systemctl start node_exporter
