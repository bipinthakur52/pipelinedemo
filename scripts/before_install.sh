#!/bin/bash

parameter_name="/myapp/mykey"

# Retrieve the parameter value
#parameter_value=$(aws ssm get-parameter --name "$parameter_name" --query "Parameter.Value" --output text)
echo "Bipin singh"
# Use the parameter value in your script
echo "Parameter Value: $dbname"
