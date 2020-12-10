#!/bin/bash

## --- Buenos dias :)

minikube start
eval $(minikube docker-env)

## --- MetalLB config.

https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

kubectl apply -f srcs/metallb-config.yaml

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
kubectl apply -f srcs/mysql-setup.yaml

## tbc...
