YAML (YAML Ain't Markup Language or, recursively, "YAML Ain't Markup Language") is a human-readable data serialization format. It stands for "Yet Another Markup Language" or "YAML Ain't Markup Language," depending on the context. It's often used for configuration files and data exchange between languages with different data structures. YAML is commonly used in conjunction with configuration management tools and in Kubernetes for defining object configurations.

Here's a simple example of a YAML file:


# This is a YAML file example
name: John Doe
age: 30
city: London
is_student: false
grades:
  - subject: Math
    score: 95
  - subject: English
    score: 88
address:
  street: 123 Main Street
  city: Anytown
  country: UK
In this example:

The file represents a data structure with various key-value pairs.
It includes scalar values (like strings, integers, and booleans) and lists.
Nested structures are represented using indentation.

Explanation of the structure:

name, age, city, and is_student are scalar values.
grades is a list containing dictionaries with keys subject and score.
address is a dictionary with keys street, city, and country.
YAML is designed to be easy to read and write, making it a popular choice for configuration files and data representation where human readability is important.

# root level yaml code

In Kubernetes, a root-level code, or what is often referred to as the "top-level" or "kind" in a YAML file, is the Kubernetes resource specification that defines the type of object you are creating or managing in the cluster. The most common top-level objects include:

Pod:

yaml

apiVersion: v1
kind: Pod
metadata:
  name: example-pod
spec:
  containers:
  - name: nginx
    image: nginx


Service:


apiVersion: v1
kind: Service
metadata:
  name: example-service
spec:
  selector:
    app: example-app
  ports:
  - protocol: TCP
    port: 80
    targetPort: 8080

Deployment:

yaml

apiVersion: apps/v1
kind: Deployment
metadata:
  name: example-deployment
spec:
  replicas: 3
  selector:
    matchLabels:
      app: example-app
  template:
    metadata:
      labels:
        app: example-app
    spec:
      containers:
      - name: nginx
        image: nginx
In the examples above:

apiVersion specifies the API version of the Kubernetes object.
kind specifies the type of the Kubernetes object (Pod, Service, Deployment, etc.).
metadata includes information like the name of the object.
spec contains the specifications or configuration for the object.
The root-level code is essential because it indicates to Kubernetes what type of resource or object it should create or manage. It helps the Kubernetes API server understand how to interpret the rest of the YAML file. Different kinds of resources have different fields in their specifications, so specifying the kind is crucial for correct interpretation and handling by the Kubernetes cluster.

### Using vim to create yam files.

We can create yaml files using vim - in this case I did :

```vim pod.yaml```

```
apiVersion: v1
kind: Pod
metadata:
  name: nginx
  labels:
    app: nginx
    tier: frontend
spec:
  containers:
   - name: nginx
     image: nginx

```

Then, i used the kubectl create/apply command and refered to my yaml file: ```kubectl create -f pod.yaml```

this creates the pod and you can check it with ```kubectl get pods```


