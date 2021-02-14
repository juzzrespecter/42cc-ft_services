#!/bin/bash

## --- Buenos dias :)
minikube start
eval $(minikube docker-env)

# --- build docker images
dockerfiles=( "nginx" "phpmyadmin" "mysql" "grafana" "influxdb" "ftps-server" "wordpress" "telegraf")

for name in ${dockerfiles[@]}; do
	docker build ./srcs/$name/ -t $name:latest
done

# --- deploy services in the cluster

# - dashboard
kubectl create serviceaccount dashboard-admin
kubectl create clusterrolebinding dashboard-admin  --clusterrole=cluster-admin --serviceaccount=default:dashboard-admin
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0/aio/deploy/recommended.yaml

# - load balancer
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

# - services
kubectl apply -f ./srcs/yamls/

# --- open k8s web dashboard
kubectl proxy &
open http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#/login
