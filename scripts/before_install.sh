#!/bin/bash

parameter_name="/myapp/mykey"

# Retrieve the parameter value
parameter_value=$(aws ssm get-parameter --name "/myapp/mykey" --query "Parameter.Value" --output text --region "us-east-1")

echo "Bipin singh"
# Use the parameter value in your script
echo "Parameter Value: $parameter_value"
export DBNAME=$parameter_value
