#!/bin/sh

RESOURCE_GROUP=my-resource-group
AZURE_REGION=centralus
AZURE_APP_PLAN=myappplan-$RANDOM
AZURE_WEB_APP=mywebapp-$RANDOM

# Create a resource group.
az group create --name $RESOURCE_GROUP --location $AZURE_REGION
az appservice plan create --name $AZURE_APP_PLAN --resource-group $RESOURCE_GROUP --location $AZURE_REGION --sku FREE
az webapp create --name $AZURE_WEB_APP --resource-group $RESOURCE_GROUP --plan $AZURE_APP_PLAN
az webapp config appsettings set -g $RESOURCE_GROUP -n $AZURE_WEB_APP --settings PROJECT=code/web-app/ToDoApp/ToDoApp/ToDoApp.csproj
az webapp deployment source config --name $AZURE_WEB_APP --resource-group $RESOURCE_GROUP --repo-url "https://github.com/dumindukm/try-azure-devops" --branch master --manual-integration
