#!/bin/bash

set -e

# Create an account
RESOURCE_GROUP="$(whoami)-cosmodb-demo-rg"
ACCOUNT_NAME="$(whoami)-cosmodb-account" # must be lower case and < 31 characters
REGION="westus"

SUBSCRIPTION=$(az account show | jq .name)
echo "You're using subscription: ${SUBSCRIPTION}"

echo
echo "-----> Creating resource group"
az group create \
  -n ${RESOURCE_GROUP} \
  -l ${REGION} \
  -o table

echo 
echo "-----> Creating CosmoDB"
az cosmosdb create --verbose \
   --name ${ACCOUNT_NAME} \
   --resource-group ${RESOURCE_GROUP} \
   --kind GlobalDocumentDB \
   --default-consistency-level Session \
   --locations regionName=WestUS failoverPriority=0 isZoneRedundant=False \
   --locations regionName=EastUS failoverPriority=1 isZoneRedundant=False \
   --enable-multiple-write-locations true \
   --out table

echo 
echo "------> Pick one of these connection strings ..."
az cosmosdb list-connection-strings \
  --name ${ACCOUNT_NAME} \
  --resource-group ${RESOURCE_GROUP}
