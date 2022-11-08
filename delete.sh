docker image ls|grep none|awk '{print $3}'|xargs docker image rm
cwd=$(pwd)

cd $cwd/eureka || return
kubectl delete -f eureka-deploy.yml
minikube image remove eureka

cd $cwd/client || return
kubectl delete -f client-deploy.yml
minikube image remove helloclient

cd $cwd/server || return
kubectl delete -f server-deploy.yml
minikube image remove helloserver

cd $cwd/gateway || return
kubectl delete -f k8s/deployment.yaml
minikube image remove gateway

cd $cwd