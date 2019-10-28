#!/bin/bash

export PREFIX=user03
export STORAGE_ACCOUNT_NAME=${PREFIX}23
export ACR_NAME=${PREFIX}23
export KV_NAME=${PREFIX}23
export RG_NAME=${PREFIX}_rg
export LOCATION=northeurope
export WORKSPACE_NAME=${PREFIX}ml23

# Add the Azure CLI Extension to work with ML Workspaces
az extension add --name azure-cli-ml

# Create a Resource Group
az group create \
    --name ${RG_NAME} \
	--location ${LOCATION}

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
    --output none

STORAGE_ACCOUNT_ID=$(az storage account list --query "[?name=='${STORAGE_ACCOUNT_NAME}'].{id:id}[0]" | jq -r '.id')

# Create a Container Registry
az acr create \
    --name ${ACR_NAME} \
	--resource-group "${RG_NAME}" \
	--location ${LOCATION} \
	--admin-enabled "true" \
	--sku Standard

ACR_ID=$(az acr list --query "[?name=='${ACR_NAME}'].{id:id}[0]" | jq -r '.id')

# Create a KeyVault
az keyvault create \
    --name ${KV_NAME} \
	--resource-group "${RG_NAME}" \
	--location ${LOCATION}

KV_ID=$(az keyvault list --query "[?name=='${KV_NAME}'].{id:id}[0]" | jq -r '.id')


# Finally create the ML Workspace referencing all components...
az ml workspace create \
    --workspace-name ${WORKSPACE_NAME} \
    --keyvault ${KV_ID} \
	--resource-group ${RG_NAME} \
	--location ${LOCATION} \
    --container-registry ${ACR_ID} \
	--storage-account ${STORAGE_ACCOUNT_ID}
