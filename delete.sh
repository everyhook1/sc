docker image ls|grep none|awk '{print $3}'|xargs docker image rm
cwd=$(pwd)

cd eureka
kubectl delete -f eureka-deploy.yml
minikube image remove eureka

cd $cwd
cd feign-eureka/client
kubectl delete -f client-deploy.yml
minikube image remove helloclient

cd $cwd
cd feign-eureka/server
kubectl delete -f server-deploy.yml
minikube image remove helloserver

cd $cwd