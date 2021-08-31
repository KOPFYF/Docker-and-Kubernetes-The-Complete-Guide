kubectl describe pod client-pod

kubectl delete -f client-pod.yaml
kubectl delete -f ../12*/client-pod.yaml

# check pod ip
kubectl get pods -o wide
kubectl get deployments

# check VM ip
minikube ip

# run k8s in dev mode
kubectl apply -f client-deployment.yaml

# rebuild image
docker build -t stephengrider/multi-client .

# update image version
docker build -t stephengrider/multi-client:v2 .
docker push stephengrider/multi-client:v2
kubectl set image deployment/client-deployment client=stephengrider/multi-client:v2
kubectl get pods -o wide
minikube ip

# connect docker with VM, so to look into the VM
eval $(minikube docker-env)
docker ps # check status
docker logs container_id
docker exec -it container_id sh # get into shell
docker system prune -a # remove cache


