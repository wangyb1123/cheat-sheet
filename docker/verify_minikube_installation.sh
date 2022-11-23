#!/bin/bash
kubectl create deployment my-nginx --image=nginx
kubectl get deployments.apps my-nginx
kubectl get pods
kubectl expose deployment my-nginx --name=my-nginx-svc --type=NodePort --port=80
kubectl get svc my-nginx-svc
minikube service my-nginx-svc --url
curl <url from command above>
