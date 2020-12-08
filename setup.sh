docker build srcs/nginx -t nginx-service
kubectl apply -f srcs/nginx-deployment.yaml
docker build srcs/mySQL -t mysql-cont
