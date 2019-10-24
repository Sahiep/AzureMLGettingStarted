### Create your Ressource Group

1.  In the [Azure Portal](https://portal.azure.com) (https://portal.azure.com), select **+ Resource groups**, then click `Create resource group`.

    ![Click on create resource group.](images/RG.png 'Create a resource group')

2. Select subscription, enter a name for the resource group and choose `northeurope` as a location.

    ![Select subscription, enter a name for the resource group and choose "northeurop" as location.](images/CreateRG.png 'Create a resource group')

### Create your Azure Machine Learning Workspace

1.  In the [Azure Portal](https://portal.azure.com) (https://portal.azure.com), select **+ Create a resource**, then type `Azure Machine Learning` into the search bar. Select `Machine Learning service workspaces` from the results.

    ![Select create a resource, type in Azure Machine Learning, then select it from the results list.](images/create-aml-resource.png 'Create a resource')

2. Select **Create** on the blade that follows.

3.  In the Create Machine Learning Workspace dialog that appears, provide the following values:

    - **Workspace Name**: AML-workspace-["personal identifier"]

    - **Subscription**: Choose your Azure subscription.

    - **Resource group**: Select the resource group which you created.

    - **Location**: Choose a region (e.g. "northeurope").

    ![Entering the previously provided value in the Create Machine Learning Workspace dialog.](images/create-aml-workspace.png 'Azure Machine Learning Workspace Creation Dialog')

4.  Select **Review + Create** and then select **Create** on the dialog that appears.


### Create your Jupyter Notebook VM

1. In the newly created Machine Learning Workspace select **+ Notebook VMs** and select **+ New*

      ![Create New Notebook VM.](images/JupyterVMs.PNG 'Azure Machine Learning Workspace Creation Dialog')
    
2. Define a **+ Name** for your VM and select **+STANDARD_D3_V2** as VM size. Select `Create`

      ![Create New Notebook VM.](images/CreateJupyterVM.PNG 'Azure Machine Learning Workspace Creation Dialog')
