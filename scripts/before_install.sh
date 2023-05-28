#!/bin/bash
set -euo pipefail
MODULE_NAME="DASHBOARD"
# Retrieve the values of the variables from Parameter Store
LAMBDA_SQL_ENGINE=$(aws ssm get-parameter --name "/$MODULE_NAME/$DEPLOYMENT_GROUP_NAME/LAMBDA_SQL_ENGINE" --query 'Parameter.Value' --output text --region "us-east-1")
#LAMBDA_SQL_DATABASE=$(aws ssm get-parameter --name "/$MODULE_NAME/$DEPLOYMENT_GROUP_NAME/LAMBDA_SQL_DATABASE" --query 'Parameter.Value' --output text --region "us-east-1")
#LAMBDA_SQL_USER=$(aws ssm get-parameter --name "/$MODULE_NAME/$DEPLOYMENT_GROUP_NAME/LAMBDA_SQL_USER" --query 'Parameter.Value' --output text --region "us-east-1")
#LAMBDA_SQL_PASSWORD=$(aws ssm get-parameter --with-decryption --name "/$MODULE_NAME/$DEPLOYMENT_GROUP_NAME/LAMBDA_SQL_PASSWORD" --query 'Parameter.Value' --output text --region "us-east-1")
#LAMBDA_SQL_HOST=$(aws ssm get-parameter --name "/$MODULE_NAME/$DEPLOYMENT_GROUP_NAME/LAMBDA_SQL_HOST" --query 'Parameter.Value' --output text --region "us-east-1")
#LAMBDA_SQL_PORT=$(aws ssm get-parameter --name "/$MODULE_NAME/$DEPLOYMENT_GROUP_NAME/LAMBDA_SQL_PORT" --query 'Parameter.Value' --output text --region "us-east-1")
#LAMBDA_SECRET_KEY=$(aws ssm get-parameter --name "/$MODULE_NAME/$DEPLOYMENT_GROUP_NAME/LAMBDA_SECRET_KEY" --query 'Parameter.Value' --output text --region "us-east-1")
#LAMBDA_APP_DEBUG=$(aws ssm get-parameter --name "/$MODULE_NAME/$DEPLOYMENT_GROUP_NAME/LAMBDA_APP_DEBUG" --query 'Parameter.Value' --output text --region "us-east-1")
#LAMBDA_TIME_ZONE=$(aws ssm get-parameter --name "/$MODULE_NAME/$DEPLOYMENT_GROUP_NAME/LAMBDA_TIME_ZONE" --query 'Parameter.Value' --output text --region "us-east-1")
#CLIENT_ID=$(aws ssm get-parameter --name "/$MODULE_NAME/$DEPLOYMENT_GROUP_NAME/CLIENT_ID" --query 'Parameter.Value' --output text --region "us-east-1")
#CLIENT_SECRET=$(aws ssm get-parameter --name "/$MODULE_NAME/$DEPLOYMENT_GROUP_NAME/CLIENT_SECRET" --query 'Parameter.Value' --output text --region "us-east-1")
#INTROSPECTION_URL=$(aws ssm get-parameter --name "/$MODULE_NAME/$DEPLOYMENT_GROUP_NAME/INTROSPECTION_URL" --query 'Parameter.Value' --output text --region "us-east-1")
#SERVER_PRE=$(aws ssm get-parameter --name "/$MODULE_NAME/$DEPLOYMENT_GROUP_NAME/SERVER_PRE" --query 'Parameter.Value' --output text --region "us-east-1")
#SERVER_WEB=$(aws ssm get-parameter --name "/$MODULE_NAME/$DEPLOYMENT_GROUP_NAME/SERVER_WEB" --query 'Parameter.Value' --output text --region "us-east-1")
#SERVER_DB=$(aws ssm get-parameter --name "/$MODULE_NAME/$DEPLOYMENT_GROUP_NAME/SERVER_DB" --query 'Parameter.Value' --output text --region "us-east-1")
#PRE_EC2=$(aws ssm get-parameter --name "/$MODULE_NAME/$DEPLOYMENT_GROUP_NAME/PRE_EC2" --query 'Parameter.Value' --output text --region "us-east-1")
#DATABASE_EC2=$(aws ssm get-parameter --name "/$MODULE_NAME/$DEPLOYMENT_GROUP_NAME/DATABASE_EC2" --query 'Parameter.Value' --output text --region "us-east-1")
#ROI_EC2=$(aws ssm get-parameter --name "/$MODULE_NAME/$DEPLOYMENT_GROUP_NAME/ROI_EC2" --query 'Parameter.Value' --output text --region "us-east-1")
#KAFKA_EC2=$(aws ssm get-parameter --name "/$MODULE_NAME/$DEPLOYMENT_GROUP_NAME/KAFKA_EC2" --query 'Parameter.Value' --output text --region "us-east-1")

# Create and populate the environment file
cat << EOF > /home/ubuntu/djangocode/django-helloworld-master/.env
LAMBDA_SQL_ENGINE=$LAMBDA_SQL_ENGINE
LAMBDA_SQL_DATABASE=$DEPLOYMENT_GROUP_NAME
LAMBDA_SQL_USER=$DEPLOYMENT_GROUP_NAME
LAMBDA_SQL_PASSWORD=$DEPLOYMENT_GROUP_NAME
LAMBDA_SQL_HOST=$DEPLOYMENT_GROUP_NAME
LAMBDA_SQL_PORT=$DEPLOYMENT_GROUP_NAME
LAMBDA_SECRET_KEY=$DEPLOYMENT_GROUP_NAME
LAMBDA_APP_DEBUG=$DEPLOYMENT_GROUP_NAME
LAMBDA_TIME_ZONE=$DEPLOYMENT_GROUP_NAME
CLIENT_ID=$DEPLOYMENT_GROUP_NAME
CLIENT_SECRET=$DEPLOYMENT_GROUP_NAME
INTROSPECTION_URL=$DEPLOYMENT_GROUP_NAME
SERVER_PRE=$DEPLOYMENT_GROUP_NAME
SERVER_WEB=$DEPLOYMENT_GROUP_NAME
SERVER_DB=$DEPLOYMENT_GROUP_NAME
PRE_EC2=$DEPLOYMENT_GROUP_NAME
DATABASE_EC2=$DEPLOYMENT_GROUP_NAME
ROI_EC2=$DEPLOYMENT_GROUP_NAME
KAFKA_EC2=$DEPLOYMENT_GROUP_NAME
EOF

#change ownership of .env file file
chown ubuntu /home/ubuntu/djangocode/django-helloworld-master/.env

# Use the environment file in your deployment
