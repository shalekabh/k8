# Kubectl Commands

kubectl run <name> --image=<name> -- runes the latest image in a pod

kubectl get pods -- This command lists all the pods in the current namespace.

kubectl get replicationcontroller --  This command will show you how many replications there are

kubectl delete replicationcontroller <replicationcontroller_name> -- this will delete the replication controller and any pods managed by it

kubectl get replicaset --  this will show you how man replications there are

kubectl delete replicaset <replicaset_name> -- This deletes the replica set and all pods associated with it.

kubectl delete pod <pod_name> -- Deletes a specified pod

kubectl describe pod <pod_name> -- Provides detailed information about a specific pod, including its status, containers, and events.

kubectl get services -- Lists all services in the current namespace.

kubectl expose deployment <deployment_name> --type=NodePort -- Creates a new service and exposes it on a NodePort.

kubectl scale deployment <deployment_name> --replicas=3 -- Scales the specified deployment to the specified number of replicas.

kubectl create deployment <deployment_name> --image=<image_name> -- Creates a new deployment with the specified image

kubectl set image deployment/<deployment_name> <container_name>=<new_image_version> -- Updates the image of a container in a deployment.

kubectl port-forward <pod_name> <local_port>:<pod_port> -- Allows you to access a pod by forwarding its port to a local machine

kubectl logs <pod_name> -- Retrieves the logs of a specific pod 

kubectl create namespace <namespace_name> --Creates a new namespace in the Kubernetes cluster.

kubectl get nodes -- Displays information about the nodes in the cluster

kubectl delete deployment <deployment_name> ---- Deletes the specified deployment

kubectl exec -it <pod_name> -- /bin/bash -- Opens an interactive shell in a specific pod.

kubectl config view --Displays the current kubeconfig file settings

kubectl apply -f <filename.yaml> -- -- Applies the configuration defined in a YAML file to the cluster

