#!/bin/bash

kubectl delete -f ./srcs/yamls;
echo "sudo rm -rf /mnt/mysql /mnt/influxdb/ /mnt/wp/ /mnt/wp/ /mnt/ftps; logout" | minikube ssh;
eval $(minikube docker-env); 
images=(nginx wordpress ftps-server grafana influxdb phpmyadmin)
for image in ${images[@]}; do
	docker rmi $image:services
done
#./setup.sh
