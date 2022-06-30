#node monitoring （prometheus+grafana）for ubuntu
## Steps:
 1. [install node_exporter](#1-install node_exporter)
 2. [install prometheus and grafana](#2-install prometheus and grafana)
 3. [config granfana](#4-config granfana)
## 1. install node_exporter
*It needs to be installed on the host where HyperNode or Klaytn is located！*

Run the following command: 
```bash
wget https://github.com/andotsio/andots/blob/main/node_exporter-install.sh
sh node_exporter-install.sh
```

Check if the installation was successful Run the following command: 
```bash
 curl http://localhost:9100/metrics
```

## 2.install prometheus and grafana
- Ubuntu 20.04 (tested on this OS)
- CPU: 4 cores
- RAM: 8GB
- 500G SSD drive

Run the following command: 
```bash
wget https://github.com/andotsio/andots/blob/main/prometheus-install.sh
sh prometheus-install.sh
wget https://github.com/andotsio/andots/blob/main/grafana-install.sh
sh grafana-install.sh
```

Check if the installation was successful Run the following command: 
```bash
 lsof -i:9090
 lost -i:3000
```

## 3.config granfana
a. Access in browser： http://ip:3000/login

The default username and password are admin/admin. After successful login, you need to change the password by yourself.

![1656584172576](https://user-images.githubusercontent.com/100293899/176653358-2beed001-18bf-4f09-9617-04cf09bf405b.png)

b. add prometheus datasource

![1656584339434](https://user-images.githubusercontent.com/100293899/176654112-1792ef7d-dc02-4bcb-816d-b652f7c5490e.png)
![1656584505054](https://user-images.githubusercontent.com/100293899/176654480-ebd0c935-7338-40cd-b082-48503bf58fd4.png)

