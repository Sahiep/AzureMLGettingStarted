#!/bin/bash

export PREFIX=contosoml
export RG_NAME=${PREFIX}_RG
export LOCATION=northeurope

export STORAGE_ACCOUNT_NAME=${PREFIX}
export ACR_NAME=${PREFIX}
export KV_NAME=${PREFIX}
export APP_INSIGHTS_NAME=${PREFIX}
export WORKSPACE_NAME=${PREFIX}

# Add the Azure CLI Extension to work with Application Insights
az extension add --name application-insights

# Add the Azure CLI Extension to work with ML Workspaces
az extension add --name azure-cli-ml

# Create a Resource Group
az group create \
    --name ${RG_NAME} \
    --location ${LOCATION} \
    --output none

# Create a Storage Account
az storage account create \
    --name "${STORAGE_ACCOUNT_NAME}" \
    --resource-group "${RG_NAME}" \
    --location "${LOCATION}" \
    --sku "Standard_LRS" \
    --encryption-service "blob" \
    --encryption-service "file" \
    --https-only "true" \
    --default-action "Allow" \
    --bypass "None" \
    --kind "StorageV2" \
    --output none

STORAGE_ACCOUNT_ID=$(az storage account list --query "[?name=='${STORAGE_ACCOUNT_NAME}'].{id:id}[0]" | jq -r '.id')

# Create a Container Registry
az acr create \
    --name ${ACR_NAME} \
    --resource-group "${RG_NAME}" \
    --location ${LOCATION} \
    --admin-enabled "true" \
    --sku Standard \
    --output none


ACR_ID=$(az acr list --query "[?name=='${ACR_NAME}'].{id:id}[0]" | jq -r '.id')

# Create a KeyVault
az keyvault create \
    --name ${KV_NAME} \
    --resource-group "${RG_NAME}" \
    --location ${LOCATION} \
    --output none

KV_ID=$(az keyvault list --query "[?name=='${KV_NAME}'].{id:id}[0]" | jq -r '.id')

az monitor app-insights component create \
    --app ${APP_INSIGHTS_NAME} \
    --location ${LOCATION} \
    --resource-group ${RG_NAME} \
    --output none

APP_INSIGHTS_ID=$(az monitor app-insights component show --query "[?applicationId=='${APP_INSIGHTS_NAME}'].{id:id}[0]" | jq -r '.id')

# Finally create the ML Workspace referencing all components...
az ml workspace create \
    --workspace-name ${WORKSPACE_NAME} \
    --keyvault ${KV_ID} \
    --resource-group ${RG_NAME} \
    --location ${LOCATION} \
    --container-registry ${ACR_ID} \
    --application-insights ${APP_INSIGHTS_ID} \
    --storage-account ${STORAGE_ACCOUNT_ID}
