#!/bin/bash

echo "Prepare environment vairables:"

kubectl apply -f ./aws-secret.yaml
kubectl apply -f ./env-secret.yaml
kubectl apply -f ./env-configmap.yaml

cd ..

echo "Start deploying - Current Working Directory:"
echo "$PWD"

echo "Deploy API Feed."

cd udagram-api-feed/deploy

kubectl apply -f ./deployment.yaml
kubectl apply -f ./api-feed-hpa.yaml
kubectl apply -f ./service.yaml

cd ../..

echo "Finished."
echo "Deploy API User."

cd udagram-api-user/deploy

kubectl apply -f ./deployment.yaml
kubectl apply -f ./api-user-hpa.yaml
kubectl apply -f ./service.yaml

cd ../..

echo "Finished."
echo "Deploy API Frontend."

cd udagram-frontend/Deploy

kubectl apply -f ./deployment.yaml
kubectl apply -f ./frontend-hpa.yaml
kubectl apply -f ./service.yaml

cd ../..

echo "Finished."
echo "Deploy The Reverse Proxy."

cd udagram-reverseproxy/deploy

kubectl apply -f ./deployment.yaml
kubectl apply -f ./service.yaml

cd ../..

echo "Finished deploying process."
