#!/bin/bash

## --- Buenos dias :)

minikube start
eval $(minikube docker-env)

kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0/aio/deploy/recommended.yaml

## http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#/login
##
## access to kubernetes web dashboard
## --- MetalLB config.

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

kubectl apply -f srcs/metallb-config.yaml
kubectl apply -f srcs/ssl-cert.yaml
## --- nginx setup

docker build ./srcs/nginx/ -t nginx
kubectl apply -f srcs/nginx-config.yaml

## --- wordpress setup

docker build ./srcs/wordpress/ -t wordpress
kubectl apply -f srcs/wordpress-config.yaml

## --- phpMyAdmin setup

docker build ./srcs/phpmyadmin/ -t phpmyadmin
kubectl apply -f srcs/phpmyadmin-config.yaml

## --- mysql setup

docker build ./srcs/mysql/ -t mysql
kubectl apply -f srcs/mysql-config.yaml

## --- vsftpd setup

docker build ./srcs/ftps-server/ -t ftps-server
kubectl apply -f srcs/ftps-server-config.yaml

## --- grafana setup

docker build ./srcs/grafana/ -t grafana
kubectl apply -f srcs/grafana-config.yaml

## --- influxDB setup

docker build ./srcs/influxdb/ -t influxdb
kubectl apply -f srcs/influxdb-config.yaml
