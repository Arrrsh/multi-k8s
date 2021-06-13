docker build -t arrrsh/multi-client:latest -t arrrsh/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t arrrsh/multi-server:latest -t arrrsh/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t arrrsh/multi-worker:latest -t arrrsh/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push arrrsh/multi-client:latest
docker push arrrsh/multi-server:latest
docker push arrrsh/multi-worker:latest

docker push arrrsh/multi-client:$SHA
docker push arrrsh/multi-server:$SHA
docker push arrrsh/multi-worker:$SHA

kubectl apply -f k8s

kubectl set image deployments/client-deployment client=arrrsh/multi-client:$SHA
kubectl set image deployments/server-deployment server=arrrsh/multi-server:$SHA
kubectl set image deployments/worker-deployment worker=arrrsh/multi-worker:$SHA
