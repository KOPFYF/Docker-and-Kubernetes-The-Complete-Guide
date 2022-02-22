kubectl describe pod client-pod

kubectl delete -f client-pod.yaml
kubectl delete -f ../12*/client-pod.yaml

# check pod ip
kubectl get pods -o wide

# check pod status, like desired, current, up-to-date, available, age, etc
kubectl get deployments 

# check VM ip
minikube ip

# run k8s in dev mode
kubectl apply -f client-deployment.yaml

# rebuild image
docker build -t stephengrider/multi-client .

# imperatively update image version
# rebuild image by docker
docker build -t stephengrider/multi-client:v2 .
docker push stephengrider/multi-client:v2
# force to use new image by SET
# kubectl set image <object type>/<object name> <container name>=<new image to use >
kubectl set image deployment/client-deployment client=stephengrider/multi-client:v2 
kubectl get pods -o wide
minikube ip

# connect docker with VM, so to look into the VM
eval $(minikube docker-env) # temporary config the shell
docker ps # check status of all containers on local machine
minikube docker-env
# debug like docker
docker logs container_id
docker exec -it container_id sh # get into shell
docker system prune -a # remove cache


