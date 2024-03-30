# Application (Python + gRPC)

## Front:
In the folder <span style="color:blue">**front/**</span> you are going to find:
* The python file <span style="color:green">**front.py**</span> which contains the connection to the grpc server and the flask route to render a homepage.
* The .proto file that is basically defining the services.
* The requirementx.txt file that is basically showing the dependencies.
* The Dockerfile that is used to create the docker image.
* The movie_recommendations_pb2.py and movie_recommendations_pb2_grpc.py files.

## Steps:
1. Create the docker image
```bash
cd /app/front/
docker build . -t <NAME_OF_REPO>:<TAG>
```

2. Push the image to your remote repository.
```bash
cd /app/front/
docker push <NAME_OF_REPO>:<TAG>
```

## Back:

In the folder <span style="color:blue">**back/**</span> you are going to find:
* The python file <span style="color:green">**back.py**</span> which contains the grpc server and creates the server as well.
* The .proto file that is basically defining the services.
* The requirementx.txt file that is basically showing the dependencies.
* The Dockerfile that is used to create the docker image.
* The movie_recommendations_pb2.py and movie_recommendations_pb2_grpc.py files.

## Steps:
1. Create the docker image
```bash
cd /app/back/
docker build . -t <NAME_OF_REPO>:<TAG>
```

2. Push the image to your remote repository.
```bash
docker push <NAME_OF_REPO>:<TAG>
```

## Kubernetes.yaml

In this file we have:
* 1 Namespace: Creates 1 namespace called grpc.
* 2 Deployments: 
  * The front: The deployment in charge managing the frontend and getting the image manuel11coral23/front-grpc:latest
  * The back: The deployment in charge managing the backend and getting the image manuel11coral23/back-grpc:latest
* 2 Services
  * front 
  * back 
* 1 Ingress
  * That is going to create the ingress and the application load balancer (via aws-lb-ingress-controller) to receive requests.

## Improvements
* Use a secure channel for the gRPC.
