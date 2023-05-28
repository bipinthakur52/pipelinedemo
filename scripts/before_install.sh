#!/bin/bash
MODULE_NAME = "DASHBOARD"
# Retrieve the values of the variables from Parameter Store
LAMBDA_SQL_ENGINE=$(aws ssm get-parameter --name "/$MODULE_NAME/$DEPLOYMENT_GROUP_NAME/LAMBDA_SQL_ENGINE" --query 'Parameter.Value' --output text)
LAMBDA_SQL_DATABASE=$(aws ssm get-parameter --name "/$MODULE_NAME/$DEPLOYMENT_GROUP_NAME/LAMBDA_SQL_DATABASE" --query 'Parameter.Value' --output text)
LAMBDA_SQL_USER=$(aws ssm get-parameter --name "/$MODULE_NAME/$DEPLOYMENT_GROUP_NAME/LAMBDA_SQL_USER" --query 'Parameter.Value' --output text)
LAMBDA_SQL_PASSWORD=$(aws ssm get-parameter --with-decryption --name "/$MODULE_NAME/$DEPLOYMENT_GROUP_NAME/LAMBDA_SQL_PASSWORD" --query 'Parameter.Value' --output text)
LAMBDA_SQL_HOST=$(aws ssm get-parameter --name "/$MODULE_NAME/$DEPLOYMENT_GROUP_NAME/LAMBDA_SQL_HOST" --query 'Parameter.Value' --output text)
LAMBDA_SQL_PORT=$(aws ssm get-parameter --name "/$MODULE_NAME/$DEPLOYMENT_GROUP_NAME/LAMBDA_SQL_PORT" --query 'Parameter.Value' --output text)
LAMBDA_SECRET_KEY=$(aws ssm get-parameter --name "/$MODULE_NAME/$DEPLOYMENT_GROUP_NAME/LAMBDA_SECRET_KEY" --query 'Parameter.Value' --output text)
LAMBDA_APP_DEBUG=$(aws ssm get-parameter --name "/$MODULE_NAME/$DEPLOYMENT_GROUP_NAME/LAMBDA_APP_DEBUG" --query 'Parameter.Value' --output text)
LAMBDA_TIME_ZONE=$(aws ssm get-parameter --name "/$MODULE_NAME/$DEPLOYMENT_GROUP_NAME/LAMBDA_TIME_ZONE" --query 'Parameter.Value' --output text)
CLIENT_ID=$(aws ssm get-parameter --name "/$MODULE_NAME/$DEPLOYMENT_GROUP_NAME/CLIENT_ID" --query 'Parameter.Value' --output text)
CLIENT_SECRET=$(aws ssm get-parameter --name "/$MODULE_NAME/$DEPLOYMENT_GROUP_NAME/CLIENT_SECRET" --query 'Parameter.Value' --output text)
INTROSPECTION_URL=$(aws ssm get-parameter --name "/$MODULE_NAME/$DEPLOYMENT_GROUP_NAME/INTROSPECTION_URL" --query 'Parameter.Value' --output text)
SERVER_PRE=$(aws ssm get-parameter --name "/$MODULE_NAME/$DEPLOYMENT_GROUP_NAME/SERVER_PRE" --query 'Parameter.Value' --output text)
SERVER_WEB=$(aws ssm get-parameter --name "/$MODULE_NAME/$DEPLOYMENT_GROUP_NAME/SERVER_WEB" --query 'Parameter.Value' --output text)
SERVER_DB=$(aws ssm get-parameter --name "/$MODULE_NAME/$DEPLOYMENT_GROUP_NAME/SERVER_DB" --query 'Parameter.Value' --output text)
PRE_EC2=$(aws ssm get-parameter --name "/$MODULE_NAME/$DEPLOYMENT_GROUP_NAME/PRE_EC2" --query 'Parameter.Value' --output text)
DATABASE_EC2=$(aws ssm get-parameter --name "/$MODULE_NAME/$DEPLOYMENT_GROUP_NAME/DATABASE_EC2" --query 'Parameter.Value' --output text)
ROI_EC2=$(aws ssm get-parameter --name "/$MODULE_NAME/$DEPLOYMENT_GROUP_NAME/ROI_EC2" --query 'Parameter.Value' --output text)
KAFKA_EC2=$(aws ssm get-parameter --name "/$MODULE_NAME/$DEPLOYMENT_GROUP_NAME/KAFKA_EC2" --query 'Parameter.Value' --output text)

# Create and populate the environment file
cat << EOF > env.txt
LAMBDA_SQL_ENGINE=$LAMBDA_SQL_ENGINE
LAMBDA_SQL_DATABASE=$LAMBDA_SQL_DATABASE
LAMBDA_SQL_USER=$LAMBDA_SQL_USER
LAMBDA_SQL_PASSWORD=$LAMBDA_SQL_PASSWORD
LAMBDA_SQL_HOST=$LAMBDA_SQL_HOST
LAMBDA_SQL_PORT=$LAMBDA_SQL_PORT
LAMBDA_SECRET_KEY=$LAMBDA_SECRET_KEY
LAMBDA_APP_DEBUG=$LAMBDA_APP_DEBUG
LAMBDA_TIME_ZONE=$LAMBDA_TIME_ZONE
CLIENT_ID=$CLIENT_ID
CLIENT_SECRET=$CLIENT_SECRET
INTROSPECTION_URL=$INTROSPECTION_URL
SERVER_PRE=$SERVER_PRE
SERVER_WEB=$SERVER_WEB
SERVER_DB=$SERVER_DB
PRE_EC2=$PRE_EC2
DATABASE_EC2=$DATABASE_EC2
ROI_EC2=$ROI_EC2
KAFKA_EC2=$KAFKA_EC2
EOF

# Use the environment file in your deployment
