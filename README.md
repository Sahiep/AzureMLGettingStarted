# AzureMLGettingStarted

Azure Machine Learning (Azure ML) is a cloud-based service that enables data scientists, AI software engineers, and others to collaborate on machine learning projects and manage data science workloads at scale. 

These hands-on exercises are designed to introduce the core concepts and components of an Azure ML solution. 

In a separate browser tab, sign into your Azure subscription and view your portal at https://portal.azure.com. As you proceed through the tasks below, you'll toggle between this notebook and the portal to visually confirm that the code you've run here has had the intended results in your Azure subscription.

![Azure ML Workflow](https://github.com/Sahiep/AzureMLGettingStarted/blob/master/images/pipeline-flow.png)

In this Hands-on Session we will: 

1) Run our first experiment
2) Load data 
3) Train a machine learning model
4) Deploy a machine learning model as web service

Prerequisits:
1) Machine Learning Workspace ([Here](https://github.com/Sahiep/AML-Setup.git) you can find a simple Bash Script to setup your ML Workspace)

Additional Notebooks are covering:
1) Azure ML Pipeline
2) Automated Machine Learning

## Pip install AzureML SDK
```sh
pip install azureml-sdk
```
Read more detailed instructions on [how to set up your environment](./NBSETUP.md) using Azure Notebook service, your own Jupyter notebook server, or Docker.

---------------------------------------
## Documentation

 * Quickstarts, end-to-end tutorials, and how-tos on the [official documentation site for Azure Machine Learning service](https://docs.microsoft.com/en-us/azure/machine-learning/service/).
 * [Python SDK reference](https://docs.microsoft.com/en-us/python/api/overview/azure/ml/intro?view=azure-ml-py)
 
 ---

## Community Repository 
This samples are a subset of this [community repository](https://github.com/microsoft/MLOps/tree/master/examples) where you find useful end-to-end sample notebooks. 
