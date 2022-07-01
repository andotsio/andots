#!/bin/bash
read -p 'Enter prometheus version name for server (ex: 2.36.2: ' PROMETHEUS_VERSION
echo Configuring for prometheus version : $PROMETHEUS_VERSION

#check install
EXISTS_FILE=/usr/local/prometheus-linux/prometheus
if [ -f  "$EXISTS_FILE" ]; then
        echo $EXISTS_FILE exists ...
        exit 1
else
        echo CONTINUING ...
fi

#install prometheus server
sudo wget https://github.com/prometheus/prometheus/releases/download/v$PROMETHEUS_VERSION/prometheus-$PROMETHEUS_VERSION.linux-amd64.tar.gz
sudo tar -zxvf prometheus-$PROMETHEUS_VERSION.linux-amd64.tar.gz -C /usr/local
sudo mv /usr/local/prometheus-$PROMETHEUS_VERSION.linux-amd64 /usr/local/prometheus-linux

#config prometheus.yml
read -p 'Enter node_exporters url for prometheus server (ex: 10.0.0.1:9100,10.0.0.2:9100 : ' PROMETHEUS_NODE_EXPORTERS
echo Configuring for node_exporters url : $PROMETHEUS_NODE_EXPORTERS
CONFIG=/usr/local/prometheus-linux/prometheus.yml
sudo cat >> /usr/local/prometheus-linux/prometheus.yml  <<EOF

#add hypernode job
  - job_name: "HyperNode-Klaytn"
    static_configs:
      - targets: ["$PROMETHEUS_NODE_EXPORTERS"]
EOF

#add system service
sudo bash -c 'cat > /etc/systemd/system/prometheus.service  <<EOF
[Unit]
Description=Prometheus server daemon
After=network.target

[Service]
Type=simple
User=root
Group=root
ExecStart=/usr/local/prometheus-linux/prometheus --config.file "/usr/local/prometheus-linux/prometheus.yml" --web.listen-address "0.0.0.0:9090" --web.enable-lifecycle
Restart=on-failure
LimitNOFILE=65536

[Install]
WantedBy=multi-user.target

EOF'

sudo systemctl enable prometheus
sudo systemctl stop prometheus
sudo systemctl start prometheus
