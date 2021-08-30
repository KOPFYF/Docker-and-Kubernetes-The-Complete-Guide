brew install minikube
minikube start --driver=hyperkit
minikube status
kubectl version
kubectl cluster-info

kubectl apply -f client-pod.yaml
kubectl apply -f client-node-pod.yaml

kubectl get pods
kubectl get services

no localhost!
minikube ip