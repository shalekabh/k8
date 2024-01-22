# Networking

IP addresses are set to pods in k8 - each pod gets its own IP - They get their IP by us setting one in the range we want- e.g we can set 10.244.0.0 and a pod will take one in that range e.g 10.244.0.2. This can change if pods are recreated. When a k8 cluster is set up it does not separte IP addresses, so 2 nodes could have different IP's but then they could assign the sam internal IP's for the pods in the cluster, so you must be careful of this.

IP addresses are set to containers in Docker

Your host machine has its own IP

Minikube has a seperate IP
