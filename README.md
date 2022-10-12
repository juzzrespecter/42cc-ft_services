# ft_services
  
Part of 42 common-core cursus:  
  
An introduction to system administration & networks, this project consists on setting up a cluster of different services using __Kubernetes__ as a tool. Each service must run in its own container, and this container has to be built from scratch, using __Alpine Linux__ as a base image.  
  
These services are isolated in its own virtual network managed by Kubernetes, but must communicate and interact between them with no issue. Data persistence and pod liveness must also be correctly managed.  
  
A setup script is present in the repository's root, when executed will build each docker image and init minikube to build the cluster.  
  
## Project layout
In the root repository are present the setup script to get up the project, and a __srcs__ folder with every configuration file needed to build and set up all the services.  
In ths folder are a subfolder for each service with its Dockerfile (every service must be configured from scratch) and needed configuration files, and a __yamls__ folder with a .yaml file for every pod that kubernetes need to configure and set up the services.  
  
### Services
Below is a list of present services in this project:
* **Kubernetes web dashboard**
  The kubernetes cluster graphic interface, it will ask you for am access token, you can get it executing the _get_token.sh_ script present in root repository.
* **MetalLB**  
  The cluster network load balancer, more info can be found [here](https://metallb.universe.tf/).  
* **Nginx**  
  An nginx server, listening in port 80 (for 301 redirections) and port 443 (using self-made ssl certs).  
  This service can be accessed via secure shell.  
* **FTPS server**  
  An FTPS server, listening on port 21.  
* **Wordpress**  
  A Wordpress website, listening on port 5050, must be connected to the mySQL pod, a functional website with various users and an admin will be present.  
* **PhpMyAdmin**  
  A phpMyAdmin service, connected to the mySQl pod, listening to port 5000.  
* **Grafana**  
  A grafana platform, listening on port 3000, will monitor every service (a dashboard for each service will be present), and must be connected to a InfluxDB service in a different pod.  
* **Telegraf**  
  The telegraf service will collect info from all services and send it to the grafana platform.  
* **MySQL**  
  A mySQL database, must be accesed by wordpress and phpmyadmin, must be persistent.  
* **InfluxDB**  
  The DB for the Grafana service.

## Prerrequisites
This project uses __minikube__ to virtualize a Kubernetes cluster in one host:
### MacOS installation
```
brew install minikube
```
### Linux installation
```
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
```
[source: https://minikube.sigs.k8s.io/docs/start/ ]

## Usage
To get the cluster up:
```
./setup.sh
```
To remove the cluster:
```
./reset.sh
```
To manage each pod present in cluster:
```
./pod.sh [exec | logs | delete]
```
To get auth. token for Dashboard:
```
./get_token.sh
```

_> Project passed with a [100/100] mark <_
