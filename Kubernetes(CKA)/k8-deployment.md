# Deployment

n Kubernetes, a Deployment is a resource object that provides declarative updates to applications. It allows you to describe the desired state of your application, such as which container images to use, the number of replicas, and the way to update them. Deployments are used to manage the deployment and scaling of application containers.

in Kubernetes Deployments, you can use features like rolling updates, pause, and rollback to manage the deployment of applications.

In the ```demployment-definition.yaml``` file, its the same setup as the replica set or replica controller yaml file but you change the kind to ```kind: Deployment``` and the name to ```name: myapp-deployment``` as the child of the 1st ```metadata:```

Once you create the deployment with ```kubectl create -f deployment-definition.yaml``` it automatically creates the replicas sated in the file and you can run  ```kubectl get replicaset``` and it should come up with the replicas.

run ```kubectl get deployments``` to see your deployment

You can also make changes to your yaml file e.g updating the version of the image you are using ```nginx 1.1``` to ```nginx 1.71``` and then run the command ```kubectl apply -f <file_name.yaml>``` and this will apply any updated changes made to your yaml file.

you can also use ```kubectl set image deployment/myapp-deployment \ nginx-container=nginx:1.71``` but this will not change the .yaml file so you will have a different verion on the file than whats actually deployed.

With deployments you can also create replicas