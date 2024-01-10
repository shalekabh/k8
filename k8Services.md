# Services

k8 Services allow us to communicate with components inside and outside of the application, this helps us connect applications together with other applications or users. e.g enabling the frontend services to accessed by end users and the frontend pods to communicate with the backend pods, and helps in establishing connectivity to an external database source. They enable loose coupling with our microservices applications.

Another use case of a serivice-- e.g we have a web application pod running on a k8 node and they both have their own IP and internal IP. My laptop has a seperate IP and i cant access the web application from my laptops IP. One way to access this web application is to SSh into the node and use a ```curl http://<pod_internal_ip>``` command to access it or use the internal IP in the node web browser to access it. This isnt Ideal, so what we would want to do is use a service (A service is an object like a pod or a replicaset or deployments) that is listening on a specific port on the node and then it forwards request from the node to the pod with the web application. This way we can use the ```curl http://<node_ip:nodeport>``` command to access the web app straight from our laptops. This type of service is known as a node port service. The service automatically spans across all nodes in a cluster

# Service types

### Node port

Where the service makes an internal pod accesible on a port on the node. The service has a port i.e port 80 that connects to the targer port on the pod also port 80. The service also has its own IP address known as the cluset IP of the service. The port on the node itself used to access the server is called the node port i.e 30008. Node port can only be in a valid range of 30000-32767. To create the service we use a service-definition.yaml file. The root parameters of the yaml file are the same (services use v1 api and not apps/v1). The main differece is the ```spec:``` section, its child parameters are ```type:``` which specifices which type of service it is and in this case its ```type:NodePort```(case sensitive) and we have the the ```ports:``` parameter, which has its own child parameters (as a list) to specify the target port on the pod - ```targetPort: 80```(case sensitive), the port on the service ```port:80```, and the node port ```nodePort:30008```(case sensitive). We also need to add a ```selector:``` parameter which is a sibling of the ```type:``` and ```ports:``` parameters, we use this parameter to specify which pod the service is using and we do this by adding the pod child parameters of ```labels:``` which is ```app: myapp``` and ```type:front-end``` to our service definition file. The service can act as a load balancer to distribute services over the pods.

### cluster IP

the service creates a virtual ip on the cluster to enable communications between different services, like a set of frontend servers to the back end servers. This is useful because none of the IPs on the pods are static, meaning that if one pod goes down and is replaced with a different pod, with a different IP, it doesn't affect communication between the services, because our created service will allow communication through its virtual IP. You can set cluste IPs from your front end and another one for your backend and another one for you key value storage and so on... The set up is almost the same as the ```service-definition.yaml``` file for our ```nodePort``` except for we change the ```type:``` to ```type:ClusterIP``` (case sensitive). The child parameters of ```selector``` are our pod labels child parameters ```app: myapp``` and ```type:back-end``` 

### Load balancer

Where it provisions load balancing for our severs for supported cloud providers.