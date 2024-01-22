# What is a Micro Services Architecture?  

![Alt text](pics/microservices.png)

### What are the use cases?

Microservices architecture is an architectural style that structures an application as a collection of small, loosely coupled, and independently deployable services. In a microservices architecture, the application is divided into a set of self-contained services that are responsible for specific business capabilities. Each service can be developed, deployed, and scaled independently of the others.

Here are some key characteristics of microservices architecture:

1.	Service Independence: Each microservice is responsible for a specific business capability and can be developed, deployed, and scaled independently. This allows teams to work on different services concurrently and deploy updates without affecting the entire application.

2.	Loose Coupling: Microservices communicate with each other through well-defined APIs, often using lightweight protocols like HTTP or messaging queues. This loose coupling allows each service to be developed and maintained independently, enabling flexibility and agility.

3.	Scalability: Microservices can be individually scaled based on demand. Services experiencing high traffic or resource requirements can be scaled up independently, ensuring efficient resource utilisation.

4.	Resilience: Failure of one microservice does not impact the entire application. Each service can be designed to be resilient and fault-tolerant, enabling the system to continue functioning even if some services are unavailable.

5.	Technology Diversity: Microservices architecture allows different services to be built using different technologies and programming languages. This flexibility enables teams to choose the best technology stack for each service, based on its specific requirements.

Use cases for microservices architecture include:

1.	Large-scale applications: Microservices architecture is well-suited for complex applications with multiple business domains, where different teams can work on different services independently.

2.	Continuous Deployment: Microservices enable continuous integration and deployment practices. Since each service can be developed and deployed independently, updates and new features can be released frequently without disrupting the entire application.

3.	Scalability: Microservices architecture allows scaling individual services based on demand, which is beneficial for applications experiencing varying levels of traffic or resource requirements.

4.	Flexibility and Innovation: Microservices architecture enables teams to innovate and experiment more freely. Different services can be developed using different technologies, allowing teams to choose the best tools for the job.

5.	Evolvability and Maintainability: With microservices, it's easier to modify and extend individual services without impacting the entire application. This promotes evolvability and maintainability, as updates can be made to specific services without requiring a full system overhaul.

It's important to note that while microservices offer several benefits, they also introduce additional complexity in terms of inter-service communication, data consistency, and deployment management. Organisations should carefully evaluate their specific requirements and consider the trade-offs before adopting microservices architecture.