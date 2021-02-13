#!/bin/bash

kubectl delete -f ./srcs/yamls;
echo "sudo rm -rf /mnt/mysql /mnt/influxdb/ /mnt/wp/ /mnt/wp/ /mnt/ftps; logout" | minikube ssh;
eval $(minikube docker-env); docker rmi nginx wordpress ftps-server grafana influxdb phpmyadmin;
#./setup.sh
