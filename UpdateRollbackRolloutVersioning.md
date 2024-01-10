# Rollout and versioning

Everytime you launch a delpoyment it triggers a rollout and that means you are creating a revision or a version of your deployment so we can call the first rollout and deplyment, ```revision 1``` or ```version 1```.

When thet Deployment is updated it will trigger a new rollout which will create a new revision or version and we can call that ```revision 2``` or ```version 2```

This helps us keep track of our rollouts and enables us to roll back to a previous version if needed 

we can see the status of our rollout with the command ```kubectl rollout status deployment/myapp-deployment```

We can also see the history of our rollouts using the command ```kubectl rollout history deployment/myapp-deployment```

# Update and Deployment stratergies

There are a couple of ways to deploy your updated verisons of your instances - 

You can delete all the individual pods at once and then realaunch them in their udated states - the application may have downtime (recreate stratergy)

the second way is to delete one old pod and and the launch the updated pod, then you do this for all the pods one by one - this way there is no down time. (rolling update)

Doing this, the deployment will automatically create a new replica set to launch the updated version (replicaset-1 is the old)(replicaset-2 is new) run ```kubectl get replicaset``` to see it in action

if you dont specify the deployment stratergy in the deployment - rolling update will be the default stratergy 

You can update you image version or anything else by using the ```kubectl edit deployment myapp-deployment``` and for example change the image from ```nginx```(if not specified its always the lateste version) to ```nginx:1.18```. then use rollout status to check its being uodated and the rollout history to see the history of the changes. -- This will not change the actual .yaml file

Another way to do it is to use ```kubectl set image deployment myapp-deployment nginx-container=nginx:1.18-perl``` -- this will not change the actual .yaml file

Use the command ```kubectle get replicaset``` to see the changes between the replica set during rolling update, and witness there is no downtime.

```kubectl describe deployments``` will give you a detailed view of what is happening also

# Rollback

Lets say you have updated and realise something is not quite right. To undo this change run ```kubectl rollout undo deployment/myapp-deployment``` this will remove the updated pods in the new replicaser (replicaset-2) and launch the previous version in the old replicast (replicaset-1)

