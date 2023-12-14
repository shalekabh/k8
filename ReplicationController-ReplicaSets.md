# Replication Controller

Is used to make sure the that you alwasy have an instance /pod running incase of an error or the instance/pod goes down, this allows it to be highly available. It can also act as a load balancer that deploys additional pods on different nodes in the cluster.

Replication controller is supported by ```apiVersion: v1```

# Replica set

This is the newer version of the replica controller and works in almost the same way.
Replica set is supported by ```apiVersion: apps/v1```

replica set requires an additional sections which is ```selector:``` and the child ```MatchLabels:```this defines what pods fall under it and the reason is because this can manage pods that wernt part of the replica set creation, if those labels match the set in the RS creation

we also have the child section of ```MatchLabels:``` called (in this example) ```type: front-end``` which will filter the pods with the matching label of front-end incase we have hundreds of pods running. we set our labels in the creation of our pods.