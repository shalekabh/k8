# Replication Controller

Is used to make sure the that you alwasy have an instance /pod running incase of an error or the instance/pod goes down, this allows it to be highly available. It can also act as a load balancer that deploys additional pods on different nodes in the cluster.

Replication controller is supported by ```apiVersion: v1```

# Replica set

This is the newer version of the replica controller and works in almost the same way.
Replica set is supported by ```apiVersion: apps/v1```

replica set requires an additional sections which is ```selector:``` and the child ```MatchLabels:```this defines what pods fall under it and the reason is because this can manage pods that wernt part of the replica set creation, if those labels match the set in the RS creation

we also have the child section of ```MatchLabels:``` called (in this example) ```type: front-end``` which will filter the pods with the matching label of front-end incase we have hundreds of pods running. we set our labels in the creation of our pods.

# Scaling 

If we wanted to change how many replicas we wanted, one way to do it would be to chaneg the number in the replica section e.g ```replicas: 3``` to ``` replicas: 6``` the run the ```kubectl replace -f replicaset-definition.yaml```

another way to do it is to run ```kubectl scale --replicas=6 -f replicaset-definition.yaml``` -- this will not update the actual definition file

or you can use the type - name format ```kubectl scale --replicas=6 relpicaset(type) myapp-replicaset(name)``` or ```kubectl scale replicaset myapp-replicaset --replicas=6``` -- this will not update the actual definition file

If you try to launch a new pod that has the same labels as the replica set pods, the replica set will terminate automatically as it will be above the dersired number of replicas. e.g if my replicas were set at 3 and  i was to launch an nginx yaml file but it had the same labels, the replica set would terminate it because it would be above the 3 limit that has been set.

we can edit the replica set using a command ```kubectl edit replicaset myapp-replicaset``` this will open a text editor. Scroll down to the replica section and you can edit it there also -- This does not change the acutal definition file

you can also use ```vi``` or the ```vim``` or ```notepad```(on windows) to change the file configuration.

