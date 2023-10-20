#!/bin/bash

# Define the namespace and service name
NAMESPACE="default"  # Change to your desired namespace
SERVICE_NAME="juice-shop-service"  # Change to your service name

# Get the LoadBalancer URL
LB_URL=$(kubectl get svc -n $NAMESPACE $SERVICE_NAME -o jsonpath='{.status.loadBalancer.ingress[0].hostname}')

# Update the Ingress YAML file
INGRESS_FILE="../k8s-manifests/ingress.yml"  # Replace with your Ingress YAML file name

# Check if the file exists
if [ -f "$INGRESS_FILE" ]; then
  # Use sed to replace the host field with the LoadBalancer URL
  sed -i "s/host: .*/host: $LB_URL/" $INGRESS_FILE

  echo "LoadBalancer URL updated in $INGRESS_FILE"
else
  echo "Error: $INGRESS_FILE not found"
fi
