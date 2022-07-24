![](https://github.com/Microsoft/MCW-Template-Cloud-Workshop/raw/main/Media/ms-cloud-workshop.png "Microsoft Cloud Workshops")

<div class="MCWHeader1">
SAP plus extend and innovate
</div>

<div class="MCWHeader2">
Hands-on lab step-by-step
</div>

<div class="MCWHeader3">
May 2022
</div>


Information in this document, including URL and other Internet Web site references, is subject to change without notice. Unless otherwise noted, the example companies, organizations, products, domain names, e-mail addresses, logos, people, places, and events depicted herein are fictitious, and no association with any real company, organization, product, domain name, e-mail address, logo, person, place or event is intended or should be inferred. Complying with all applicable copyright laws is the responsibility of the user. Without limiting the rights under copyright, no part of this document may be reproduced, stored in or introduced into a retrieval system, or transmitted in any form or by any means (electronic, mechanical, photocopying, recording, or otherwise), or for any purpose, without the express written permission of Microsoft Corporation.

Microsoft may have patents, patent applications, trademarks, copyrights, or other intellectual property rights covering subject matter in this document. Except as expressly provided in any written license agreement from Microsoft, the furnishing of this document does not give you any license to these patents, trademarks, copyrights, or other intellectual property.

The names of manufacturers, products, or URLs are provided for informational purposes only and Microsoft makes no representations and warranties, either expressed, implied, or statutory, regarding these manufacturers or the use of the products with any Microsoft technologies. The inclusion of a manufacturer or product does not imply endorsement of Microsoft of the manufacturer or product. Links may be provided to third party sites. Such sites are not under the control of Microsoft and Microsoft is not responsible for the contents of any linked site or any link contained in a linked site, or any changes or updates to such sites. Microsoft is not responsible for webcasting or any other form of transmission received from any linked site. Microsoft is providing these links to you only as a convenience, and the inclusion of any link does not imply endorsement of Microsoft of the site or the products contained therein.

© 2022 Microsoft Corporation. All rights reserved.

Microsoft and the trademarks listed at <https://www.microsoft.com/en-us/legal/intellectualproperty/Trademarks/Usage/General.aspx> are trademarks of the Microsoft group of companies. All other trademarks are property of their respective owners.

**Contents** 

<!-- TOC -->
- [SAP plus extend and innovate hands-on lab step-by-step](#sap-plus-extend-and-innovate-hands-on-lab-step-by-step)
  - [Abstract and learning objectives](#abstract-and-learning-objectives)
  - [Overview](#overview)
  - [Solution architecture](#solution-architecture)
  - [Requirements](#requirements)
  - [Before the hands-on lab](#before-the-hands-on-lab)
  - [Exercise 1: Prepare sales data in SAP](#exercise-1-prepare-sales-data-in-sap)
    - [Task 1: Populate SAP data](#task-1-populate-sap-data)
    - [Task 2: Expose SAP sales data as an OData service](#task-2-expose-sap-sales-data-as-an-odata-service)
  - [Exercise 2: Prepare payment data in Cosmos DB](#exercise-2-prepare-payment-data-in-cosmos-db)
    - [Task 1: Create linked services in Azure Synapse Analytics](#task-1-create-linked-services-in-azure-synapse-analytics)
    - [Task 2: Create source and sink integration datasets](#task-2-create-source-and-sink-integration-datasets)
    - [Task 3: Create pipeline to ingest payment data into Cosmos DB](#task-3-create-pipeline-to-ingest-payment-data-into-cosmos-db)
  - [Exercise 3: Install the self-hosted integration runtime on the SAP virtual machine](#exercise-3-install-the-self-hosted-integration-runtime-on-the-sap-virtual-machine)
    - [Task 1: Download and install the self-hosted integration runtime](#task-1-download-and-install-the-self-hosted-integration-runtime)
  - [Exercise 4: Ingest sales order information from SAP into Azure Synapse Analytics](#exercise-4-ingest-sales-order-information-from-sap-into-azure-synapse-analytics)
    - [Task 1: Create dedicated SQL pool tables to hold sales data](#task-1-create-dedicated-sql-pool-tables-to-hold-sales-data)
    - [Task 2: Create a linked service to the SAP OData endpoint for sales order header information](#task-2-create-a-linked-service-to-the-sap-odata-endpoint-for-sales-order-header-information)
    - [Task 3: Create a linked service to the SAP OData endpoint for sales order item information](#task-3-create-a-linked-service-to-the-sap-odata-endpoint-for-sales-order-item-information)
    - [Task 4: Create a linked service to the dedicated SQL pool database](#task-4-create-a-linked-service-to-the-dedicated-sql-pool-database)
    - [Task 5: Create integration datasets for sales order header and sales order items](#task-5-create-integration-datasets-for-sales-order-header-and-sales-order-items)
    - [Task 6: Create a pipeline to ingest sales data from S/4HANA](#task-6-create-a-pipeline-to-ingest-sales-data-from-s4hana)
  - [After the hands-on lab](#after-the-hands-on-lab)
    - [Task 1: Task name](#task-1-task-name)
    - [Task 2: Task name](#task-2-task-name)

<!-- /TOC -->

# SAP plus extend and innovate hands-on lab step-by-step 

## Abstract and learning objectives 

In this hands-on lab you will:

1. **Extract** (historical) Sales Orders from SAP S/4HANA using Azure Synapse Analytics pipelines

2. **Extract** historical payments from a non-SAP system, in this case Cosmos DB using Azure Synapse Analytics pipelines

3. **Visualize** the extracted Sales Orders and invoice data with Power BI

4. **Predict** incoming cash flow for Sales Orders using Azure Machine Learning

5. **Trigger actions** in SAP based on insights gained from the prediction model

## Overview

When customers buy goods, the corresponding payments are not completed immediately. Some customers will pay directly while other customers will pay at the end of their payment terms. This makes it difficult for companies to predict the incoming cashflow. In this lab, Azure tooling is used to predict the incoming cashflow. To predict cash flow, historical Sales Orders and payments data is required. Contoso Retail also needs a way to flag risky customers in the SAP system whose payments tend to arrive late.

## Solution architecture

![The solution architecture diagram displays.](media/solution_architecture.png "Solution architecture")

 Sales Order information is stored in an S/4HANA system and payments data is stored in Cosmos DB. Synapse Pipelines are used to ingest historical data from both sources. Power BI is used to visualize historical data and to create reports. Azure Machine Learning is used to create a model to predict incoming cash flow. Finally, a data alert is established to identify risky payers whose payments are typically late. This alert triggers a Power Automate process that will in-turn flag the risky payers in SAP.

## Requirements

1.  Azure Subscription with Owner role

2.  SAP CAL account

3.  Power Platform account or membership in the [Microsoft 365 Developer Program](https://developer.microsoft.com/microsoft-365/dev-program)

## Before the hands-on lab

Refer to the Before the hands-on lab setup guide manual before continuing to the lab exercises.

## Exercise 1: Prepare sales data in SAP

Duration: X minutes

This exercise demonstrates creating a sales view in SAP and exposing it as an OData service for consumption by external services.

### Task 1: Populate SAP data

1. On the SAP Cloud Appliance Library Instances page, select the **Connect** button on the **MCW SAP** row.

    ![The SAP CAL instances listing displays with the Connect button highlighted next to the MCW SAP item.](media/sapcal_instancerowconnect.png "Connect to SAP Instance")

2. On the **Connect to the instance** dialog, select the **Connect** link on the RDP row. This will download an RDP file.

    ![The Connect to the instance dialog displays with the Connect link highlighted on the RDP row.](media/sapcal_connectrdpdialog.png "Connect via RDP")

3. Open the downloaded RDP file and log into the instance using the username `Administrator` and the password used when deploying the instance.

4. From the desktop double-click the **HANA Studio** icon. This will open the Eclipse development environment.

    ![The HANA studio icon.](media/sapvm_hanastudioicon.png "HANA Studio icon")

5. In the **Select a directory as workspace** dialog, keep the default value and select **Launch**. Launching will take a few moments, please be patient.

    ![The Select a directory as workspace dialog displays with the Launch button highlighted.](media/sapvm_hanastudioworkspace_prompt.png "Select a directory as workspace dialog")

6. Change the perspective to development by expanding the **Window** menu, **Perspective**, **Open Perspective**, then selecting the **SAP HANA Development** item.

    ![HANA Studio displays with the Window, Perspective, Open Perspective menu items expanded and the SAP HANA Development item is selected.](media/sapvm_changeperspective.png "Change to development perspective")

7. In the left panel, select the **Project Explorer** tab then double-click the **S4H_100_s4h_ext_en** folder.

    ![The left panel of HANA Studio displays with the Project Explorer tab and S4H_100_s4h_ext_en folder selected.](media/sapvm_projectexplorer.png "Project Explorer")

8. When prompted for a password, enter `Welcome1` and select **OK**.

    ![A logon dialog displays with the Password text box and OK button highlighted.](media/sapvm_logins4h_ext.png "Logon dialog")

9.  Expand the **File** menu, then **New** and select the **Other** item.

    ![The File and New menus are expanded with the Other item selected.](media/sapvm_file_new_other.png "Create new file")

10. In the **Select a wizard** dialog, search for `Data Definition`. Select the **Data Definition** item beneath the **ABAP / Core Data Services** folders. Select **Next**.

    ![The Select a wizard dialog displays with Data Definition entered in the search box and the Data Definition item selected from the search results. The Next button is highlighted.](media/sapvm_newdatadefinition.png "New Data Definition")

11. Fill the **New Data Definition** dialog as follows, then select **Finish**.

    | Field | Value |
    |-------|-------|
    | Project | Retain the default **S4H_100_s4h_ext_en**. |
    | Package | Enter `$TMP`. |
    | Name | Enter `ZBD_ISalesDocument_E`. |
    | Description | Enter `ZBD_ISalesDocument_E` |

    ![The New Data Definition dialog displays populated with the preceding values.](media/sapvm_datadefinitionform.png "New Data Definition dialog")

12. Replace the code listing for **ZBD_ISALESDOCUMENT_E** with the following. Save the file.

    ```SAP
    @AbapCatalog.sqlViewName: 'ZBD_ISALESDOC_E'
    @AbapCatalog.compiler.compareFilter: true
    @AbapCatalog.preserveKey: true
    @AccessControl.authorizationCheck: #CHECK
    @EndUserText.label: 'Expanded CDS for Extraction I_Salesdocument'
    define view ZBD_I_Salesdocument_E as select from I_SalesDocument {
    key SalesDocument,
        //Category
        SDDocumentCategory,
        SalesDocumentType,
        SalesDocumentProcessingType,

        CreationDate,
        CreationTime,
        LastChangeDate,
        //@Semantics.systemDate.lastChangedAt: true
        LastChangeDateTime,

        //Organization
        SalesOrganization,
        DistributionChannel,
        OrganizationDivision,
        SalesGroup,
        SalesOffice,
        
        //SoldTo
        SoldToParty,
        _SoldToParty.CustomerName,
        _SoldToParty.Country,
        _SoldToParty.CityName,
        _SoldToParty.PostalCode,
        _SoldToParty.CustomerAccountGroup,
        
        //SalesDistrict
        SalesDistrict,
        
        CustomerGroup,
        CreditControlArea,
        PurchaseOrderByCustomer,
        
        //Pricing
        TotalNetAmount,
        TransactionCurrency,
        PricingDate,
        //RetailPromotion,
        //PriceDetnExchangeRate,
        //SalesDocumentCondition,
        
        //Billing
        BillingDocumentDate,
        BillingCompanyCode
    } where SDDocumentCategory = 'C'
    ```

13. Right-click in the whitespace of the **ZBD_ISALESDOCUMENT_E** view code window and select **Activate**.

    ![The ZBD_ISALESDOCUMENT_E view displays a context menu with the **Activate** item selected.](media/sapvm_activatezbd_isalesdocument_e.png "Activate the ZBD_ISALESDOCUMENT_E view")

14. Right-click in the whitespace of the **ZBD_ISALESDOCUMENT_E** view once more, this time select **Open With** and choose **Data Preview**. This will display the raw data of the view.

    ![The ZBD_ISALESDOCUMENT_E view displays a context menu with the Open With and Data Preview items selected.](media/sapvm_preview_menuitem_zbd_isalesdocument_e.png "Preview ZBD_ISALESDOCUMENT_E view")

    ![Raw data for the ZBD_ISALESDOCUMENT_E view displays in tabular format.](media/sapvm_previewsalesdocuments.png "Raw data preview of ZBD_ISALESDOCUMENT_E view")

15. Keep this file open for the next task.

### Task 2: Expose SAP sales data as an OData service

1. Add the following code immediately preceding the `define view` line of code of the **ZBD_ISALESDOCUMENT_E** file and save the file.

    ```ABAL
    @OData.publish: true
    ```

    ![A portion of a code window displays with the preceding line of code highlighted.](media/sapvm_addodataannotation.png "Add OData publish annotation")

2. Right-click in the whitespace of the **ZBD_ISALESDOCUMENT_E** file, and select **Activate**.

3. Minimize the Eclipse development environment, and double-click the **SAP Logon** icon located on the desktop of the virtual machine. This will open the SAP GUI application.

    ![The SAP Logon icon located on the virtual machine desktop displays.](media/sapvm_saplogonicon.png "SAP Logon icon")

4. From the top toolbar menu, select the **Logon** button.

    ![A portion of the SAP GUI toolbar displays with the Logon button highlighted.](media/sapvm_sapguilogonbutton.png "Logon")

5. Log in with the username `S4H_EXT` and the password `Welcome1`, press <kbd>Enter</kbd> to submit the form.

    ![The SAP GUI logon form displays populated with the preceding values.](media/sapvm_sapguilogonform.png "SAP GUI Logon form")

6. Once logged on, type `/n/IWFND/MAINT_SERVICE` in the toolbar menu transaction combo box and press <kbd>Enter</kbd>. This opens the **Activate and Maintain Services** window.

    ![The SAP GUI toolbar displays with the transaction combo box highlighted. The n/IFWND/MAINT_SERVICE transaction is entered in the transaction combo box.](media/sapvm_sapgui_transactioncombobox.png "SAP GUI transaction combo box")  

7. From the toolbar menu of the **Activate and Maintain Services** window, select the **Add Service** button.

    ![A portion of the Activate and Maintain Services toolbar displays with the Add service button highlighted.](media/sapvm_sapgui_maintsvcs_addservicebutton.png "Add Service")

8. Populate the **Add Selected Services** filter form as follows and press <kbd>Enter</kbd>.

    | Field | Value |
    |-------|-------|
    | System Alias | Enter `Local`. |
    | Technical Service Name | Enter `ZBD_*`. |

    ![The filter form displays populated with the preceding values.](media/sapvm_sapgui_svcfilterform.png "Filter form")

9. From the list of results, select the **ZBD_I_SALESDOCUMENT_E_CDS** item.

    ![The filter results display with the ZBD_I_SALESDOCUMENT_E_CDS item highlighted.](media/sapvm_sapgui_svcresults.png "Filter results list")

10. In the **Add Service** dialog, select the **Local Object** button located in the **Creation Information** section. This will populate the **$TMP** value, and press <kbd>Enter</kbd>. An information dialog indicating success will display, dismiss this dialog.

    ![The Add Service dialog displays with the Local Object button highlighted.](media/sapvm_sapgui_addservicedialog.png "Add Service dialog")

11. On the **Add Selected Services** screen, select the **Back** button on the toolbar menu. This will open the **Activate and Maintan Services** window once more.

    ![A portion of the Add Selected Services toolbar displays with the Back button highlighted.](media/sapvm_sapgui_backbuttonaddservices.png "Back button")

12. On the **Activate and Maintain Services** screen, select the **Filter** button from the toolbar menu.

    ![A portion of the Activate and Maintain Services toolbar menu displays with the Filter button highlighted](media/sapvm_sapgui_activateandmaintainfilterbutton.png "Filter services")

13. In the **Filter for Service Catalog** dialog, type `ZBD_*` in the **Technical Service Name** field and press <kbd>Enter</kbd>.

    ![The Filter for Service Catalog displays with ZBD_* entered in the Technical Service Name field.](media/sapvm_sapgui_svccatalogfilterdialog.png "Filter for Service Catalog dialog")

14. This action filters the **Activate and Maintain Services** screen to a single service. In the **ICF Nodes** pane, select the **SAP Gateway Client** button. If the **SAP GUI Security** dialog displays, check the **Remember My Decision** checkbox and select **Allow**.

    ![The ICF Nodes pane displays with the SAP Gateway Client button highlighted on the toolbar menu.](media/sapvm_sapgui_icfnodessapgatewayclientbutton.png "ICF Nodes SAP Gateway Client")

15. On the **SAP Gateway Client** window, select the **Execute** button from the toolbar menu. This tests the OData service. Verify in the **HTTP Response** pane that the status code indicates **200**.

    ![The SAP Gateway Client window displays with the Execute button highlighted on the toolbar menu and the HTTP Response status code indicating 200.](media/sapvm_sapgui_sapgatewayclientexecution.png "SAP Gateway Client")

16. On the **SAP Gateway Client** window, select the **EntitySets** button on the toolbar menu.

    ![The SAP Gateway window displays with the EntitySets button highlighted.](media/sapvm_sapgui_sapgatewaycliententitysetsbutton.png "EntitySets")

17. On the **EntitySets** dialog, double-click the **ZBD_I_Salesdocument_E** item.

    ![The Entity Sets dialog displays with teh ZBD_I_Salesdocument_E item highlighted.](media/sapvm_sapgui_entitysetsdialog.png "EntitySets dialog") 

18. On the **SAP Gateway Client** window, select **Execute**. This service retrieves the sales documents via the OData endpoint. Verify the HTTP Response status code value is **200**.

    ![The SAP Gateway Client window displays with the Execute button highlighted. The HTTP Response status code is 200.](media/sapvm_sapgui_entitysetodataresult.png "EntitySet OData service execution results")

19. On the **SAP Gateway Client** window, select the **Back** button to return to the **Activate and Maintain Services** screen.

20. On the **ICF Node** pane, select the **Call Browser** button. This will bring up the **Security GUI** dialog once more. Copy the URL value for future use in the lab. After recording the value, close the dialog. This URL is the service endpoint for the sales document OData service.

    ![The SAP GUI Security dialog displays with the URL value highlighted.](media/sapvm_sapgui_sapguisecuritydialog.png "Service endpoint")


## Exercise 2: Prepare payment data in Cosmos DB

Duration: X minutes

Raw payment data is available in Azure Data Lake storage. This exercise walks through loading raw payment data into Cosmos DB by leveraging Azure Synapse Analytics. First, linked services are created - these act as the connection strings to external compute resources. Next, integration datasets are created, these indicate the location and shape of the data being used in the migration. Finally, a pipeline is created to orchestrate moving data from Azure Data Lake Storage Gen2 to Cosmos DB.

### Task 1: Create linked services in Azure Synapse Analytics

1. In the [Azure Portal](https://portal.azure.com), open the **mcw_sap_plus_extend_and_innovate** resource group.

2. From the list of resources, locate and select the Synapse Workspace item named **sapdatasynws{SUFFIX}**.

    ![The resource group list displays with the Synapse Workspace item highlighted.](media/ap_rg_synapseworkspace.png "Locate Synapse Workspace")

3. On the Synapse workspace screen, select **Open Synapse Studio**.

    ![The Synapse workspace screen displays with the Open Synapse Studio card highlighted.](media/ap_opensynapsestudiocard.png "Open Synapse Studio")

4. In Synapse Studio, select the **Manage** hub from the left menu.

    ![Synapse Studio displays with the Manage hub selected in the left menu.](media/ss_managehub_menu.png "Manage hub")

5. Beneath the **External connections** section, select **Linked services**. Then select **+ New** from the Linked services toolbar menu.

    ![The Manage Hub displays with the Linked services item selected. The + New button is highlighted on the Linked services screen toolbar.](media/ss_newlinkedservicemenu.png "New Linked service")

6. In the New linked service blade, search for and select **Azure Data Lake Storage Gen2**. Select **Continue**.

    ![The New linked service blade displays with the Azure Data Lake Storage Gen2 item highlighted.](media/ss_newlinkedsvc_adlsgen2search.png "New ADLS Gen2 Linked service")  

7. In the New linked service - Azure Data Lake Storage Gen2 form, fill it in as follows and select **Create**. Unspecified fields retain their default values.
    
    | Field | Value |
    |-------|-------|
    | Name | Enter `datalake`. |
    | Authentication type | Select **System Assigned Managed Identity**. |
    | Azure subscription | Select your Azure subscription. |
    | Storage account name | Select **sapadls{SUFFIX}**. |

    ![The New Linked service form for ADLS Gen2 displays populated with the preceding values.](media/ss_newlinkedservice_adlsgen2_form.png "New ADLS Gen2 Linked service form")

8. On the Linked services screen, select **+ New** from the toolbar menu. On the New Linked service blade search for and select **Azure Cosmos DB (SQL API)**. Select **Continue**.

    ![The New linked service blade displays with Azure Cosmos DB (SQL API) selected. The Continue button is highlighted.](media/ss_linkedservice_cosmosdbsql.png "New Cosmos DB Linked Service")

9. In the New linked service - Azure Cosmos DB form, fill it as follows then select the **Create** button. Unspecified fields retain their default values.
    
    | Field | Value |
    |-------|-------|
    | Name | Enter `payment_data_cosmosdb`. |
    | Authentication type | Select **Account key**. |
    | Azure subscription | Select your Azure subscription. |
    | Azure Cosmos DB account name | Select **sap-mcw-cosmos-{SUFFIX}**. |
    | Database name | Select **SAPS4D**. |

    ![The new Linked service form for Cosmos DB displays populated with the preceding values.](media/ss_newlinkedservice_cosmosdb_form.png "New Cosmos DB Linked service form")

10. On the Synapse Studio toolbar menu, select **Publish all**. Select **Publish** on the verification blade.

    ![The Synapse Studio toolbar menu displays with the Publish all button highlighted.](media/ss_publishall.png "Publish all")

### Task 2: Create source and sink integration datasets

The source data is payment data that is located in Azure Data Lake Storage Gen2 in CSV format. The sink is the paymentData Cosmos DB collection.

1. In Synapse Studio, select the **Data** hub.
   
   ![The left menu of Synapse Studio displays with the Data hub highlighted.](media/ss_datahub_menu.png "Data hub")

2. From the center pane, select the **Linked** tab. Expand the **Azure Data Lake Storage Gen2** item, followed by teh **datalake** item, and select the **payment-data-csv** container. From the **payment-data-csv** tab, select the **paymentData_CAL2021.csv** file. Next, select **New integration dataset** from the toolbar menu.

    ![The Data hub displays with the Linked tab selected and the Azure Datalake Storage Gen2 item expanded along with the datalake item. The payment-data-csv container is selected. The paymentData_CAL2021.csv file is selected with the New integration dataset menu item highlighted in the toolbar menu.](media/ss_paymentdata_newdatasetmenu.png "Data hub new integration dataset")

3. On the New integration dataset blade, enter `payment_data_csv` for the name and select **DelimitedText** for the format. Select **Create**.

    ![The New integration dataset blade displays populated with the preceding values.](media/ss_newintegrationdataset_paymentdatacsv.png "New integration dataset for payment data")

4. On the **payment-data-csv** integration dataset tab, change the **Column delimiter** value to **Semicolon (;)** and check the checkbox for the **First row as header** field.
   
   ![The payment-data-csv integration dataset form displays with the column delimiter value changed to semicolon and the first row as header field checked.](media/ss_paymentdata_dataset_form.png)

5. If desired, select the **Preview data** button to view a sample of the data.

6. Remaining in the Data hub, expand the **+** menu in the center pane and select **Integration dataset** beneath the **Linked** header.

    ![The Data hub displays with the + menu expanded and the Integration dataset option highlighted.](media/ss_datahub_newintegrationdataset.png "New Integration dataset")

7. On the New integration dataset blade, search for and select **Azure Cosmos DB (SQL API)**. Select **Continue**.

    ![The New integration dataset blade displays with the Azure Cosmos DB (SQL API) item selected.](media/ss_newintegrationdataset_comsosdbsearch.png "New Azure Cosmos DB integration dataset")

8. On the **Set properties** blade, fill the form as follows, then select **OK**.

    | Field | Value |
    |-------|-------|
    | Name | Enter `payments_cosmosdb`. |
    | Linked service | Select **payment_data_cosmosdb**. |
    | Container | Select **paymentData**. |
    | Import schema | Select **None**. |

    ![The Set properties blade displays populated with the preceding values.](media/ss_cosmosdbintegrationdataset_setpropertiesform.png "Set Cosmos DB integration dataset properties")

9. On the Synapse Studio toolbar menu, select **Publish all**. Select **Publish** on the verification blade.

    ![The Synapse Studio toolbar menu displays with the Publish all button highlighted.](media/ss_publishall.png "Publish all")

### Task 3: Create pipeline to ingest payment data into Cosmos DB

1. In Synapse Studio, select the **Integrate** hub from the left menu. Then from the center pane menu, expand the **+** button and choose **Pipeline**.

    ![Synapse Studio displays with the Integrate hub selected in the left menu and the + menu expanded in the center panel. The pipeline item is selected.](media/ss_newpipelinemenu.png "New pipeline")

2. In the **Properties** blade of the new pipeline, set the name field to **UploadPaymentsToCosmosDB**. If desired, press the **Properties** button in the pipeline toolbar to collapse this blade.

    ![The Properties blade displays with the name set to UploadPaymentsToCosmosDB and the Properties button is highlighted.](media/ss_paymentspipeline_propertiespane.png "Pipeline properties")

3. In the Activities pane, expand the **Move & Transform** item then drag and drop a **Copy data** activity to the pipeline canvas.

    ![The pipeline editor displays with the Move & Transform item expanded in the Activities panel and an arrow indicates the drag and drop operation of the Copy data activity to the pipeline canvas.](media/ss_paymentspipeline_copydata_movetocanvas.png "Add Copy data activity to pipeline")

4. With the Copy data activity selected in the pipeline editor, select the **Source** tab. Select **payment_data_csv** as the **Source dataset**.

    ![The Copy data activity Source tab displays with payment_data_csv selected as the Source dataset.](media/ss_paymentpipeline_copysource.png "Source dataset")

5. With the Copy data activity selected in the pipeline editor, select the **Sink** tab. Select **payments_cosmosdb** as the Sink dataset.

    ![The Copy data activity Sink tab displays with the payments_cosmosdb selected as the Sink dataset.](media/ss_paymentpipeline_copysink.png "Sink dataset")

6. On the Synapse Studio toolbar menu, select **Publish all**. Select **Publish** on the verification blade.

    ![The Synapse Studio toolbar menu displays with the Publish all button highlighted.](media/ss_publishall.png "Publish all")

7. Once published, expand the **Add trigger** toolbar item and choose **Trigger now**. Select **OK** on the Pipeline run blade. This will run the pipeline to copy the payments data to Cosmos DB.

    ![The payments pipeline Add trigger item is expanded with the Trigger now item selected.](media/ss_paymentpipeline_triggernow.png "Trigger payments pipeline")

8. In Synapse Studio, select the **Monitor** hub. Beneath the Integration header of the center pane, select **Pipeline runs**. Monitor the payments pipeline run until it has completed. The Refresh button in the toolbar may be used to update the monitoring table.

    ![Synapse Studio displays with the Monitor hub selected from the left menu, the Pipeline runs selected in the center panel, and the payment pipeline listed as in progress. The Refresh button is highlighted.](media/ss_monitorpaymentspipeline.png "Monitor hub")

9. Verify the data by returning to the Azure Portal, opening the **mcw_sap_plus_extend_and_innovate** resource group, then locating and opening the **sap-mcw-cosmos-{SUFFIX}** Cosmos DB resource.

    ![A portion of the mcw_sap_plus_extend_and_innovate resources displays with the Cosmos DB resource selected.](media/portal_cosmosdb_resource.png "Cosmos DB resource")

10. On the Azure Cosmos DB account screen, select **Data Explorer** from the left menu. In the SQL API panel, expand the **SAPS4D** and **paymentData** items. Select **Items**, then choose an item from the **paymentData** tab. This will display the contents of the selected document for review.

    ![The Azure Cosmos DB account screen displays with the Data Explorer item highlighted in the left menu. In the SQL API pane, the SAPS4D database is expanded along with the paymentData collection. The items option is selected beneath the collection. One document is highlighted in the paymentData tab and the screen displays the selected document's content.](media/portal_cosmosdb_paymentdatapreview.png "View document in Cosmos DB")
 
## Exercise 3: Install the self-hosted integration runtime on the SAP virtual machine

In order for Azure Synapse Analytics to utilize the locally hosted OData services on the 
SAP virtual machine, a self-hosted integration runtime must be installed. The self-hosted integration runtime is used to establish connectivity between Azure Synapse Analytics and other non-public internet facing compute resources. These can be on-premises resources and those protected by virtual networks and firewalls.

### Task 1: Download and install the self-hosted integration runtime

1. On the **SAP VM**, open the Chrome browser and log into the [Azure Portal](https://portal.azure.com). 

2. Open the **mcw_sap_plus_extend_and_innovate** resource group then locate and open the **sapdatasynws{SUFFIX}** Synapse workspace resource.

3. Open Synapse Studio.

4. Select the **Manage** hub, then choose **Integration runtimes** from beneath the Integration header. From the Integration runtimes screen, select **+ New** from the toolbar menu.

    ![Synapse Studio displays with the Manage hub selected from the left menu. Integration runtimes is selected in the center pane and the + New button is highlighted in the toolbar menu of the Integration runtimes screen.](media/ss_managehub_newirmenu.png "New integration runtime")

5. On the Integration runtime setup blade, select the **Azure, Self-Hosted** card. Select **Continue**.

    ![The Integration runtime setup blade displays with the Azure, Self-Hosted item selected.](media/ss_ir_azureselfhostedcard.png "Azure, Self-hosted integration runtime")

6. Select **Self-Hosted** as the network environment. Select **Continue**.

    ![The Integration runtim setup blade displays with the Self-Hosted option selected.](media/ss_ir_selfhostedcard.png "Self-Hosted integration runtime")  

7. Enter `SAPVM-SHIR` in the Name field and select **Create**.

    ![A form displays on teh Integration runtime setup blade with SAPVM-SHIR entered in the Name field.](media/ss_shir_name.png "Naming the Self-Hosted integration runtime")

8. Select the link below the **Option 1: Express setup** header. This will download an executable file.

    ![The link below Option 1: Express setup is highlighted.](media/ss_shir_expresssetuplink.png "Express setup")

9. Run the downloaded executable. The Express Setup will download, install, and register the self-hosted integration runtime. Select the **Close** button once all the steps have completed.

    ![The Microsoft Integration Runtime Express Setup executable displays indicating the current installation progress.](media/ss_shir_install.png "Express Setup Executable")

10. Close the Integration runtime setup blade.

11. The Integration runtimes list should now display **SAPVM-SHIR** in the list.

    ![The Integration runtimes list displays with teh SAPVM-SHIR item highlighted.](media/ss_irlisting_withshir.png "Integration runtimes list")

12. Optionally close Chrome and minimize the SAP VM.

## Exercise 4: Ingest sales order information from SAP into Azure Synapse Analytics

Historical sales order information resides in S/4HANA and is exposed with OData services. The self-hosted integration runtime installed on the SAP virtual machine enables connectivity between Azure Synapse Analytics and S/4HANA, this will allow for local web calls to take place to the OData endpoints to retrieve sales data.

### Task 1: Create dedicated SQL pool tables to hold sales data

1. In Synapse Studio, select the **Develop** hub from the left menu, then expand the **+** menu from the center pane and choose **SQL script**.

    ![Synapse Studio displays with the Develop hub selected in the left menu and the + menu expanded in the center pane. The SQL script item is highlighted.](media/ss_develophub_newsqlscript.png "New SQL script")

2. In the SQL script tab, choose to connect to the **sapdatasynsql** dedicated SQL pool in the toolbar menu.

    ![The SQL Script tab displays with the sapdatasynsql database chosen in the Connect to field.](media/ss_sqlscript_connectto_sapdatasynsql.png "Connect to the dedicated SQL pool database")

3. In the SQL script editor, paste and run the following SQL command to create the SalesOrderHeaders table. The **Run** button is located in the SQL script toolbar menu.

    ```SQL
    CREATE TABLE SalesOrderHeaders(
        BILLINGCOMPANYCODE nvarchar(4),
        BILLINGDOCUMENTDATE date,
        COUNTRY nvarchar(3),
        CREATIONDATE date,
        CREATIONTIME time,
        CREDITCONTROLAREA nvarchar(4),
        CUSTOMERACCOUNTGROUP nvarchar(4),
        CUSTOMERGROUP nvarchar(2),
        CUSTOMERNAME nvarchar(80),
        DISTRIBUTIONCHANNEL nvarchar(2),
        LASTCHANGEDATE date,
        LASTCHANGEDATETIME datetimeoffset,       
        ORGANIZATIONDIVISION nvarchar(2),
        PRICINGDATE date,
        PURCHASEORDERBYCUSTOMER nvarchar(35),
        SALESDISTRICT nvarchar(6),
        SALESDOCUMENT nvarchar(10) NOT NULL,
        SALESDOCUMENTPROCESSINGTYPE nvarchar(1),
        SALESDOCUMENTTYPE nvarchar(4),
        SALESGROUP nvarchar(3),
        SALESOFFICE nvarchar(4),
        SALESORGANIZATION nvarchar(4),
        SDDOCUMENTCATEGORY nvarchar(4),
        SOLDTOPARTY nvarchar(10),
        TOTALNETAMOUNT decimal(15, 2),
        TRANSACTIONCURRENCY nvarchar(5),
        CITYNAME nvarchar(35),
        POSTALCODE nvarchar(10)
    )
    ```

4. Replace the code in the script window with the following command to create the SalesOrderItems table. Run this script.

    ```SQL
    CREATE TABLE SalesOrderItems(
        SalesOrder nvarchar(10),
        SalesOrderItem nvarchar(6),
        SalesOrderItemText nvarchar(40),
        SoldToParty nvarchar(10),
        MaterialByCustomer nvarchar(35),
        MaterialName nvarchar(40),
        Material nvarchar(40),
        ShipToParty nvarchar(10),
        FullName nvarchar(80),
        SDProcessStatus nvarchar(1),
        DeliveryStatus nvarchar(1),
        SDDocumentRejectionStatus nvarchar(1),
        SalesDocumentRjcnReason nvarchar(2),
        RequestedQuantity decimal(15,3),
        RequestedQuantityUnit nvarchar(3),
        TransactionCurrency nvarchar(5),
        NetAmount decimal(16, 3),
        MaterialGroup nvarchar(9),
        Batch nvarchar(10),
        ProductionPlant nvarchar(4),
        StorageLocation nvarchar(4),
        ShippingPointName nvarchar(30),
        ShippingPoint nvarchar(4),
        SalesOrderItemCategory nvarchar(4),
        BillingBlockCriticality tinyint,
        ItemBillingBlockReason nvarchar(2),
        OrderRelatedBillingStatus nvarchar(1),
        RequestedDeliveryDate date,
        HigherLevelItem nvarchar(6),
        SalesOrderProcessingType nvarchar(1),
        RequirementSegment nvarchar(40)
    )
    ```

### Task 2: Create a linked service to the SAP OData endpoint for sales order header information

A linked service describes connectivity to external resources. In this case, an authenticated OData-based linked service is required to pull sales order data from SAP.

1. In Synapse Studio, select the **Manage** hub, then choose **Linked services** from the center menu. Select **+ New** in the Linked services screen toolbar menu.

    ![The Manage Hub displays with the Linked services item selected. The + New button is highlighted on the Linked services screen toolbar.](media/ss_newlinkedservicemenu.png "New Linked service")

2. In the New linked service blade, search for and select **OData**. Select **Continue**.

    ![The New linked service blade displays with OData in the search box and in the filtered search results.](media/ss_newlinkedservice_odatasel.png "New OData Linked service")

4. Fill the New linked service form as follows, then test connection. Select **Create**.

    | Field | Value |   
    |-------|-------|
    | Name | Enter `sap_salesorderheader_odata`. |
    | Connect via integration runtime | Select **SAPVM-SHIR**. |
    | Service URL | Use the SAP OData URL recorded in the from Exercise 1. |
    | Authentication type | Select **Basic authentication**. |
    | User name | Enter `S4H_EXT`. |
    | Password | Enter `Welcome1`. |
    
    ![The New linked service OData form displays populated with the preceding values. The Test connection button is highlighted.](media/ss_salesorderheader_linkedserviceform.png "New Linked service - OData")

### Task 3: Create a linked service to the SAP OData endpoint for sales order item information

1. In Synapse Studio, select the **Manage** hub, then choose **Linked services** from the center menu. Select **+ New** in the Linked services screen toolbar menu.

    ![The Manage Hub displays with the Linked services item selected. The + New button is highlighted on the Linked services screen toolbar.](media/ss_newlinkedservicemenu.png "New Linked service")

2. In the New linked service blade, search for and select **OData**. Select **Continue**.

    ![The New linked service blade displays with OData in the search box and in the filtered search results.](media/ss_newlinkedservice_odatasel.png "New OData Linked service")

4. Fill the New linked service form as follows, then test connection. Select **Create**.

    | Field | Value |   
    |-------|-------|
    | Name | Enter `sap_salesorderitems_odata`. |
    | Connect via integration runtime | Select **SAPVM-SHIR**. |
    | Service URL | Use the SAP OData URL recorded in the from Exercise 1. Replace **ZBD_I_SALESDOCUMENT_E_CDS** with `sd_f1814_so_fs_srv` in the URL value. |
    | Authentication type | Select **Basic authentication**. |
    | User name | Enter `S4H_EXT`. |
    | Password | Enter `Welcome1`. |
    
    ![The New linked service OData form displays populated with the preceding values. The Test connection button is highlighted.](media/ss_salesorderitems_linkedserviceform.png "New Linked service - OData")

### Task 4: Create a linked service to the dedicated SQL pool database

1. In Synapse Studio, select the **Manage** hub, then choose **Linked services** from the center menu. Select **+ New** in the Linked services screen toolbar menu.

    ![The Manage Hub displays with the Linked services item selected. The + New button is highlighted on the Linked services screen toolbar.](media/ss_newlinkedservicemenu.png "New Linked service")

2. In the New linked service blade, search for and select **Azure Synapse Analytics**. Select **Continue**.

    ![The New linked service blade displays with Azure Synapse Analytics entered in the search box and Azure Synapse Analytics selected from the search results.](media/ss_linkedservice_azuresynapseanalytics_menu.png "New Azure Synapse Analytics linked service")

3. In the New linked service Azure Synapse Analytics blade, populate the form as follows then select **Create**.
    
    | Field | Value |   
    |-------|-------|
    | Name | Enter `sales_order_data_sql`. |
    | Azure subscription | Select the Azure subscription for the lab. |
    | Server name | Select **sapdatasynws{SUFFIX}**. |
    | Database name | Select **sapdatasynsql**. |
    | Authentication type | Select **System Assigned Managed Identity**. |

    ![The New linked service Azure Synapase Analytics blade form displays populated with the preceding values.](media/ss_linkedservice_azuresynapseanalytics_form.png "New Azure Synapse Analytics linked service form")

4. On the Synapse Studio toolbar menu, select **Publish all**. Select **Publish** on the verification blade.

    ![The Synapse Studio toolbar menu displays with the Publish all button highlighted.](media/ss_publishall.png "Publish all")

### Task 5: Create integration datasets for sales order header and sales order items

The Copy activity in Azure Synapse Analytics requires the usage of integration datasets to describe both the source and sink data sources. In this task, four integration datasets are defined representing sales order headers and sales order item data (source in S/4HANA OData and sink in dedicated SQL pool tables).

1. In Synapse Studio, select the **Data** hub from the left menu and expand the **+** menu in the center pane.

    ![The Data hub displays with the + menu expanded and the Integration dataset option highlighted.](media/ss_datahub_newintegrationdataset.png "New Integration dataset")

2. In the New integration dataset blade, search for and select **OData**

    ![The New integration dataset blade displays with OData entered in the search box and OData shown in the search results.](media/ss_newintegrationdataset_odatamenu.png "OData integration dataset")

3. On the **Set properties** blade, fill the form as follows and select **OK**. This will create the integration dataset representing sales order header information.

    | Field | Value |   
    |-------|-------|
    | Name | Enter `sales_order_headers_odata`. |
    | Linked service | Select **sap_salesorderheader_odata**. |
    | Path | Select **ZBD_I_Salesdocument_E**. |

    ![The Set properties blade displays populated with the preceding values.](media/ss_salesorderheader_dataset_form.png "Sales order headers integration dataset details")

4. Repeat steps 1 and 2 to create a new integration dataset. On the **Set properties** blade, fill the form as follows and select **OK**. This creates the integration dataset for sales item information.

    | Field | Value |   
    |-------|-------|
    | Name | Enter `sales_order_items_odata`. |
    | Linked service | Select **sap_salesorderitems_odata**. |
    | Path | Select **C_Salesorderitemfs**. |

    ![The Set properties blade displays populated with the preceding values.](media/ss_salesorderitems_dataset_form.png "Sales order items integration dataset details")

5. Now it is time to create the integration datasets for the sales order tables created in the dedicated SQL pool. In Synapse Studio, select the **Data** hub from the left menu and expand the **+** menu in the center pane.

    ![The Data hub displays with the + menu expanded and the Integration dataset option highlighted.](media/ss_datahub_newintegrationdataset.png "New Integration dataset")

6. In the New integration dataset blade, search for and select **Azure Synapse Analytics**. Select **Continue**.

    ![The New integration dataset blade displays with Azure Synapse Analytics entered in the search box and Azure Synapse Analytics shown in the search results.](media/ss_newintegrationdataset_azuresynapseanalyticsmenu.png "New Azure Synapse Analytics integration dataset")

7. On the **Set properties** blade, populate the form as follows and select **OK**.

    | Field | Value |   
    |-------|-------|
    | Name | Enter `sales_order_headers_sql`. |
    | Linked service | Select **sales_order_data_sql**. |
    | Table name | Select **dbo.SalesOrderHeaders**. |
    | Import schema | Select **From connection/store**. |

    ![The Set properties blade displays populated with the preceding values.](media/ss_azuresynapseanalytics_salesorderheaders_dataset_form.png "New Azure Synapse Analytics Sales headers integration dataset form")

8. Repeat steps 5 and 6 to create a new Azure Synapse Analytics integration dataset. On the **Set properties** blade, populate the form as follows and select **OK**.

    | Field | Value |   
    |-------|-------|
    | Name | Enter `sales_order_items_sql`. |
    | Linked service | Select **sales_order_data_sql**. |
    | Table name | Select **dbo.SalesOrderItems**. |
    | Import schema | Select **From connection/store**. |

    ![The Set properties blade displays populated with the preceding values.](media/ss_azuresynapseanalytics_salesorderitems_dataset_form.png "New Azure Synapse Analytics Sales items integration dataset form")

9. On the Synapse Studio toolbar menu, select **Publish all**. Select **Publish** on the verification blade.

    ![The Synapse Studio toolbar menu displays with the Publish all button highlighted.](media/ss_publishall.png "Publish all")

### Task 6: Create a pipeline to ingest sales data from S/4HANA

An Azure Synapse Analytics pipeline can be used to move data from source to sink. The Copy data activity moves data from a source dataset to a sink dataset. This task creates a pipeline with two Copy data activities to move sales order header and sales order items data from S/4HANA into the dedicated SQL pool tables in Azure Synapse Analytics.

1. In Synapse Studio, select the **Integrate** hub from the left menu. Expand the **+** menu from the center pane, and choose **Pipeline**.

    ![Synapse Studio displays with the Integrate hub selected in the left menu and the + menu expanded in the center panel. The pipeline item is selected.](media/ss_newpipelinemenu.png "New pipeline")

2. In the Properties blade, enter the name `IngestSalesOrderData`. Optionally collapse the Properties blade using the button on the toolbar of the pipeline.

    ![The Properties blade of the pipeline displays with the name button and the collapse properties button highlighted.](media/ss_ingestsalesorderdata_pipeline_properties.png "Pipeline properties")

3. From the Activities menu, expand the **Move & transform** section, then drag-and-drop a **Copy data** activity to the pipeline visual canvas. With the Copy data activity selected, enter `copy_sales_order_headers` in the **Name** field.

    ![The pipeline tab displays with the Move & transform item expanded in the Activities menu. An arrow indicates a drag-and-drop operation of a Copy data activity to the pipeline visual canvas. The Copy data activity is active and copy_sales_order_headers is entered in the Name field of the General tab.](media/ss_salespipeline_copyactivity_salesorderheaders.png "Copy data activity")

4. With the **copy_sales_order_headers** activity selected, select the **Source** tab. In the **Source dataset** tab, select **sales_order_headers_odata**.

    ![The Source tab is highlighted with sales_order_headers_odata selected as the Source dataset.](media/ss_copydata_salesheader_source.png "Copy data activity Source tab")

5. With the **copy_sales_order_headers** activity selected, select the **Sink** tab. Select **sales_order_headers_sql** as the Sink dataset.

    ![The Sink tab is highlighted with sales_order_headers_sql selected as the Sink dataset.](media/ss_copydata_salesheader_sink.png "Copy data activity Sink tab")

6. With the **copy_sales_order_headers** activity selected, select the **Mapping** tab. Select the **Import schemas** button to review the data mapping.

    ![The Mapping tab is highlighted with the Import schemas button selected.](media/ss_copydata_salesheader_mapping.png "Copy data activity Mapping tab")

7. asdf

## After the hands-on lab 

Duration: X minutes

\[insert your custom Hands-on lab content here . . .\]

### Task 1: Task name

1.  Number and insert your custom workshop content here . . .

    -  Insert content here

        -  

### Task 2: Task name

1.  Number and insert your custom workshop content here . . .

    -  Insert content here

        -    

You should follow all steps provided *after* attending the Hands-on lab.

