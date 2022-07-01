#node monitoring （prometheus+grafana）for ubuntu
## Steps:
 1. [install node_exporter]
 2. [install prometheus and grafana]
 3. [config granfana]
## 1. install node_exporter
*It needs to be installed on the host where HyperNode or Klaytn is located！*

Run the following command: 
```bash
wget https://github.com/andotsio/node_monitor/raw/main/node_exporter-install.sh
sh node_exporter-install.sh
```

Check if the installation was successful Run the following command: 
```bash
 curl http://localhost:9100/metrics
```

install  node_exporter verbose log:

![1656657384528](https://user-images.githubusercontent.com/100293899/176838630-44b4766d-3ea0-4272-aae0-cec914fd5e8c.png)


## 2.install prometheus and grafana
- Ubuntu 20.04 (tested on this OS)
- CPU: 4 cores
- RAM: 8GB
- 500G SSD drive

### install prometheus Run the following command: 
```bash
wget https://github.com/andotsio/node_monitor/raw/main/prometheus-install.sh
sh prometheus-install.sh
```

install  prometheus verbose log:

![1656659758571](https://user-images.githubusercontent.com/100293899/176844172-2aac2e7c-2bf8-43d7-a18a-f8fdac4eac2f.png)


### install grafana Run the following command: 
```bash
wget https://github.com/andotsio/node_monitor/raw/main/grafana-install.sh
sh grafana-install.sh
```

install  grafana verbose log:

![1656659884804](https://user-images.githubusercontent.com/100293899/176844439-482bcfc5-d1c8-4e15-b190-f0442d1387e6.png)


## 3.config granfana
a. Access in browser： http://ip:3000/login

The default username and password are admin/admin. After successful login, you need to change the password by yourself.

![1656584172576](https://user-images.githubusercontent.com/100293899/176653358-2beed001-18bf-4f09-9617-04cf09bf405b.png)

b. add prometheus datasource

![1656584339434](https://user-images.githubusercontent.com/100293899/176654112-1792ef7d-dc02-4bcb-816d-b652f7c5490e.png)
![1656584505054](https://user-images.githubusercontent.com/100293899/176654480-ebd0c935-7338-40cd-b082-48503bf58fd4.png)

c.Import via panel 1860 (for more dashboards visit https://grafana.com/grafana/dashboards/)
![1656584856745](https://user-images.githubusercontent.com/100293899/176655946-5c6211df-eb48-4b76-9cbb-23ab899e37b8.png)
![1656584933199](https://user-images.githubusercontent.com/100293899/176655976-b60fd312-0c4d-4e36-9bf9-38a444d94e73.png)
![1656585086134](https://user-images.githubusercontent.com/100293899/176656293-4d1c1527-3570-4f3c-b03e-d2c9997d0ff1.png)

d.After the configuration is successful, the effect is as follows
![1656585280959](https://user-images.githubusercontent.com/100293899/176656874-3f75ca94-5a26-420e-93f7-c55d17022286.png)
