docker image ls|grep none|awk '{print $3}'|xargs docker image remove
cwd=$(pwd)

cd eureka
# mvn clean package
docker build -t eureka .
kubectl delete -f eureka-deploy.yml
minikube image remove eureka
minikube image load eureka:latest
kubectl apply -f eureka-deploy.yml

cd $cwd
cd feign-eureka/client
# mvn clean package
docker build -t helloclient .
kubectl delete -f client-deploy.yml
minikube image remove helloclient
minikube image load helloclient:latest
kubectl apply -f client-deploy.yml

cd $cwd
cd feign-eureka/server
# mvn clean package
docker build -t helloserver .
kubectl delete -f server-deploy.yml
minikube image remove helloserver
minikube image load helloserver:latest
kubectl apply -f server-deploy.yml

cd $cwd
cd feign-eureka/gateway
# mvn clean package
docker build -t gateway .
kubectl delete -f k8s/deployment.yml
minikube image remove gateway
minikube image load gateway:latest
kubectl apply -f k8s/deployment.yml

cd $cwd