#!/bin/bash
read -p 'Enter grafana version name for server (ex: 9.0.2: ' GRAFANA_VERSION
echo Configuring for grafana version : $GRAFANA_VERSION
#check install
EXISTS_FILE=/usr/local/grafana/bin/grafana-server
if [ -f  "$EXISTS_FILE" ]; then
	echo $EXISTS_FILE exists ...
	exit 1
else
	echo CONTINUING ...
fi
#install grafana server
sudo wget https://dl.grafana.com/enterprise/release/grafana-enterprise-$GRAFANA_VERSION.linux-amd64.tar.gz
sudo tar -zxvf grafana-enterprise-$GRAFANA_VERSION.linux-amd64.tar.gz -C /usr/local
sudo mv /usr/local/grafana-$GRAFANA_VERSION /usr/local/grafana
#add system service
sudo bash -c 'cat > /etc/systemd/system/grafana.service  <<EOF
[Unit]
Description=grafana server daemon
After=network.target

[Service]
Type=simple
User=root
Group=root
ExecStart=/usr/local/grafana/bin/grafana-server -homepath "/usr/local/grafana"
Restart=on-failure
LimitNOFILE=65536

[Install]
WantedBy=multi-user.target

EOF'
sudo systemctl enable grafana
sudo systemctl stop grafana
sudo systemctl start grafana
