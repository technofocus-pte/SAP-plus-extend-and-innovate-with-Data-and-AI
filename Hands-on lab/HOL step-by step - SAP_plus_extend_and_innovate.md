![](https://github.com/Microsoft/MCW-Template-Cloud-Workshop/raw/main/Media/ms-cloud-workshop.png "Microsoft Cloud Workshops")

<div class="MCWHeader1">
SAP plus extend and innovate with Data and AI
</div>

<div class="MCWHeader2">
Hands-on lab step-by-step
</div>

<div class="MCWHeader3">
August 2022
</div>


Information in this document, including URL and other Internet Web site references, is subject to change without notice. Unless otherwise noted, the example companies, organizations, products, domain names, e-mail addresses, logos, people, places, and events depicted herein are fictitious, and no association with any real company, organization, product, domain name, e-mail address, logo, person, place or event is intended or should be inferred. Complying with all applicable copyright laws is the responsibility of the user. Without limiting the rights under copyright, no part of this document may be reproduced, stored in or introduced into a retrieval system, or transmitted in any form or by any means (electronic, mechanical, photocopying, recording, or otherwise), or for any purpose, without the express written permission of Microsoft Corporation.

Microsoft may have patents, patent applications, trademarks, copyrights, or other intellectual property rights covering subject matter in this document. Except as expressly provided in any written license agreement from Microsoft, the furnishing of this document does not give you any license to these patents, trademarks, copyrights, or other intellectual property.

The names of manufacturers, products, or URLs are provided for informational purposes only and Microsoft makes no representations and warranties, either expressed, implied, or statutory, regarding these manufacturers or the use of the products with any Microsoft technologies. The inclusion of a manufacturer or product does not imply endorsement of Microsoft of the manufacturer or product. Links may be provided to third party sites. Such sites are not under the control of Microsoft and Microsoft is not responsible for the contents of any linked site or any link contained in a linked site, or any changes or updates to such sites. Microsoft is not responsible for webcasting or any other form of transmission received from any linked site. Microsoft is providing these links to you only as a convenience, and the inclusion of any link does not imply endorsement of Microsoft of the site or the products contained therein.

© 2022 Microsoft Corporation. All rights reserved.

Microsoft and the trademarks listed at <https://www.microsoft.com/en-us/legal/intellectualproperty/Trademarks/Usage/General.aspx> are trademarks of the Microsoft group of companies. All other trademarks are property of their respective owners.

**Contents** 

<!-- TOC -->
- [SAP plus extend and innovate with Data and AI hands-on lab step-by-step](#sap-plus-extend-and-innovate-with-data-and-ai-hands-on-lab-step-by-step)
  - [Abstract and learning objectives](#abstract-and-learning-objectives)
  - [Overview](#overview)
  - [Solution architecture](#solution-architecture)
  - [Requirements](#requirements)
  - [Before the hands-on lab](#before-the-hands-on-lab)
  - [Exercise 1: Install the self-hosted integration runtime on the SAP virtual machine](#exercise-1-install-the-self-hosted-integration-runtime-on-the-sap-virtual-machine)
    - [Task 1: Download and install the self-hosted integration runtime](#task-1-download-and-install-the-self-hosted-integration-runtime)
  - [Exercise 2: Ingest sales order information from SAP into Azure Synapse Analytics](#exercise-2-ingest-sales-order-information-from-sap-into-azure-synapse-analytics)
    - [Task 1: Create dedicated SQL pool tables to hold sales data](#task-1-create-dedicated-sql-pool-tables-to-hold-sales-data)
    - [Task 2: Create a linked service to the SAP OData endpoint for sales order header information](#task-2-create-a-linked-service-to-the-sap-odata-endpoint-for-sales-order-header-information)
    - [Task 3: Create a linked service to the SAP OData endpoint for sales order item information](#task-3-create-a-linked-service-to-the-sap-odata-endpoint-for-sales-order-item-information)
    - [Task 4: Create a linked service to the dedicated SQL pool database](#task-4-create-a-linked-service-to-the-dedicated-sql-pool-database)
    - [Task 5: Create integration datasets for sales order header and sales order items](#task-5-create-integration-datasets-for-sales-order-header-and-sales-order-items)
    - [Task 6: Create a pipeline to ingest sales data from S/4HANA](#task-6-create-a-pipeline-to-ingest-sales-data-from-s4hana)
  - [Exercise 3: Ingest payment information from Cosmos DB into Azure Synapse Analytics](#exercise-3-ingest-payment-information-from-cosmos-db-into-azure-synapse-analytics)
    - [Task 1: Create a dedicated SQL pool table to hold payment information](#task-1-create-a-dedicated-sql-pool-table-to-hold-payment-information)
    - [Task 2: Create the Payments table integration dataset](#task-2-create-the-payments-table-integration-dataset)
    - [Task 3: Create the Payments ingestion pipeline](#task-3-create-the-payments-ingestion-pipeline)
  - [Exercise 4: Prepare data for the incoming cashflow prediction model training](#exercise-4-prepare-data-for-the-incoming-cashflow-prediction-model-training)
    - [Task 1: Create a SQL view that combines sales orders with payments data](#task-1-create-a-sql-view-that-combines-sales-orders-with-payments-data)
    - [Task 2: Move the view data to a parquet file in Azure Data Lake Storage Gen2](#task-2-move-the-view-data-to-a-parquet-file-in-azure-data-lake-storage-gen2)
  - [Exercise 5: Train a regression model to predict incoming cashflow using Azure Machine Learning Studio](#exercise-5-train-a-regression-model-to-predict-incoming-cashflow-using-azure-machine-learning-studio)
    - [Task 1: Retrieve the access key for the Azure Data Lake Storage account](#task-1-retrieve-the-access-key-for-the-azure-data-lake-storage-account)
    - [Task 2: Create an Azure Machine Learning datastore](#task-2-create-an-azure-machine-learning-datastore)
    - [Task 3: Create and run an Automated ML job](#task-3-create-and-run-an-automated-ml-job)
    - [Task 4: Deploy the best model as a web service](#task-4-deploy-the-best-model-as-a-web-service)
  - [Exercise 6: Train a regression model to predict incoming cashflow using Azure Synapse Analytics (OPTIONAL)](#exercise-6-train-a-regression-model-to-predict-incoming-cashflow-using-azure-synapse-analytics-optional)
    - [Task 1: Create the SalesPaymentsFull Spark table from the parquet file](#task-1-create-the-salespaymentsfull-spark-table-from-the-parquet-file)
    - [Task 2: Create an Azure Machine Learning linked service](#task-2-create-an-azure-machine-learning-linked-service)
    - [Task 3: Train a new regression model for incoming cash flow](#task-3-train-a-new-regression-model-for-incoming-cash-flow)
    - [Task 4: Deploy and test the regression model in the dedicated SQL pool](#task-4-deploy-and-test-the-regression-model-in-the-dedicated-sql-pool)
  - [Exercise 7: Visualize historical data with Power BI](#exercise-7-visualize-historical-data-with-power-bi)
    - [Task 1: Retrieve the database connection information for the dedicated SQL pool](#task-1-retrieve-the-database-connection-information-for-the-dedicated-sql-pool)
    - [Task 2: Import data into Power BI](#task-2-import-data-into-power-bi)
    - [Task 3: Create the relational model](#task-3-create-the-relational-model)
    - [Task 4: Create a sales per data and customer group visualization](#task-4-create-a-sales-per-data-and-customer-group-visualization)
    - [Task 5: Create a sales per region and customer group visualization](#task-5-create-a-sales-per-region-and-customer-group-visualization)
    - [Task 6: Create a payments per date and customer group visualization](#task-6-create-a-payments-per-date-and-customer-group-visualization)
    - [Task 7: Create a sales per customer group and material group visualization](#task-7-create-a-sales-per-customer-group-and-material-group-visualization)
    - [Task 8: Create a payment offset per customer group visualization](#task-8-create-a-payment-offset-per-customer-group-visualization)
    - [Task 9: Create a payment offset per customer group box plot visualization (Optional)](#task-9-create-a-payment-offset-per-customer-group-box-plot-visualization-optional)
  - [Exercise 8: Integrate Azure Machine Learning and Power BI](#exercise-8-integrate-azure-machine-learning-and-power-bi)
    - [Task 1: Add the deployed model to the Power BI report](#task-1-add-the-deployed-model-to-the-power-bi-report)
    - [Task 2: Create a Date table for report aggregation](#task-2-create-a-date-table-for-report-aggregation)
    - [Task 3: Create the Sales and Payment Forecast visualization](#task-3-create-the-sales-and-payment-forecast-visualization)
  - [Exercise 9: Create an alert in Power BI](#exercise-9-create-an-alert-in-power-bi)
    - [Task 1: Publish the Power BI report to an online workspace](#task-1-publish-the-power-bi-report-to-an-online-workspace)
    - [Task 2: Create a gauge visualization to be used as the notification trigger](#task-2-create-a-gauge-visualization-to-be-used-as-the-notification-trigger)
    - [Task 3: Create an alerting dashboard to send email with Power Automate](#task-3-create-an-alerting-dashboard-to-send-email-with-power-automate)
  - [Exercise 10: Update SAP from Power BI](#exercise-10-update-sap-from-power-bi)
    - [Task 1: Import a Power Automate flow](#task-1-import-a-power-automate-flow)
    - [Task 2: Add a Power Automate visual and author the update flow](#task-2-add-a-power-automate-visual-and-author-the-update-flow)
  - [After the hands-on lab](#after-the-hands-on-lab)
    - [Task 1: Delete the Power Automate flows](#task-1-delete-the-power-automate-flows)
    - [Task 2: Delete the Power BI workspace report and dataset](#task-2-delete-the-power-bi-workspace-report-and-dataset)
    - [Task 3: Remove deployed Azure resources with Terraform](#task-3-remove-deployed-azure-resources-with-terraform)
    - [Task 4: Terminate the SAP CAL appliance](#task-4-terminate-the-sap-cal-appliance)

<!-- /TOC -->

# SAP plus extend and innovate with Data and AI hands-on lab step-by-step

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

 Sales Order information is stored in an S/4 HANA system and payments data is stored in Cosmos DB. Synapse Pipelines are used to ingest historical data from both sources. Power BI is used to visualize historical data and to create reports. Azure Machine Learning is used to create a model to predict incoming cash flow. Finally, a data alert is established to identify risky payers whose payments are typically late. This alert triggers a Power Automate process that will in-turn flag the risky payers in SAP.

## Requirements

1. Azure Subscription with Owner role

2. SAP CAL account

3. Power Platform account or membership in the [Microsoft 365 Developer Program](https://developer.microsoft.com/microsoft-365/dev-program)

4. [Power BI Desktop](https://powerbi.microsoft.com/desktop/)

5. [Postman](https://www.postman.com/downloads/)

## Before the hands-on lab

Refer to the Before the hands-on lab setup guide manual before continuing to the lab exercises.

## Exercise 1: Install the self-hosted integration runtime on the SAP virtual machine

Estimated time: 30 minutes

In this exercise, we will assume the SAP environment is either on-premises or secured via a virtual network. In order for Azure Synapse Analytics to utilize the locally hosted OData services on the SAP virtual machine, a self-hosted integration runtime must be installed. The self-hosted integration runtime is used to establish connectivity between Azure Synapse Analytics and other non-public internet facing compute resources. These can be on-premises resources and those protected by virtual networks and firewalls.

### Task 1: Download and install the self-hosted integration runtime

1. On the **SAP VM**, open the Chrome browser and log into the [Azure Portal](https://portal.azure.com).

2. Open the **mcw_sap_plus_extend_and_innovate** resource group then locate and open the **sapdatasynws{SUFFIX}** Synapse workspace resource.

3. Open Synapse Studio.

4. Select the **Manage** hub, then choose **Integration runtimes** from beneath the Integration header. From the Integration runtimes screen, select **+ New** from the toolbar menu.

    ![Synapse Studio displays with the Manage hub selected from the left menu. Integration runtimes is selected in the center pane and the + New button is highlighted in the toolbar menu of the Integration runtimes screen.](media/ss_managehub_newirmenu.png "New integration runtime")

5. On the Integration runtime setup blade, select the **Azure, Self-Hosted** card. Select **Continue**.

    ![The Integration runtime setup blade displays with the Azure, Self-Hosted item selected.](media/ss_ir_azureselfhostedcard.png "Azure, Self-hosted integration runtime")

6. Select **Self-Hosted** as the network environment. Select **Continue**.

    ![The Integration runtime setup blade displays with the Self-Hosted option selected.](media/ss_ir_selfhostedcard.png "Self-Hosted integration runtime")  

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

## Exercise 2: Ingest sales order information from SAP into Azure Synapse Analytics

Estimated time: 35 minutes

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

3. Fill the New linked service form as follows, then test connection. Select **Create**.

    | Field | Value |
    |-------|-------|
    | Name | Enter `sap_salesorderheader_odata`. |
    | Connect via integration runtime | Select **SAPVM-SHIR**. |
    | Service URL | Use the SAP OData URL recorded in the Before the hands-on lab steps. |
    | Authentication type | Select **Basic authentication**. |
    | User name | Enter `S4H_EXT`. |
    | Password | Enter `Welcome1`. |

    ![The New linked service OData form displays populated with the preceding values. The Test connection button is highlighted.](media/ss_salesorderheader_linkedserviceform.png "New Linked service - OData")

### Task 3: Create a linked service to the SAP OData endpoint for sales order item information

1. In Synapse Studio, select the **Manage** hub, then choose **Linked services** from the center menu. Select **+ New** in the Linked services screen toolbar menu.

    ![The Manage Hub displays with the Linked services item selected. The + New button is highlighted on the Linked services screen toolbar.](media/ss_newlinkedservicemenu.png "New Linked service")

2. In the New linked service blade, search for and select **OData**. Select **Continue**.

    ![The New linked service blade displays with OData in the search box and in the filtered search results.](media/ss_newlinkedservice_odatasel.png "New OData Linked service")

3. Fill the New linked service form as follows, then test connection. Select **Create**.

    | Field | Value |
    |-------|-------|
    | Name | Enter `sap_salesorderitems_odata`. |
    | Connect via integration runtime | Select **SAPVM-SHIR**. |
    | Service URL | Use the SAP OData URL recorded in the from the Before the hands-on lab steps. Replace **ZBD_I_SALESDOCUMENT_E_CDS** with `sd_f1814_so_fs_srv` in the URL value. |
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

1. In Synapse Studio, select the **Data** hub from the left menu and expand the **+** menu in the center pane. Select **Integration dataset**.

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

5. Now it is time to create the integration datasets for the sales order tables created in the dedicated SQL pool. In Synapse Studio, select the **Data** hub from the left menu and expand the **+** menu in the center pane. Select **Integration dataset**.

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

5. With the **copy_sales_order_headers** activity selected, select the **Sink** tab. Select **sales_order_headers_sql** as the Sink dataset, and **PolyBase** as the **Copy method**.

    ![The Sink tab is highlighted with sales_order_headers_sql selected as the Sink dataset and PolyBase selected as the Copy method.](media/ss_copydata_salesheader_sink.png "Copy data activity Sink tab")

6. With the **copy_sales_order_headers** activity selected, select the **Mapping** tab. Select the **Import schemas** button to review the data mapping.

    ![The Mapping tab is highlighted with the Import schemas button selected.](media/ss_copydata_salesheader_mapping.png "Copy data activity Mapping tab")

7. With the **copy_sales_order_headers** activity selected, select the **Settings** tab. Check the **Enable staging** checkbox, then select **datalake** for the **Staging account linked service** and enter `staging` in the **Storage Path** field.

    ![The Settings tab is highlighted with the Enable staging checkbox checked and datalake selected as the Storage account linked service. The Storage Path field is populated with the value staging.](media/ss_copydata_enablestaging.png "Copy data Settings tab")

8. Drag-and-drop another instance of the Copy data activity to the pipeline visual canvas. On the **General** tab enter `copy_sales_order_items`.

   ![The pipeline canvas displays with a Copy data activity drag-and-dropped to the visual canvas. The General tab of the Copy data activity displays with copy_sales_order_items entered in the Name field.](media/ss_copydata_itemsactivity_generaltab.png "Copy data General tab")  

9. With the **copy_sales_order_items** activity selected, select the **Source** tab. In the **Source dataset** tab, select **sales_order_items_odata**.

    ![The Source tab of the Copy data activity displays with sales_order_items_odata set as the Source dataset.](media/ss_copydata_itemsactivity_source_tab.png "Copy data Source tab")

10. With the **copy_sales_order_items** activity selected, select the **Sink** tab. In the **Sink dataset** tab, select **sales_order_items_sql**.

    ![The Sink tab of the Copy data activity displays with the sales_order_items item selected as the Sink dataset.](media/ss_copydata_itemsactivity_sink_tab.png "Copy data Sink tab")

11. With the **copy_sales_order_items** activity selected, select the **Mapping** tab. Select the **Import schemas** button to review the mapping of the data fields.

    ![The Mapping tab of the Copy data activity displays with the Import schemas button highlighted.](media/ss_copydata_itemsactivity_mapping_tab.png "Copy data Mapping tab")

12. With the **copy_sales_order_items** activity selected, select the **Settings** tab. Check the **Enable staging** checkbox, then select **datalake** for the **Staging account linked service** and enter `staging` in the **Storage Path** field.

    ![The Settings tab is highlighted with the Enable staging checkbox checked and datalake selected as the Storage account linked service. The Storage Path field is populated with the value staging.](media/ss_copydata_enablestaging.png "Copy data Settings tab")

13. On the Synapse Studio toolbar menu, select **Publish all**. Select **Publish** on the verification blade.

    ![The Synapse Studio toolbar menu displays with the Publish all button highlighted.](media/ss_publishall.png "Publish all")

14. Once published, expand the **Add trigger** item on the pipeline toolbar and select **Trigger now**. Select **OK** on the Pipeline run blade.

    ![The pipeline toolbar menu displays with the Add trigger menu expanded and the Trigger now item selected.](media/ss_pipelinetriggernow.png "Trigger pipeline")

15. On the left menu of Synapse Studio, select the **Monitor** hub. Ensure **Pipeline runs** is selected from the center menu. Observe the IngestSalesOrderData pipeline status over time. Use the **Refresh** button to update the table.

    ![Synapse Studio displays with the Monitor hub selected. Pipeline runs is selected from the center pane and the IngestSalesOrderData pipeline shows as in progress.](media/ss_orderingestionpipeline_monitor.png "Monitor Pipeline runs")

16. Upon successful completion of the pipeline run, verify data was copied by accessing the **Develop** hub from the left menu, expanding the **+** menu and selecting **SQL script**. In the **Connect to** field of the SQL script, select **sapdatasynsql**. In the query window, paste the following SQL commands and run the queries.

    ```sql
    select count(*) from SalesOrderHeaders;
    select count(*) from SalesOrderItems;
    ```

17. Toggle the **Select** drop down to view the results of each query executed. Ensure the values for each query are non-zero.

    ![A SQL script query window displays with count queries. An arrow indicating a drop down to view the results of each query is shown.](media/ss_script_countonsalessqltables.png "SQL script results")  

## Exercise 3: Ingest payment information from Cosmos DB into Azure Synapse Analytics

Estimated time: 30 minutes

Payment history data is required when creating the cash flow prediction model. This data resides in Cosmos DB. In this exercise, a pipeline is created to move payment history data from a Cosmos DB collection into a table in a dedicated SQL pool in Azure Synapse Analytics. In the steps taken in the Before the hands-on lab steps, a linked service for Cosmos DB (payment_data_cosmosdb) and an integration dataset for the paymentData collection (payments_cosmosdb) were created. These assets will be reused in this exercise to implement the payment ingestion pipeline.

### Task 1: Create a dedicated SQL pool table to hold payment information

1. In Synapse Studio, select the **Develop** hub from the left menu, then expand the **+** menu from the center pane and choose **SQL script**.

    ![Synapse Studio displays with the Develop hub selected in the left menu and the + menu expanded in the center pane. The SQL script item is highlighted.](media/ss_develophub_newsqlscript.png "New SQL script")

2. In the SQL script tab, choose to connect to the **sapdatasynsql** dedicated SQL pool.

    ![The SQL Script tab displays with the sapdatasynsql database chosen in the Connect to field.](media/ss_sqlscript_connectto_sapdatasynsql.png "Connect to the dedicated SQL pool database")

3. In the SQL script editor, paste and run the following SQL command to create the Payments table. The Run button is located in the SQL script toolbar menu.

    ```SQL
    CREATE TABLE Payments(
        PaymentNr nvarchar(10),
        SalesOrderNr nvarchar(10),
        CustomerNr nvarchar(10),
        CustomerName nvarchar(80),
        PaymentDate date,
        PaymentValue decimal(15,2),
        Currency nvarchar(5)
    )
    ```

### Task 2: Create the Payments table integration dataset

1. In Synapse Studio, select the **Data** hub from the left menu and expand the **+** menu in the center pane. Select **Integration dataset**.

    ![The Data hub displays with the + menu expanded and the Integration dataset option highlighted.](media/ss_datahub_newintegrationdataset.png "New Integration dataset")

2. In the New integration dataset blade, search for and select **Azure Synapse Analytics**. Select **Continue**.

    ![The New integration dataset blade displays with Azure Synapse Analytics entered in the search box and Azure Synapse Analytics shown in the search results.](media/ss_newintegrationdataset_azuresynapseanalyticsmenu.png "New Azure Synapse Analytics integration dataset")

3. On the **Set properties** blade, populate the form as follows and select **OK**.

    | Field | Value |
    |-------|-------|
    | Name | Enter `payments_sql`. |
    | Linked service | Select **sales_order_data_sql**. |
    | Table name | Select **dbo.Payments**. |
    | Import schema | Select **From connection/store**. |

    ![The Set properties blade displays populated with the preceding values.](media/ss_payments_sql_dataset_set_properties.png "Set properties pane")

4. On the Synapse Studio toolbar menu, select **Publish all**. Select **Publish** on the verification blade.

    ![The Synapse Studio toolbar menu displays with the Publish all button highlighted.](media/ss_publishall.png "Publish all")

### Task 3: Create the Payments ingestion pipeline

1. In Synapse Studio, select the **Integrate** hub from the left menu. Expand the **+** menu from the center pane, and choose **Pipeline**.

    ![Synapse Studio displays with the Integrate hub selected in the left menu and the + menu expanded in the center panel. The pipeline item is selected.](media/ss_newpipelinemenu.png "New pipeline")

2. In the Properties blade, enter the name `IngestPaymentsData`. Optionally collapse the Properties blade using the button on the toolbar of the pipeline.

    ![The Properties blade of the pipeline displays with IngestPaymentsData entered in the Name field and the Properties button highlighted.](media/ss_paymentspipeline_properties.png "Pipeline properties blade")

3. From the Activities menu, expand the **Move & transform** section then drag-and-drop a **Copy data** activity to the pipeline visual canvas. With the Copy data activity selected, enter **copy_payments_data** in the **Name** field.

    ![The Pipeline editor displays with an arrow indicating a drag-and-drop motion of adding a Copy data activity to the pipeline visual canvas. The value copy_payments_data is entered in the Name field.](media/ss_paymentspipeline_copydata_general.png "New Copy data activity")

4. With the **copy_payments_data** Copy data activity selected, select the **Source** tab. Select **payments_cosmosdb** as the **Source dataset**.

    ![The Copy data Source tab displays with payments_cosmosdb selected as the Source dataset.](media/ss_paymentspipeline_copydata_source.png "Copy data Source tab")

5. With the **copy_payments_data** Copy data activity selected, select the **Sink** tab. Select **payments_sql** as the Sink dataset.

    ![The Copy data Sink tab displays with payments_sql selected as the Sink dataset.](media/ss_paymentspipeline_copydata_sink.png "Copy data Sink tab")

6. With the **copy_payments_data** Copy data activity selected, select the **Mapping** tab. Select the **Import schemas** button.

    ![The Copy data Mapping tab displays with the Import schemas button highlighted.](media/ss_paymentspipeline_mappingtab.png "Copy data Mapping tab")

7. On the Mapping tab, locate the field with the name **Value**, and use the dropdown to assign it to the Column name **PaymentValue**. Uncheck the **Include** checkboxes for the **id** field as well as all the fields whose name is prefixed with and underscore (_).

    ![The Mapping tab displays with the Value field mapping to the PaymentValue column. The include checkboxes are cleared for the id field and all fields prefixed with an underscore.](media/ss_paymentspipeline_mapping_edits.png "Updated mapping table")

8. With the **copy_payments_data** Copy data activity selected, select the **Settings** tab. Check the **Enable staging** checkbox, then select **datalake** for the **Staging account linked service** and enter `staging` in the **Storage Path** field.

    ![The Settings tab is highlighted with the Enable staging checkbox checked and datalake selected as the Storage account linked service. The Storage Path field is populated with the value staging.](media/ss_copydata_enablestaging.png "Copy data Settings tab")

9. On the Synapse Studio toolbar menu, select **Publish all**. Select **Publish** on the verification blade.

    ![The Synapse Studio toolbar menu displays with the Publish all button highlighted.](media/ss_publishall.png "Publish all")

10. Once published, expand the **Add trigger** item on the pipeline toolbar and select **Trigger now**. Select **OK** on the Pipeline run blade.

    ![The pipeline toolbar menu displays with the Add trigger menu expanded and the Trigger now item selected.](media/ss_pipelinetriggernow.png "Trigger pipeline")

11. On the left menu of Synapse Studio, select the **Monitor** hub. Ensure **Pipeline runs** is selected from the center menu. Observe the IngestPaymentsData pipeline status over time. Use the **Refresh** button to update the table.

    ![The IngestSalesOrderData pipeline shows as in progress in the Pipeline runs Monitor hub table.](mmedia/ss_paymentsingestionpipeline_monitor.png "Monitor Pipeline runs")

12. Upon successful completion of the pipeline run, verify data was copied by accessing the **Develop** hub from the left menu, expanding the **+** menu and selecting **SQL script**. In the **Connect to** field of the SQL script, select **sapdatasynsql**. In the query window, paste the following SQL command and run the query. Ensure the value returned is non-zero.

    ```sql
    select count(*) from Payments;
    ```

## Exercise 4: Prepare data for the incoming cashflow prediction model training

Estimated time: 30 minutes

Contoso Retail would like to take advantage of the historical sales order and payment data to create a machine learning model that predicts incoming cashflow. In this exercise, a Sales Order and Payments data are combined in a SQL view whose data is then stored as a parquet file in Azure Data Lake Storage Gen2.

### Task 1: Create a SQL view that combines sales orders with payments data

1. In Synapse Studio, select the **Develop** hub from the left menu, then expand the **+** menu from the center pane and choose **SQL script**.

    ![Synapse Studio displays with the Develop hub selected in the left menu and the + menu expanded in the center pane. The SQL script item is highlighted.](media/ss_develophub_newsqlscript.png "New SQL script")

2. In the SQL script tab, choose to connect to the **sapdatasynsql** dedicated SQL pool in the toolbar menu.

    ![The SQL Script tab displays with the sapdatasynsql database chosen in the Connect to field.](media/ss_sqlscript_connectto_sapdatasynsql.png "Connect to the dedicated SQL pool database")

3. In the SQL script editor, paste and run the following SQL command to create the SalesPaymentsFull view that joins the SalesOrderHeaders and Payments data. The **Run** button is located in the SQL script toolbar menu.

   ```SQL
   CREATE VIEW [dbo].[SalesPaymentsFull]
        AS SELECT s.[SALESDOCUMENT]
        , s.[CUSTOMERNAME]
        , s.[CUSTOMERGROUP]
        , s.[BILLINGCOMPANYCODE]
        , s.[BILLINGDOCUMENTDATE]
        , p.[PaymentDate] as PAYMENTDATE
        , s.[CUSTOMERACCOUNTGROUP]
        , s.[CREDITCONTROLAREA]
        , s.[DISTRIBUTIONCHANNEL]
        , s.[ORGANIZATIONDIVISION]
        , s.[SALESDISTRICT]
        , s.[SALESGROUP]
        , s.[SALESOFFICE]
        , s.[SALESORGANIZATION]
        , s.[SDDOCUMENTCATEGORY]
        , s.[CITYNAME]
        , s.[POSTALCODE]
        , DATEDIFF(dayofyear, s.BILLINGDOCUMENTDATE, p.PaymentDate) as PAYMENTDELAYINDAYS
    FROM [dbo].[SalesOrderHeaders] as s
    JOIN [dbo].[Payments] as p ON REPLACE(LTRIM(REPLACE(s.[SALESDOCUMENT], '0', ' ')), ' ', '0') = p.[SalesOrderNr]
   ```

### Task 2: Move the view data to a parquet file in Azure Data Lake Storage Gen2

In this task, a pipeline is created to copy the SalesPaymentsFull view to a parquet file in storage. To implement this pipeline, two additional integration datasets are required, one that points to the SalesPaymentFull view, and one that points to the desired location of the parquet file in Azure Data Lake Storage Gen2.

1. In Synapse Studio, select the **Data** hub from the left menu and expand the **+** menu in the center pane. Select **Integration dataset**.

    ![The Data hub displays with the + menu expanded and the Integration dataset option highlighted.](media/ss_datahub_newintegrationdataset.png "New Integration dataset")

2. In the New integration dataset blade, search for and select **Azure Synapse Analytics**. Select **Continue**.

    ![The New integration dataset blade displays with Azure Synapse Analytics entered in the search box and Azure Synapse Analytics shown in the search results.](media/ss_newintegrationdataset_azuresynapseanalyticsmenu.png "New Azure Synapse Analytics integration dataset")

3. On the **Set properties** blade, populate the form as follows and select **OK**.

    | Field | Value |
    |-------|-------|
    | Name | Enter `sales_payments_full_sql`. |
    | Linked service | Select **sales_order_data_sql**. |
    | Table name | Select **dbo.SalesPaymentsFull**. |
    | Import schema | Select **From connection/store**. |

    ![The Set properties blade for the new integration dataset displays populated with the preceding values.](media/ss_salespaymentsfull_dataset_form.png "Set integration dataset properties")

4. Expand the **+** menu in the center pane. Select **Integration dataset**.

    ![The Data hub displays with the + menu expanded and the Integration dataset option highlighted.](media/ss_datahub_newintegrationdataset.png "New Integration dataset")

5. In the New integration dataset blade, search for and select **Azure Data Lake Storage Gen2**. Select **Continue**.

    ![The New integration dataset blade displays with Azure Data Lake Storage Gen2 entered into the search box and selected from the results.](media/ss_newadlsgen2_integrationdataset_menu.png "New integration dataset blade")

6. On the Select format blade, select **Parquet**. Select **Continue**.

   ![The Select format blade displays with the Parquet option selected.](media/ss_integration_dataset_parquet.png "Parquet file format")

7. On the Set properties blade, complete the form as follows, then select **OK**.

    | Field | Value |
    |-------|-------|
    | Name | Enter `sales_payment_full_parquet`. |
    | Linked service | Select **datalake**. |
    | File path | Enter **sales-payment-parquet**. |
    | Import schema | Select **None**. |

    ![The Set properties blade for the new integration dataset displays populated with the preceding values.](media/ss_salespayment_dataset_properties.png "Set integration dataset properties")

8. On the Synapse Studio toolbar menu, select **Publish all**. Select **Publish** on the verification blade.

    ![The Synapse Studio toolbar menu displays with the Publish all button highlighted.](media/ss_publishall.png "Publish all")

9. In Synapse Studio, select the **Integrate** hub from the left menu. Expand the **+** menu from the center pane, and choose **Pipeline**.

    ![Synapse Studio displays with the Integrate hub selected in the left menu and the + menu expanded in the center panel. The pipeline item is selected.](media/ss_newpipelinemenu.png "New pipeline")

10. In the Properties blade of the pipeline, name the pipeline **CreateSalesPaymentsParquet**. Optionally collapse the Properties blade.

    ![The Properties pipeline blade displays with the name entered as CreateSalesPaymentsParquet. The Properties button is highlighted.](media/ss_salespaymentpipeline_properties.png "Pipeline properties")

11. In the Activities menu, expand the **Move & Transform** section. Drag-and-drop the **Copy data** activity to the pipeline design canvas. In the General tab of the Copy data activity enter `CopySalesPaymentsAsParquet`.

    ![The Pipeline editor displays with the Move & Transform section expanded in the Activities menu. An arrow indicating a drag-and-drop action denotes a Copy data activity being moved to the design canvas. The General tab is selected and CopySalesPaymentsAsParquet is entered in the Name field.](media/ss_salespayments_pipeline_general.png "Pipeline designer")

12. With the Copy data activity selected, choose the **Source** tab. Select **sales_payments_full** as the **Source dataset**.

    ![The Copy data activity Source tab displays with the Source dataset set to sales_payments_full.](media/ss_salespayments_pipeline_source.png "Copy data Source tab")

13. With the Copy data activity selected, choose the **Sink** tab. Select **sales_payment_full_parquet** as the **Sink dataset**.

    ![The Copy data activity Sink tab displays with the Sink dataset set to sales_payment_full_parquet.](media/ss_salespayments_pipeline_sink.png "Copy data Sink tab")

14. With the Copy data activity selected, choose the **Settings** tab. Check the **Enable staging** checkbox, then select **datalake** for the **Staging account linked service** and enter `staging` in the **Storage Path** field.

    ![The Settings tab is highlighted with the Enable staging checkbox checked and datalake selected as the Storage account linked service. The Storage Path field is populated with the value staging.](media/ss_copydata_enablestaging.png "Copy data Settings tab")

15. On the Synapse Studio toolbar menu, select **Publish all**. Select **Publish** on the verification blade.

    ![The Synapse Studio toolbar menu displays with the Publish all button highlighted.](media/ss_publishall.png "Publish all")

16. Once published, expand the **Add trigger** item on the pipeline toolbar and select **Trigger now**. Select **OK** on the Pipeline run blade.

    ![The pipeline toolbar menu displays with the Add trigger menu expanded and the Trigger now item selected.](media/ss_pipelinetriggernow.png "Trigger pipeline")

17. Use the **Monitor** hub to ensure the pipeline run successful completion.

    ![The Monitor hub pipeline runs displays indicating the successful completion of the CreateSalesPaymentsParquet pipeline.](media/ss_createsalespaymentsparquet_pipelinesucceeded.png "Successfully completed pipeline")

## Exercise 5: Train a regression model to predict incoming cashflow using Azure Machine Learning Studio

Estimated time: 50 minutes

### Task 1: Retrieve the access key for the Azure Data Lake Storage account

1. In the Azure Portal, open the lab resource group **mcw_sap_plus_extend_and_innovate** then search for and select the Storage account **sapadls{SUFFIX}**.

    ![The resource group listing displays with the sapadls{SUFFIX} Storage account resource selected.](media/ap_adlsrglist.png "Resource group listing")

2. From the left menu, select **Access keys**. Below the **key1** heading, select the **Show** button next to the Key field. Use the Copy button in the field to record this value for a future task.

    ![The Access keys screen displays for the storage account with the copy button next to the key1 Key field highlighted.](media/ap_adlsaccesskeycopy.png "Copy key1 Key value")

### Task 2: Create an Azure Machine Learning datastore

1. In the Azure Portal, open the lab resource group **mcw_sap_plus_extend_and_innovate** then search for and select the Azure Machine Learning resource **sap-mcw-ml-ws**.

    ![The resource group listing displays with the sap-mcw-ml-ws item highlighted.](media/ap_amlwsrglist.png "Resource Group list")

2. On the Azure Machine Learning Overview screen, select the **Studio web URL** to open the workspace.

    ![The Azure Machine Learning Overview screen displays with the Studio web URL hyperlink selected.](media/ap_launchamlworkspace.png "Launch AML Studio")

3. From the left menu, select **Datastores**.

   ![AML Studio displays with Datastores selected from the left menu.](media/amls_datastoremenu.png "AML Studio menu")

4. On the Datastores screen, select **+ New datastore** from the toolbar menu.

    ![The Datastores screen displays with the + New datastore button highlighted.](media/amls_newdatastore_menu.png "New datastore")

5. On the New datastore blade, fill the form as follows then select **Create**.

    | Field | Value |
    |-------|-------|
    | Datastore name | Enter `sales_payments_full_adls`. |
    | Datastore type | Select **Azure Blob Storage**. |
    | Account selection method | Select **From Azure subscription**. |
    | Subscription ID | Select the lab subscription. |
    | Storage account | Select **sapadls{SUFFIX}(mcw_sap_plus_extend_and_innovate)**. |
    | Blob container | Select **sales-payment-parquet** |
    | Save credentials with the datastore for data access | Select **Yes**. |
    | Authentication type | Select **Account key**. |
    | Account key | Enter the storage account key obtained in the previous task. |
    | Use workspace managed identity for data preview and profiling in Azure Machine Learning studio | Select **No**. |

    ![The New datastore blade displays with a form populated with the preceding values.](media/amls_newdatastoreform.png "New datastore")

### Task 3: Create and run an Automated ML job

1. In Azure Machine Learning studio, select **Automated ML** from the left menu.

    ![A portion of the left menu of Azure Machine Learning studio displays with the Automated ML item highlighted.](media/amls_automatedml_menu.png "Automated ML")

2. On the Automated ML screen, select **+ New Automated ML job** from the toolbar menu.

    ![The Automated ML screen toolbar menu displays with the + New Automated ML job button highlighted.](media/amls_newautomlrun_menu.png "New Automated ML job")

3. On the Create a new Automated ML job Select a data asset step, expand the **Create** menu and select **From datastore**.

    ![The Create a new Automated ML job screen displays with the Create menu expanded and the From datastore item highlighted.](media/amls_automl_createnewdatasetmenu.png "Create data asset from datastore")

4. On the Create dataset from datastore blade Basic info step, name the dataset `sap-sales-payments-full`. Select **Next**.

    ![The Create dataset from datastore blade displays with sap-sales-payments-full entered in the Name field.](media/amls_dataset_basicinfo.png "New dataset Basic info")

5. On the Create dataset from datastore blade Datastore selection step, select the **sales_payment_full_adls** datastore then use the **Browse** button to select **dbo.SalesPaymentsFull.parquet** file for the **Path** field. Select **Next**.

    ![The Create dataset from datastore blade displays with sales_payment_full_adls selected as the datastore and dbo.SalesPaymentsFull.parquet entered in the Path field. The Browse button is highlighted.](media/amlms_dataset_datastoreselection.png "New dataset Datastore selection")  

6. On the Create dataset from datastore blade Settings and preview step, ensure you see data in the table, and select **Next**.

   ![The Create dataset from datastore blade displays with tabular data.](media/amls_dataset_settingsandpreview.png "Preview data")

7. On the Create dataset from datastore blade Schema step, toggle the following fields off so that they are not included in the dataset then select **Next**:
   1. SALESDOCUMENT
   2. BILLINGDOCUMENTDATE
   3. PAYMENTDATE
   4. SALESGROUP
   5. SALESOFFICE

    ![A portion of the Schema step screen displays with the specified fields toggled to not be included.](media/amls_dataset_schema.png "Dataset Schema")

8. On the Create dataset from datastore blade Confirm details step, select **Create**.

9. On the Select data asset step of the Create a new Automated ML job screen, refresh the data asset table.

10. On the Select data asset step, select **sap-sales-payments-full** from the list and select **Next**.

    ![The Select data asset screen displays with the sap-sales-payments-full item selected.](media/amls_automlrun_selectdataset_sap.png "Select data asset")

11. On the Configure job step, select the **+ New** button below the **Select Azure ML compute cluster** field.

    ![The Select Azure ML compute cluster field displays with the + New button highlighted.](media/amls_newcomputecluster_button.png "Create new Compute cluster")

12. On the Create compute cluster blade Virtual machine step, accept the defaults and select **Next**.

13. On the Create compute cluster blade Advanced settings, fill the form as follows then select **Create**. It takes a few moments for the  

    | Field | Value |
    |-------|-------|
    | Compute name | Enter `automlcompute`. |
    | Maximum number of nodes | Enter `3`. |

    ![The Compute cluster Advanced Settings displays with automlcompute entered in the Compute name and the Maximum number of nodes is set to three.](media/amls_compute_advancedsettings.png "Compute cluster Advanced Settings")

14. On the Configure job step, fill the form as follows, then select **Next**.

    | Field | Value |
    |-------|-------|
    | Experiment name | Enter `predict-incoming-cashflow`. |
    | Target column | Select **PAYMENTDELAYINDAYS**. |
    | Select compute type | Select **Compute cluster**. |
    | Select Azure ML compute cluster | Select **automlcompute**. |

    ![The Configure job step displays with a form populated with the preceding values.](media/amls_configurejob.png "Configure job")

15. On the Select task and settings step, select **Regression**, then select **View additional configuration settings**.

    ![The Select task and settings step displays with the Regression item checked and the View additional configuration settings link highlighted.](media/amls_selecttaskandsettings.png "Select task and settings step")

16. On the Additional configurations blade, select the Primary metric of **Normalized root mean squared error**, then expand the Blocked models drop down and check the following items and select **Save**. This will reduce the time to train the model.
    1. ElasticNet
    2. GradientBoosting
    3. KNN
    4. LassoLars
    5. SGD
    6. RandomForest
    7. ExtremeRandomTrees
    8. LightGBM
    9. FastLinearRegressor
    10. OnlineGradientDescentRegressor

    ![The Additional configurations blade displays with Normalized root mean squared error selected as the Primary metric and the Blocked models expanded with the above items checked.](media/amls_jobadditionalconfigurations.png "Additional configurations")

17. Select **Next** on the Select task and settings step. On the Validate and test step, select **Finish**. The job is then created and opened in the browser. Use the **Refresh** button to monitor the current state.

    ![The Automated ML job screen displays with a status of Running. The Refresh button is highlighted.](media/amls_automljob_running.png "Running Automated ML job")

    > **Note**: Training will take approximately 15 minutes. Proceed to [Exercise 7](#exercise-7-visualize-historical-data-with-power-bi) and return here once completed.

### Task 4: Deploy the best model as a web service

1. Once the Automated ML job indicates a status of **Completed**, in the Best model summary card on the screen, select the link beneather the **Algorithm name** heading.

    ![The Automated ML job screen displays with a Status of Completed. The link below Algorithm name is highlighted.](media/amls_automljob_complete.png "Completed Automated ML job")

2. On the Model screen, expand the **Deploy** item in the toolbar menu and select **Deploy to web service**.

    ![The Model screen displays with the Deploy item expanded in the toolbar menu and teh Deploy to web service option highlighted.](media/amls_model_deploy_menu.png "Deploy model as web service")

3. On the Deploy a model blade, fill the form as follows then select **Deploy**.

    | Field | Value |
    |-------|-------|
    | Name | Enter `predict-incoming-cashflow-svc`. |
    | Compute type | Select **Azure Container Instance**. |

    ![The Deploy a model blade displays with a form populated with the preceding values.](media/amls_model_deploy_settings.png "Deploy a model")

4. On the Model screen, monitor the Deploy status at the bottom of the Model summary card. It will indicate a status of **Completed** in a few minutes time.

    ![The Model screen displays with the Deploy status indicating Running.](media/amls_modelsvc_deploying.png "Model deployment status")

5. Select the link below **Deploy status** to go to the deployed service endpoint screen.

6. On the predict-incoming-cashflow-svc endpoint screen, select the **Test** tab. Replace the contents of the input data with the following and select **Test**.

    ```json
    {
        "Inputs": {
            "data": [
            { 
                "CUSTOMERNAME": "Westend Cycles",
                "CUSTOMERGROUP": "Z1",
                "BILLINGCOMPANYCODE": 1710,
                "CUSTOMERACCOUNTGROUP": "KUNA",
                "CREDITCONTROLAREA": "A000",
                "DISTRIBUTIONCHANNEL": 10,
                "ORGANIZATIONDIVISION": 0,
                "SALESDISTRICT": "US0003",
                "SALESORGANIZATION": 1710,
                "SDDOCUMENTCATEGORY": "C",
                "CITYNAME": "RALEIGH",
                "POSTALCODE": "27603"
            },
            { 
                "CUSTOMERNAME": "Skymart Corp",
                "CUSTOMERGROUP": "Z2",
                "BILLINGCOMPANYCODE": 1710,
                "CUSTOMERACCOUNTGROUP": "KUNA",
                "CREDITCONTROLAREA": "A000",
                "DISTRIBUTIONCHANNEL": 10,
                "ORGANIZATIONDIVISION": 0,
                "SALESDISTRICT": "US0004",
                "SALESORGANIZATION": 1710,
                "SDDOCUMENTCATEGORY": "C",
                "CITYNAME": "New York",
                "POSTALCODE": "10007"
            }
            ]
        },
        "GlobalParameters": 1.0
    }
    ```

    ![The predict-incoming-cashflow-svc endpoint screen displays with the test data in the text box. The results of the call are also displayed.](media/amls_endpoint_test.png "Test service deployment endpoint")

## Exercise 6: Train a regression model to predict incoming cashflow using Azure Synapse Analytics (OPTIONAL)

Estimated time: 50 minutes

### Task 1: Create the SalesPaymentsFull Spark table from the parquet file

1. In Synapse Studio, select the **Data** hub, then choose the **Linked** tab from the center pane. Expand the **Azure Data Lake Storage Gen2** item followed by the **datalake** account. Select the **sales-payment-parquet** container. In the data explorer tab, right-click on the **dbo.SalesPaymentsFull.parquet** and expand **New notebook** then choose the **New Spark table** item.

    ![Synapse Studio displays with the Data hub selected. The Linked tab is selected from the center pane. The Azure Data Lake Storage Gen2 and datalake items are expanded. The sales-payments-parquet container is selected. In the data explorer tab the context menu on the dbo.SalesPaymentsFull.parquet file displays with the New notebook item expanded and New Spark table selected.](media/ss_datahub_newsparktable.png "New Spark table")

2. This will open a notebook with some code scaffolded. In the Notebook toolbar, select to Attach to **SparkPoolSmall**. In the code cell, change the table name that is being saved to `default.SalesPaymentsFull`. Select the **Run all** button from the toolbar. **Note**: It will take a few minutes for the Spark cluster to be provisioned.

    ![A Synapse notebook displays with code to create a new Spark table scaffolded.](media/ss_createsparktablenotebook.png "Spark notebook")

### Task 2: Create an Azure Machine Learning linked service

1. In Synapse Studio, select the **Manage** hub, then choose **Linked services** from the center menu. Select **+ New** in the Linked services screen toolbar menu.

    ![The Manage Hub displays with the Linked services item selected. The + New button is highlighted on the Linked services screen toolbar.](media/ss_newlinkedservicemenu.png "New Linked service")

2. In the New linked service blade, search for and select **Azure Machine Learning**. Select **Continue**.

    ![The New linked service blade displays with Azure Machine Learning entered in the search box and selected from the results.](media/ss_newamllinkedsvc_menu.png "New Azure Machine Learning linked service")

3. Fill the New linked service - Azure Machine Learning form as follows, then select **Create**.

    | Field | Value |
    |-------|-------|
    | Name | Enter `cashflow_aml`. |
    | Azure Subscription | Select the lab subscription. |
    | Azure Machine Learning workspace name | Select **sap-mcw-ml-ws** |

    ![The New linked service blade displays with a form populated with the preceding values.](media/ss_linkedservice_aml_form.png "New Azure Machine Learning linked service form")

4. On the Synapse Studio toolbar menu, select **Publish all**. Select **Publish** on the verification blade.

    ![The Synapse Studio toolbar menu displays with the Publish all button highlighted.](media/ss_publishall.png "Publish all")

### Task 3: Train a new regression model for incoming cash flow

1. In Synapse Studio, select the **Data** hub, select the **Workspace** tab. Expand the **Lake database** section. Expand the **default** database and **Tables**. Right-click on the **salespaymentsfull** table, and expand the **Machine Learning** item and choose **Train a new model**.

    ![Synapse Studio displays with the Data Hub selected. The Workspace tab is selected with the Lake database, default, and Tables items expanded. The context menu on the ssalespaymentsfull table is expanded with Machine Learning expanded and Train a new model item selected.](media/ss_mltrainmodel_menu.png "Train a new model from a Spark table")

2. In the Train a new model blade, select **Regression** then **Continue**.

    ![The Train a new model blade displays with the Regression item highlighted.](media/ss_trainanewmodel_regressionselection.png "Train a new Regression model")

3. On the Train a new model (Regression) blade, select **PAYMENTDELAYINDAYS** for the **Target column** field. Ensure the Azure Machine Learning workspace is set to **sap-mcw-ml-ws** and the Apache Spark pool field is set to **SparkPoolSmall**. Select **Continue**.

    ![The Train a new model (Regression) blade displays with the PAYMENTDELAYINDAYS column selected as the Target column. sap-mcw-ml-ws is selected in the Azure Machine learning workspace field and SparkPoolSmall is selected in the Apache Spark pool field.](media/ss_trainnewregressionmodel_targetcolumn.png "Regression Target Column selection")

4. On the Train a new model (Regression) blade, select **Normalized root mean squared error** as the Primary metric and set the Maximum training job time (hours) to `0.25`. Enable the ONNX model compatibility option. Select **Open in notebook**.

    ![The Train a new model (Regression) blade displays with a form populated as described. The Open in notebook button is highlighted.](media/ss_amlopeninnotebook.png "Open in notebook")

5. In the scaffolded notebook, change the SQL query in the third code cell (line 1) to the following. This will reduce the number of columns being used to train the model.

    ```SQL
    SELECT CUSTOMERNAME, CUSTOMERGROUP, BILLINGCOMPANYCODE, CUSTOMERACCOUNTGROUP,    CREDITCONTROLAREA, DISTRIBUTIONCHANNEL, ORGANIZATIONDIVISION, SALESDISTRICT,SALESORGANIZATION, SDDOCUMENTCATEGORY, CITYNAME, POSTALCODE, PAYMENTDELAYINDAYS FROM default.salespaymentsfull
    ```

    ![A portion of the scaffolded notebook displays with the SQL query replaced in the third cell.](media/ss_notebook_trainregressionmodel_querycell.png "Scaffolded AML notebook")

6. From the notebook toolbar menu, select **Run all** to execute all cells in the notebook. This notebook registers the dataset with Azure Machine Learning and creates an AutoML experiment to determine the best model to determine the incoming cashflow via predicting the payment delay in days. The best model is then registered with the Azure Machine Learning workspace.

    > **Note**: this notebook will run for approximately 20 minutes. Proceed to [Exercise 7](#exercise-7-visualize-historical-data-with-power-bi) and return here once completed.

7. Once the notebook has completed running, the output of the last cell will indicate the best model that is registered in the Azure Machine Learning workspace.

    ![The output of the final cell of the Synapse notebook displays with the registered model highlighted.](media/ss_amlnotebook_regmodeloutput.png "Azure Machine Learning registered best model")  

### Task 4: Deploy and test the regression model in the dedicated SQL pool

1. In Synapse Studio, select the **Develop** hub from the left menu, then expand the **+** menu from the center pane and choose **SQL script**.

    ![Synapse Studio displays with the Develop hub selected in the left menu and the + menu expanded in the center pane. The SQL script item is highlighted.](media/ss_develophub_newsqlscript.png "New SQL script")

2. In the SQL script tab, choose to connect to the **sapdatasynsql** dedicated SQL pool in the toolbar menu.

    ![The SQL Script tab displays with the sapdatasynsql database chosen in the Connect to field.](media/ss_sqlscript_connectto_sapdatasynsql.png "Connect to the dedicated SQL pool database")

3. In the SQL script editor, paste and run the following SQL command to create and populate a table with model test data. The **Run** button is located in the SQL script toolbar menu.

   ```SQL
   CREATE TABLE cashflow_prediction_tests
    (
        [CUSTOMERNAME] [nvarchar](80)  NULL,
        [CUSTOMERGROUP] [nvarchar](2)  NULL,
        [BILLINGCOMPANYCODE] [nvarchar](4)  NULL,
        [CUSTOMERACCOUNTGROUP] [nvarchar](4)  NULL,
        [CREDITCONTROLAREA] [nvarchar](4)  NULL,
        [DISTRIBUTIONCHANNEL] [nvarchar](2)  NULL,
        [ORGANIZATIONDIVISION] [nvarchar](2)  NULL,
        [SALESDISTRICT] [nvarchar](6)  NULL,
        [SALESORGANIZATION] [nvarchar](4)  NULL,
        [SDDOCUMENTCATEGORY] [nvarchar](4)  NULL,
        [CITYNAME] [nvarchar](35)  NULL,
        [POSTALCODE] [nvarchar](10)  NULL
    );

    INSERT INTO cashflow_prediction_tests VALUES ('Westend Cycles', 'Z1', '1710', 'KUNA','A000', '10', '0', 'US0003', '1710','C', 'RALEIGH', '27603');
    INSERT INTO cashflow_prediction_tests VALUES ('Skymart Corp', 'Z2', '1710', 'KUNA','A000', '10', '0', 'US0004', '1710','C', 'New York', '10007');
   ```

4. Select the **Data** hub from the left menu, ensure the **Workspace** tab is selected in the center pane. Expand **SQL database**, the **sapsynsql** database and the **Tables** items. Right-click the newly created **dbo.cashflow_prediction_tests** table and expand the **Machine Learning** item and select **Predict with a model**.

    ![The Synapse Studio Data hub displays with the SQL database section expanded. The sapdatasynsql database is expanded with the context menu showing on the dbo.cashflow_prediction_tests table. From the context menu, the Machine Learning item is expanded with the Predict with a model item selected.](media/ss_predictwithmodelmenu.png "Predict with a model")

5. On the Predict with a model blade, select the pre-trained model that was created in the previous task then select **Continue**.

   ![The pre-trained model listing displays with the model trained in the previous task selected.](media/ss_pretrianedmodelselection.png "Select pre-trained model")

6. On the Predict with a model blade, keep all the mappings at their default values and select **Continue**.

    ![The column mappings display on the Predict with a model blade. The Continue button is highlighted.](media/ss_modelmapping.png "Model column mappings")

7. On the Predict with a model blade, fill the database form as follows then select **Deploy model + open script**. This will create a table to hold the trained models as well as encapsulate the calling of the model with a stored procedure.

    | Field | Value |
    |-------|-------|
    | Script type | Select **Stored procedure**. |
    | Stored procedure name | Enter `[dbo].[predict_cashflow]`. |
    | Database table | Select **Create new**. |
    | New table | Enter `[dbo].[ml_models]`. |

    ![The Predict with a model blade displays with a form populated with the preceding values. The Deploy model + open script button is highlighted.](media/ss_dbmodelspec.png "Deploy model to the database")

8. A script window opens with a query to create the stored procedure that leverages the trained regression model using the dbo.cashflow_prediction_tests table as input. At the end of the script the stored procedure is executed. The resulting values will include the predicted payment delay in days for each row in the **variable_out1** column. Execute the generated script and view the results.

    ![The SQL Query results window displays with the variabl_out1 column highlighted.](media/ss_modelpredictresult.png "Predicted days late for each test case")

## Exercise 7: Visualize historical data with Power BI

Estimated time: 40 minutes

Contoso Retail would like to gain insights into historical sales order and payments data.

### Task 1: Retrieve the database connection information for the dedicated SQL pool

1. In Synapse Studio, open the **Manage** hub from the left menu, choose **SQL pools** from the center menu and select the **sapdatasynsql** dedicated SQL pool from the list.

    ![Synapse Studio displays with the SQL pools item selected in the center pane. The sapdatasynsql dedicated SQL pool item is highlighted in the database listing.](media/ss_sqlpools_list.png "SQL pools listing")

2. On the Properties blade, record the values for the **Name** and **Workspace SQL endpoint** fields.

    ![The Properties blade of the dedicated SQL pool displays with the Name field value highlighted and the copy button selected next to the Workspace SQL endpoint field.](media/ss_dedicatedsqlpool_properties.png "Dedicated SQL pool properties")

### Task 2: Import data into Power BI

1. Open **Power BI Desktop**. On the splash screen, select the **Get Data** item.

    ![A portion of the Power BI Desktop splash screen displays with the Get Data item highlighted.](media/pbi_getdatamenu_splash.png "Power BI Desktop splash screen")

2. On the Get Data dialog, select **Azure** from the left menu and select **Azure Synapse Analytics SQL** from the listing. Select the **Connect** button.

    ![The Get Data dialog displays with Azure selected from the left menu and the Azure Synapse Analytics SQL item chosen from the listing. The Connect button is highlighted.](media/pbi_getdata_synapsemenu.png "Get Data")

3. On the SQL Server database dialog, populate the form as follows and select **OK**.

    | Field | Value |
    |-------|-------|
    | Server | Enter the **Workspace SQL endpoint** value recorded in the previous task. |
    | Database | Enter the **Name** value recorded in the previous step. |
    | Data Connectivity mode | Select **Import**. |

    ![The SQL Server database dialog displays populated with the preceding value.](media/pbi_sqlserverconn_dialog.png "SQL Server database connection information")

4. An authentication dialog displays, select **Microsoft account** from the left menu, then select the **Sign in** button. Authenticate with your Azure credentials.

    ![The SQL Server database authentication window displays with Microsoft account selected from the left menu and the Sign in button highlighted.](media/pbi_sqlauth_dialog_signin.png "Sign in with Microsoft account")

5. Once signed in, select the **Connect** button on the dialog.

6. On the Navigator dialog, check the box next to all three tables, then select the **Transform Data** button.

    ![The Navigator dialog displays with the checkbox checked next to all three tables. The Transform Data button is highlighted.](media/pbi_navigatorseltables_transform.png "Navigator dialog")

7. The columns in the tables representing sales order numbers were incorrectly interpreted as strings by Power BI. In the Power Query editor screen, select **SalesOrderItems** from the Queries pane, then right-click on the **SalesOrder** field and expand the **Change Type** item and choose **Whole Number**.

    ![The Power Query editor screen displays with the SalesOrderItems table selected in the Queries pane and the context menu displaying for the SalesOrder field. The Change Type item is expanded in the context menu with the Whole Number item selected.](media/pbi_changetype_menu.png "Change column type")

8. Repeat the previous step, this time changing the type of the following table columns to Whole Number.

    | Table (Queries pane) | Column |
    |-------|-------|
    | SalesOrderHeaders | SALESDOCUMENT |
    | Payments | SalesOrderNr |

9. Select **Close & Apply** in the Power Query editor toolbar.

    ![A portion of the Power Query editor toolbar displays with teh Close & Apply button highlighted.](media/pbi_closeapply_powerqueryeditor.png "Close & Apply")

### Task 3: Create the relational model

1. From the left menu, select the **Model** item. This will switch to the Model view.

    ![The left menu of Power BI Desktop diaplays with the Model item highlighted.](media/pbi_modelmenuitem.png "Switch to Model view")

2. On the Model design canvas, drag the SALESDOCUMENT field from the SalesOrderHeaders table and drop it on the SalesOrder field of the SalesOrderItems table. This establishes a one-to-many relationship (1:*) between the tables.

    ![The Model design canvas displays with the SALESDOCUMENT field highlighted in the SalesOrderHeaders table and the SalesOrder field highlighted in the SalesOrderItems table. A one-to-many relationship displays between the two tables.](media/pbi_rel_headertoitems.png "One-to-many relationship between SalesOrderHeaders and SalesOrderItems")

3. On the Model design canvas, drag the SalesOrderNr field from the Payments table and drop it on the SALESDOCUMENT field in the SalesOrderHeaders table. This establishes a one-to-one relationship (1:1) between the tables.

   ![The Model design canvas displays with the SalesOrderNr field highlighted in the Payments table and the SALESDOCUMENT field highlighted in the SalesOrderHeaders table. A one-to-one relationship displays between the two tables.](media/pbi_rel_paytoheader.png "One-to-one relationship between Payments and SalesOrderHeaders")

### Task 4: Create a sales per data and customer group visualization

1. In the Visualizations pane, select **Stacked column chart**.

2. From the **Fields** pane, drag-and-drop the SalesOrderHeaders.CREATIONDATE field to the X-axis box, the SalesOrderHeaders.TOTALNETAMOUNT field to the Y-axis box and the SalesOrderHeaders.CUSTOMERGROUP field to the Legend box.

    ![The Power BI Visualization pane displays with Stacked column chart selected as the selected visualization and the settings populated with the previously mentioned values.](media/pbi_visualizationspane_salesbyyearandcustomergroup.png "Visualization pane")

3. Adjust the sizing of the chart on the report canvas as desired.

    ![The report canvas displays with a stacked column chart representation of the total sales by customer group.](media/pbi_salesbydataandcustomergroup_chart.png "Total sales by customer group chart")

### Task 5: Create a sales per region and customer group visualization

1. In the Visualizations pane, select **Map**.

2. From the **Fields** pane, drag-and-drop the SalesOrderHeaders.CITYNAME field to the Location box, the SalesOrderHeaders.CUSTOMERGROUP field to the Legend box and the SalesOrderHeaders.TOTALNETAMOUNT to the Bubble size box.

   ![The Visualizations pane displays with the Map visualization selected, the associated form is populated as described above.](media/pbi_mapvispane.png "Map visualization settings")

    > **Note**: Map visuals are disabled by default, access File -> Options and Settings -> Options -> Global - Security to enable. After updating Options in Power BI, you may need to close and reopen the report for the settings change to take effect.
    > ![Power BI Options display with Security selected beneath the Global heading and the Map and Filled Map visuals option checked. The OK button is highlighted.](media/pbi_optionsenablemap.png "Power BI Options")

3. Adjust the sizing and zoom of the map on the report canvas as desired.

    ![The total sales by city name and customer group map visualization displays.](media/pbi_salesbycitybycustomergroup_map.png "Map visualization")

### Task 6: Create a payments per date and customer group visualization

1. In the Visualizations pane, select **Stacked Column Chart**.

2. From the **Fields** pane, drag-and-drop the Payments.PaymentDate field to the X-axis box, the Payments.PaymentValue field to the Y-axis box and the SalesOrderHeaders.CUSTOMERGROUP field to the Legend box.

    ![The Power BI Visualization pane displays with Stacked column chart selected as the selected visualization and the settings populated with the previously mentioned values.](media/pbi_vispane_paymetnsbydatebycustomergroup.png "Visualization pane")

3. Adjust the sizing of the chart on the report canvas as desired.

    ![The payments per date and customer group chart.](media/pbi_paymentsperdateandcustomergroup.png "Stacked column chart visualization")

### Task 7: Create a sales per customer group and material group visualization

1. In the Visualizations pane, select **Stacked Bar Chart**.

2. From the **Fields** pane, drag-and-drop the SalesOrderHeaders.CUSTOMERGROUP field to the Y-axis box, the SalesOrderItems.NetAmount field to the Y-axis box and the SalesOrderItems.MaterialGroup field to the Legend box.

    ![The Power BI Visualization pane displays with Stacked bar chart selected as the selected visualization and the settings populated with the previously mentioned values.](media/pbi_stackedbar_vispane.png "Visualization pane")

3. Adjust the sizing of the chart on the report canvas as desired.

    ![The sales per customer group and material group chart.](media/pbi_stackedbarchart.png "Stacked bar chart visualization")

### Task 8: Create a payment offset per customer group visualization

This report shows the average number of days by which each customer group pays their SalesOrders. Afterwards a comparison can be made with the outcome of the Machine Learning Model built in the next exercise. SalesOrderHeaders and the Payment data are combined to calculate the number of days between the billing date and the payment date.

1. In Power BI Desktop, expand the **Transform data** item on Home tab toolbar menu. Select **Transform data**.

   ![The Home tab is selected with the Transform data item expanded. The Transform data item is selected from the expanded menu.](media/pbi_transformdatamenu.png)

2. In the Power Query Editor window, select the **SalesOrderHeaders** table from the Queries pane, and expand the **Merge Queries** option on the Home toolbar menu. Select the **Merge Queries as New** option.

    ![The Power Query Editor displays with the SalesOrderHeaders table selected in the Queries pane and the Merge Queries menu expanded with the Merge Queries as New option selected.](media/pbi_mergequeriesasnewmenu.png "Power Query Editor")  

3. In the Merge window, select the SALESDOCUMENT column of the SalesOrderHeaders table. Select the **Payments** table as the second table, and select the SalesOrderNr field. Select **OK**.

    ![The Merge window displays with the SALESDOCUMENT column selected. The Payments table is selected as the second table with the SalesOrderNr field highlighted. The OK button is highlighted.](media/pbi_mergequerieswindow.png "Merge Queries Window")

4. Rename the Merge query by right-clicking the Merge query in the Queries pane, and selecting **Rename**. Name the merged query **SalesOrderPayments**.

5. With the SalesOrderPayments query selected, scroll the table completely to the right. Expand the **Payments** column menu, and choose to include the following fields: **PaymentNr**, **PaymentDate**, **PaymentValue** and **Currency**. Select **OK**.

    ![The Power Query Editor screen displays with the SalesOrderPayments query selected in the Queries pane. The data table is scrolled to the right, and the Payments column menu is expanded with the previously mentioned columns checked. The OK button is highlighted.](media/pbi_includepaymentscolumns.png "Include columns")

6. Select **Close & Apply** in the Power Query editor toolbar.

    ![A portion of the Power Query editor toolbar displays with teh Close & Apply button highlighted.](media/pbi_closeapply_powerqueryeditor.png "Close & Apply")

7. From the report designer, expand the **Transform data** item on Home tab toolbar menu. Select **Transform data**.

   ![The Home tab is selected with the Transform data item expanded. The Transform data item is selected from the expanded menu.](media/pbi_transformdatamenu.png)

8. In the Power Query Editor window, select the **SalesOrderPayments** table from the Queries pane. A new column is required to calculate the difference between the billing date and the actual payment data. Select the **Add Column** tab and select the **Custom Column** button on the toolbar menu.

    ![The Power Query Editor window displays with the Add Column tab selected and the Custom Column button highlighted. The SalesOrderPayments table is selected in the Queries pane.](media/pbi_customcolumnmenu.png "Add Custom Column")

9. In the Custom Column window, enter `Offset` for the New column name. In the Custom column formula field, enter the following formula. Select **OK**.

    ```vb
    Duration.Days([PaymentDate] - [BILLINGDOCUMENTDATE])
    ```

    ![The Custom Column window displays with the new column name of Offset. The previously mentioned formula is populated in the Custom column formula textbox.](media/pbi_customcolumn_offset.png)

10. In the table, right-click on the newly created Offset field and expand the **Change Type** option. Select **WholeNumber** to convert this column to integer.

    ![The context menu of the Offset column displays with the Change Type option expanded. Whole Number is selected from the expanded menu.](media/pbi_changeoffsetcolumntoint.png "Convert Offset column to integer")

11. Return to the Home tab and select **Close & Apply** in the Power Query editor toolbar.

    ![A portion of the Power Query editor toolbar displays with teh Close & Apply button highlighted.](media/pbi_closeapply_powerqueryeditor.png "Close & Apply")

12. On the report canvas, add a **Stacked Column** chart. Drag-and-drop the SalesOrderPayments.CUSTOMERGROUP to the X-axis box and SalesOrderPayments.Offset to the Y-axis box. Expand the chevron menu next to the Offset column and choose to report the **Average**.

    ![The Visualization pane displays with the Stacked Column visualization selected. CUSTOMERGROUP is found the X-axis field and the Average of Offset is found in the Y-axis field. The chevron is expanded on the Offset field to show Average is selected from the list of options.](media/pbi_offset_vispane.png "Stacked Column chart settings")

13. Adjust the sizing of the chart on the report canvas as desired.

    ![The Average of Offset by CUSTOMERGROUP stacked column chart displays.](media/pbi_avgoffsetbycustomergroup_chart.png "Stacked column chart")

### Task 9: Create a payment offset per customer group box plot visualization (Optional)

A box plot can provide a more detailed view of the payment offset by customer group data.

1. In the Visualizations pane, expand the ellipsis menu and select **Get more visuals**.

    ![The Visualizations pane displays with the ellipsis menu expanded and the Get more visuals option selected.](media/pbi_visualizationspane_ellipsis_getmorevisuals.png "Get more visuals")

2. On the Power BI visuals window, search for **Box and Whisker**. Then choose the **Box and Whisker chart** by DataScenarios.

    ![The Power BI visuals window displays with Box and Whisker entered in the search box and the Box and Whisker chart by DataScenarios highlighted.](media/pbi_boxandwhisker_search.png "Search for Box and Whisker")

3. On the AppSource window, select the **Add** button to add the Box and Whisker chart.

    ![The AppSource window displays with the Add button highlighted.](media/pbi_addboxandwhisker.png "Add Box and Whisker chart")

4. On the Visualizations pane, select the newly added **Box and Whisker** chart. In the Category field, drag-and-drop the SalesOrderPayments.CUSTOMERGROUP, SalesOrderPayments.Offset into the Sampling field, and SalesOrderPayments.Offset into the Value field. Expand the chevron menu in the Value field and select the **Average** option.

    ![The Visulization pane displays with the Box and Whisker visual selected. SalesOrderPayments.CUSTOMER group is found in the Category box, SalesOrderPayments.Offset is found in the Sampling and Value boxes. The chevron menu next to the Value field is expanded with Average selected from the options.](media/pbi_boxwhisker_settings.png "Box and Whisker chart")

5. Adjust the sizing of the chart on the report canvas as desired.

    ![The box plot chart displays.](media/pbi_boxplot.png "Box plot visualization")

    > **Note**: From this diagram you can see that:

    > - CustomerGroup1 pays within 70 days +/- 10 days
    > - CustomerGroup2 pays within 30days +/- 5 days
    > - Other customergroups pay after 10 days

6. Keep this report open in Power BI desktop for future exercises.

## Exercise 8: Integrate Azure Machine Learning and Power BI

Estimated time: 25 minutes

Contoso retail would like to augment their Power BI report with data enriched with predictions from the machine learning model trained in [Exercise 5](#exercise-5-train-a-regression-model-to-predict-incoming-cashflow-using-azure-machine-learning-studio) to predict incoming cashflow.

### Task 1: Add the deployed model to the Power BI report

1. On the Power BI report, expand the **Transform data** item on Home tab toolbar menu. Select **Transform data**.

   ![The Home tab is selected with the Transform data item expanded. The Transform data item is selected from the expanded menu.](media/pbi_transformdatamenu.png)

2. In the Power Query Editor window, select the **SalesOrderPayments** table from the Queries pane and select the **Azure Machine Learning** item from the Home toolbar menu.

    ![The Power Query Editor displays with SalesOrderPayments table selected in the Queries pane. The Azure Machine Learning item is selected in the Home toolbar menu.](media/pbi_aml_menu.png "Power Query Editor")

3. In the Azure Machine Learning Models dialog, select the **AzureML.predict-incoming-cashflow-svc** item, then select **OK**.

    ![The Azure Machine Learning Models screen displays with the AzureML.predict-incoming-cashflow-svc selected and the OK button is highlighted.](media/pbi_selectamlmodel.png "Azure Machine Learning Models")

    > **Note**: If the **Information is required about data privacy** message appears, select **Continue**, then check the checkbox to Ignore Privacy Levels, select **Save**.

4. In the Power Query Editor, with the SalesOrderPayments table selected in the Queries pane, scroll all the way to the right of the displayed table. Right-click the **AzureML.predict-incoming-cashflow-svc** field menu and choose to rename the field `predOffset`.

    ![The Power Query Editor window displays with SalesOrderPayments selected in the left menu. The tabular data is scrolled to the right and the context menu on the AzureML.predict-incoming-cashflow-svc expanded with the Rename option selected.](media/pbi_renameamlcolumn.png "Rename the new column")

5. Right-click the **predOffset** column, and expand the **Change Type** option and select **Whole Number**.

    ![The predOffset column displays with it's context menu expanded, the Change Type option is expanded with the Whole Number item selected.](media/pbi_changepredoffsettowholenumber.png "Change column type")

6. On the Power Query Editor, select the **Add Column** tab, select **Custom Column**.

    ![The Power Query Editor displays with the Add Column tab selected and the Custom Column button highlighted.](media/pbi_customcolumn_menu.png "Add Custom Column")

7. On the Custom Column dialog, name the new column `predPaymentDate` and set the formula to the following and select **OK**.

    ```vb
    Date.AddDays([BILLINGDOCUMENTDATE], [predOffset])
    ```

8. Right-click the new predPaymentDate and expand the **Change Type** option and choose **Date**.

    ![The predOffset column displays with it's context menu expanded, the Change Type option is expanded with the Whole Number item selected.](media/pbi_changepredpaymentdatetodate.png "Change Column Type")

9. Select the **Home** tab then **Close & Apply**.

    ![A portion of the Power Query editor toolbar displays with teh Close & Apply button highlighted.](media/pbi_closeapply_powerqueryeditor.png "Close & Apply")

### Task 2: Create a Date table for report aggregation

Contoso retail wants to display the Sales and Payment figures aggregated by different days (BILLINGDOCUMENTDATE, predPaymentDate), this requires the creation of a calendar table with the timeslots by which to aggregate.

1. In Power BI, select the **Data** item from the left menu.

    ![The left menu of Power BI displays with the Data item highlighted.](media/pbi_datamenu.png "Data menu")

2. From the Table tools menu, select **New table**.

    ![The Table tools menu displays with the New table item highlighted.](media/pbi_tabletools_newtable_menu.png "New table")

3. In the formula textbox, paste the following and select the checkmark button to execute the formula and create the table.

    ```vb
    Date= 
    VAR MinYear = YEAR ( MIN ( 'SalesOrderPayments'[CREATIONDATE]) )
    VAR MaxYear = YEAR ( MAX ( 'SalesOrderPayments'[predPaymentDate] ) )
    RETURN
    ADDCOLUMNS (
    FILTER (
    CALENDARAUTO( ),
    AND ( YEAR ( [Date] ) >= MinYear, YEAR ( [Date] ) <= MaxYear )
    ),
    "Calendar Year", "CY " & YEAR ( [Date] ),
    "Year", YEAR ( [Date] ),
    "Month Name", FORMAT ( [Date], "mmmm" ),
    "Month Number", MONTH ( [Date] ),
    "Year & Month", YEAR([Date]) & " - " & FORMAT ( [Date], "mmmm" )
    )
    ```

    ![The new table formula textbox displays with the above code and the checkmark button highlighted.](media/pbi_newtableformula.png "New table formula")

4. From the left menu, select the **Models** option. Establish the following relationships from the **Date.Date** field using drag and drop to the following table.fields:
   1. SalesOrderPayments.CREATIONDATE
   2. SalesOrderPayments.BILLINGDOCUMENTDATE
   3. SalesOrderPayments.PaymentDate
   4. SalesOrderPayments.predPaymentDate

    ![The Models item is selected from the Power BI left menu. The Date.Date field is highlighted as well as the preceding fields in a model diagram.](media/pbi_relationships_date.png "Model diagram")

5. Select the **Data** from the left hand menu once more, and in the Table tools menu select the **New measure** button.

    ![The Data item is selected from the left menu and the New measure button is highlighed in the Table tools menu.](media/pbi_date_newmeasuremenu.png "New measure")

6. In the formula textbox paste the following code then select the checkmark button to execute the formula and create the measure. Verify the new measure displays in the Fields pane.

   ```vb
   Sales at CreationDate = sum('SalesOrderPayments'[TOTALNETAMOUNT])
   ```

    ![The above formula is entered with the checkmark button selected. The new measure is highlighted in the Fields pane.](media/pbi_newmeasure_date.png "New measure formula")

7. Repeat steps 5 and 6 and create new measures with the following formulas.

    ```vb
    Sales at BillingDate = CALCULATE(sum(SalesOrderPayments[TOTALNETAMOUNT]),USERELATIONSHIP('Date'[Date],SalesOrderPayments[BILLINGDOCUMENTDATE]))
    ```

    ```vb
    Payment at Actual Date = CALCULATE(sum('SalesOrderPayments'[PaymentValue]), USERELATIONSHIP('Date'[Date],SalesOrderPayments[PaymentDate]))
    ```

    ```vb
    Payment at pred Date = CALCULATE(sum('SalesOrderPayments'[PaymentValue]), USERELATIONSHIP('Date'[Date], SalesOrderPayments[predPaymentDate]))
    ```

### Task 3: Create the Sales and Payment Forecast visualization

1. From the left menu, select the **Report** item.

    ![The Power BI left menu displays with the Report item highlighted.](media/pbi_report_leftmenu.png "Report view")

2. In the Visualizations pane, select **Clustered Column Chart**. Drag-and-drop the **Date.Date** field to the **X-axis** box. Drag-and-drop the **Date.Sales at Billing Date**, **Date.Payment at pred Date**, and **Date.Payment at actual Date** to the **Y-axis** box.

    ![The Visualizations pane displays with the Clustered Column Chart item highlighted and the form filled out as described above.](media/pbi_visualizations_clusteredcolumn.png "Clustered Column Chart visualization details")

    ![The Sales and Payment Forecast visualization displays in a clustered column chart visualization.](media/pbi_clusteredcolumnchart.png "Clustered Column Chart")

## Exercise 9: Create an alert in Power BI

Estimated time: 30 minutes

In this exercise, a Power BI and Power Automate subscription are used to create an alert and trigger a Power Automate flow to send an email.

### Task 1: Publish the Power BI report to an online workspace

1. Ensure the Power BI report file is saved.

2. On the Power BI Home tab menu, select **Publish**.

   ![The Power BI Home tab menu displays with the Publish item highlighted.](media/pbi_publish_button.png "Publish")

3. On the Publish to Power BI dialog, select **My workspace** as the destination and choose the **Select** button.

    ![The Publish to Power BI dialog displays with the My workspace item selected and the Select button highlighted.](media/pbi_publishtoworkspace_dialog.png "Publish to Power BI")

4. Wait a few moments for the publishing to complete. Select the **Open '{REPORT NAME}.pbix' in Power BI** link. The report will open in a browser window.

    ![The Publishing to Power BI dialog displays with a success message and the Open report in Power BI link highlighted.](media/pbi_publishcomplete.png "Open report in Power BI")

### Task 2: Create a gauge visualization to be used as the notification trigger

1. In the online Power BI report editor in the web browser, select the **Edit** button from the top toolbar menu.

    ![The online Power BI report editor displays with the Edit button highlighted.](media/opbi_editmenu.png "Edit report")

2. In the Visualizations pane, select **Gauge**. Drag-and-drop the **SalesOrderPayments.predOffset** from the Fields pane to the **Value** box. Expand the **Value** field using the chevron menu, and select **Maximum**.

    ![The Visualization pane displays with the Guage visualization selected. The SalesOrderPayments.predOffset value is in the Value box with the chevron menu expanded. The Maximum item is selected from this menu.](media/opbi_gauge_settings.png "Gauge visualization")

3. From the toolbar menu, select **Reading view**. Save the changes when prompted.

    ![The Power BI menu displays with the Reading view item highlighted.](media/opbi_readingview_menu.png "Reading view")

    ![The report displays in Reader view.](media/obi_readervew.png "Reader view")

### Task 3: Create an alerting dashboard to send email with Power Automate

1. On the report, select to **Pin** the Gauge visulization to a new dashboard.

    ![The gauge visualization displays with the Pin icon highlighted.](media/opbi_pingauge.png "Pin visualization")

2. On the **Pin to dashboard** dialog, select **New dashboard** and enter the name `Alerting Dashboard` and select **Pin**.

    ![The Pin to dashboard dialog displays with Alerting Dashboard entered in the Dashboard name field and the Pin button is highlighted.](media/opbi_pindialog.png "Pin visualization to new dashboard")

3. From the left menu, select **My workspace**, then in the listing of items select **Alerting Dashboard**.

   ![The My workspace items are listed with the Alerting Dashboard item selected.](media/opbi_opendashboard_menu.png "Open Alerting Dashboard")

4. On the gauge visualization, expand the ellipsis menu and choose **Manage alerts**.

    ![The ellipsis menu on the gauge visualization displays with the Manage alerts item selected.](media/opbi_managealerts_menu.png "Manage alerts")

5. On the Manage alerts blade, select **+ Add alert rule**.

    ![The Manage alerts blade displays with the + Add alert rule highlighted.](media/opbi_addalertrule.png "Add alert rule")

6. Set the condition to trigger when the threshold is **lower than the value currently indicated in the gauge**, this will ensure it triggers immediately. Set the maximum notification frequency to once per hour. Near the bottom of the blade select the **Use Microsoft Power Automate to trigger additional actions** link.

    ![The Manage alerts blade displays with the Max of predOffset alert set for the condition of above 70 (this is lower than the gauge value of 71) with notifications at most once an hour. The Use Microsoft Power Automate to trigger additional actions link is highlighted.](media/opbi_setupalert.png "Setup alert")

7. A new web browser tab opens displaying an overview of a Power Automate Template. Select **Try it now** beneath the **Trigger a flow with a Power BI data-driven alert**. Sign in if required.

    ![A portion of a web page displays with the Try it now button highlighted beneath the Trigger a flow with a Power BI data-driven alert.](media/pa_tryitnow.png "Try Power Automate flow")

8. On the Trigger a flow with a Power BI data-driven alert screen, select **Sign in** on the **This flow will connect to field**. Once signed in, select **Continue**.

    ![The Trigger a flow with a Power BI data-driven alert screen displays with the sign in and Continue button highlighted.](media/pa_triggerflowconnection.png "Sign in and Continue")

9. In the flow designer, in the When a data driven alert is triggered step, expand the Alert id field and select **Max of predOffset**.

    ![The When a data driven alert is triggered step displays with the Alert Id drop down expanded and the Max of predOffset value is selected.](media/pa_alert_maxofpredoffset.png "Alert selection")

10. Select **+ New step**, and search for `send email`. From the results select **Send an email (V2) - Office 365 Outlook**.

    ![The Choose an operation step displays with send email entered in the search box. The Send an email (V2) item is selected from the list of results.](media/pa_sendemail_action_search.png "Send an email action")

11. The step will transform to a Send an email (V2) step. It will automatically connect to Office 365 using the signed in user account, this will only take a moment. In the **To** field, enter your email address.

    ![The Send an email (V2) step displays with the email field filled out.](media/pa_sendemail_emailfield.png "Email field")

12. Select the **Subject** text box and the Dynamic content pane will display. Select **Alert title**.

    ![The Send an email (V2) step displays with the cursor in the Subject field. The Dynamic content pane displays with the Alert title option selected.](media/pa_sendemail_titlefield.png "Email subject")

13. Select the **Body** text box and in the Dynamic content pane select **Tile URL**.

    ![The Send an email (V2) step displays with the cursor in the Body field. The Dynamic content pane displays with the Tile URL option selected.](media/pa_sendemail_body.png)

14. At the bottom of the flow designer select **Save**.

    ![The flow designer displays with the save button highlighted.](media/pa_flow_save.png "Save flow")

15. An email is sent to the email address from the trigger.

    ![A notification email is displayed with the subject of Max of predOffset and a URL in the body of the email.](media/pa_notificationemail.png "Notification email")

    > **Note**: To retrigger the alert a data update must occur. Execute the following SQL script in the dedicated SQL pool of Azure Synapse Analytics to change data.

    ```SQL
    UPDATE dbo.Payments SET PaymentDate = DATEADD(DAY, 1, PaymentDate)
    ```

## Exercise 10: Update SAP from Power BI

Estimated time: 30 minutes

Contoso Retail also needs a way to flag risky customers in the SAP system whose payments tend to arrive late. In this exercise, a Power Automate flow is added in the Power BI report that initiates a business partner update in SAP using OData.

### Task 1: Import a Power Automate flow

1. In a web browser, access the following link and select **Download** to download the UpdateBusinessPartnerFromPowerBI.zip file. This file contains the exported flow that is used in this exercise.

    ```text
    https://github.com/codingbandit/MCW-SAP-plus-extend-and-innovate/blob/feature/exercise10/Hands-on%20lab/Resources/powerautomate/UpdateBusinessPartnerFromPowerBI.zip
    ```

    ![A portion of a GitHub window displays with the Download button highlighted.](media/gh_downloadzip.png "Download file from GitHub")

2. Access and log into [Power Automate](https://make.powerautomate.com).

3. From the left menu, select **My flows**. Expand the **Import** menu item on the toolbar menu and select **Import Package (Legacy)**.

    ![The Power Automate UI displays with My flows selected on the left menu. The Import button is expanded with the Import Package (Legacy) highlighted.](media/pa_importpackagelegacy_menu.png "Import Package")

4. On the Import package screen, select the **Upload** button then choose to upload the file that was downloaded in the first step of this task: **UpdateBusinessPartnerFromPowerBI.zip**. The file will automatically start uploading.

    ![The Choose the package file to import field displays with the Upload button highlighted.](media/pa_importpackage_uploadbutton.png "Upload package")

5. In the Import package review screen, select the wrench icon next to the Power BI Connection under the Related resources section.

   ![The Import package review screen displays with the wrench item next to the Power BI Connection highlighted.](media/pa_importwrench_connection.png "Establish Power BI connection")

6. On the Import Setup blade, choose the Power BI user account utilized during this lab and select **Save**.

    ![The Import setup blade displays with a user account selected from the list and the Save button highlighted.](media/pa_importsetup_selpbiusr.png "Select Power BI user account")

7. Select **Import** to comlete the import of the flow.

    ![The Import package review screen displays with the Import button highlighted.](media/pa_importflow_button.png "Import flow")

8. A message indicating successful import will display at the top of the screen. Select the **Open flow** link from this message.

    ![A success message displays with the Open flow link highlighted.](media/pa_successimport_message.png "Open flow")

9. On the flow design canvas, expand the second step **Initialize variable** and replace the Value field with the IP address of the MCWSAP-SAP1 virtual machine. Select **Save** from the toolbar menu.

    ![The flow design canvas displays with the Initialize variable step expanded and highlighted. The Save button is higlighted in the toolbar menu.](media/pa_importflow_edit_ip.png "Edit IP address variable")

    >**Note**: This flow initiates a get request to the SAP service to retrieve a business partner by name using the CUSTOMERNAME value passed in by Power BI. This request also requests a X-CSRF-Token that will allow the current sesstion to perform an update. The last HTTP call issues the update of the business partner record found in the first HTTP activity to 02, indicating a risky customer.

10. Select the back arrow icon next to the Update Business Partner from Power BI title in the toolbar.

    ![The flow toolbar displays with the back arrow icon highlighted.](media/pa_flowbackbutton.png "Go back")

11. On the Flows &gt; Update Business Partner from Power BI screen, select **Turn on** from the toolbar menu.

    ![The flow details screen displays with the Turn On button highlighted in the toolbar menu.](media/pa_turnon_action.png "Turn on flow")

12. Keep this screen open for a future task.

### Task 2: Add a Power Automate visual and author the update flow

1. Access and log into [Power BI](https://app.powerbi.com).

2. Open the report from the earlier exercises, under **My workspace**.

3. In the online Power BI report editor in the web browser, select the **Edit** button from the top toolbar menu.

    ![The online Power BI report editor displays with the Edit button highlighted.](media/opbi_editmenu.png "Edit report")

4. From the Visualizations panel, select the **Table** item. Drag-and-drop the SalesOrderPayments.CUSTOMERNAME to the Columns box.

   ![The Visualizations panel displays with the Table item highlighted and the CUSTOMERNAME value shown in the Columns box.](media/opbi_tablecustomersvis.png "Table visualization configuration")

5. Ensure no other visualization is selected, then choose the **Power Automate** item from the Visualizations panel. Drag-and-drop the SalesOrderPayments.CUSTOMERNAME to the Power Automate data box.

    ![The Power Automate item is selected from the Visualizations pane with the CUSTOMERNAME value shown in the data box. The Power Automate visualization is highlighted on the report designer canvas.](media/opbi_pavis.png "Power Automate Visualization")

6. Expand the ellipsis menu on the Power Automate visualization on the report and select **Edit**.

    ![The Power Automate visualization displays with the ellipsis menu expanded and the Edit item selected.](media/opbi_pavis_editpowerautomate.png "Edit Power Automate visualization")

7. On the Microsoft Power Automate screen, select the **Update Business Partner from Power BI** flow then choose **Apply** on the toolbar menu. Once applied, select the **Back to report** link at the top of the screen.

   ![The Microsoft Power Automate screen displays with the Update Business Partner from Power BI flow highlighted and the Apply button selected from the toolbar menu.](media/opbi_selectflow.png "Apply flow")

8. Select **Save** then **Reading view** from the report toolbar menu.

    ![The report toolbar displays with Save and Reading view highlighted.](media/opbi_save_readerview_menu.png "Save and switch to Reading view")

9. Switch to the Postman application, issue the **GET Customer** request from the SAP MCW collection. Refer to the [Before the hands-on-lab](#task-5-prepare-the-business-partner-service-in-sap) step 17 through 21 for guidance if necessary. Make note that in the response, the **BusinessPartnerRole** indicates **01** for **Bigmart** - this indicates a customer in good standing.

    ![A portion of the Postman response displays with Bigmart highlighted with a BusinessPartnerRole of 01.](media/pm_bigmart_partner_01_value.png "Bigmart BusinessPartnerRole has a value of 01")

10. Switch back to the Power BI report, from the CUSTOMERNAME table, select **Bigmart**. This will filter the report visualizations by that customer.

    ![The Power BI report displays with the Bigmart item selected from the CUSTOMERNAME table. The report visualizations are filtered by this selection.](media/opbi_customername_selected.png "Filter report for Bigmart")

11. Select the **Run flow** button (anywhere in the blue area), and the Update Business Partner from Power BI flow will be triggered.

12. Return to the Power Automate Update Business Partner from Power BI flow screen (left open in Task 1). The history displays the status of the run as succeeded. Optionally, drill into the the Date link beneath the Start header to view the run details.

    ![The Power Automate screen indicates a flow run succeeded.](media/pa_flow_succeeded.png "Power Automate run succeeded")

13. Switch back to the Postman application, issue the **GET Customer** request from the SAP MCW collection. Notice how the BusinessPartnerRole value now indicates **02**. This role indicates this customer is now flagged as a risky customer in SAP.

    ![A portion of the Postman response displays with Bigmart highlighted with a BusinessPartnerRole of 02.](media/pm_bigmart_role02.png "Bigmart BusinessPartnerRole has a value of 02")

## After the hands-on lab

Duration: 10 minutes

### Task 1: Delete the Power Automate flows

1. In Power Automate, select **My flows** locate the **Trigger a flow with a Power BI data-driven alert** item, expand the ellipsis menu and choose **Delete**.

   ![The Power Automate interface displays with My flows selected from the left menu. The ellipsis menu is expanded next to the Trigger a flow with a Power BI data-driven alert item and the Delete option is selected.](media/pa_deleteflow.png "Delete Power Automate flow")

2. Repeat the previous step to delete the **Update Business Partner from Power BI** flow.

### Task 2: Delete the Power BI workspace report and dataset

1. In the Power BI workspace, select **My workspace** from the left menu to get a listing of items. Delete the report, dataset and the Alerting dashboard items by expanding the ellipsis menu and choosing Delete.

    ![The My workspace items are listed with an ellipsis menu displaying with the Delete option highlighted.](media/opbi_deleteitems.png "Delete item")

### Task 3: Remove deployed Azure resources with Terraform

1. In the Azure portal, select the cloud shell button from the upper-right toolbar menu options.

    ![The upper right toolbar displays with the cloud shell button highlighted.](media/cloudshell_icon.png "Cloud Shell")

2. Navigate to the Terraform directory by executing the following command.

    ```PowerShell
    cd 'MCW-SAP-plus-extend-and-innovate/Hands-on lab/Resources/terraform'
    ```

3. Enter the following command to remove all deployed resources, type `yes` and <kbd>Enter</kbd> when prompted.

    ```PowerShell
    terraform destroy
    ```

    > **Note**: Ensure the proper subscription is set using `az account set --subscription {SUBSCRIPTION_ID_GOES_HERE} if experiencing difficulties.

4. Execute the following command **two times** to retun to the user directory.

    ```PowerShell
    cd..
    ```

5. Delete the cloned source code repository with the following command.

   ```PowerShell
   Remove-Item -Path .\MCW-SAP-plus-extend-and-innovate -recurse -force  
   ```

### Task 4: Terminate the SAP CAL appliance

1. Log into the [SAP Cloud Appliance Library](https://cal.sap.com/) web site.

2. From the left menu, select **Appliances**, locate the **MCW SAP** appliance and expand the ellipsis menu. Select **Terminate** to delete the appliance.

![The SAP CAL interface displays with Appliances selected in the left menu. The ellipsis next to the MCW SAP appliance is expanded with the Terminate option selected.](media/sapcal_deleteappliance.png "Terminate appliance")

You should follow all steps provided *after* attending the Hands-on lab.
