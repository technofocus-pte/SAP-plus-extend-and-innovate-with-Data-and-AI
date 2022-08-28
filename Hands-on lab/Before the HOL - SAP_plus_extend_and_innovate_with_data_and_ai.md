![](https://github.com/Microsoft/MCW-Template-Cloud-Workshop/raw/main/Media/ms-cloud-workshop.png "Microsoft Cloud Workshops")

<div class="MCWHeader1">
SAP plus extend and innovate with Data and AI
</div>

<div class="MCWHeader2">
Before the hands-on lab setup guide
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

- [SAP plus extend and innovate with Data and AI before the hands-on lab setup guide](#sap-plus-extend-and-innovate-with-data-and-ai-before-the-hands-on-lab-setup-guide)
  - [Requirements](#requirements)
  - [Before the hands-on lab](#before-the-hands-on-lab)
    - [Task 1: Obtain the desired Azure Subscription ID value](#task-1-obtain-the-desired-azure-subscription-id-value)
    - [Task 2: Create an SAP Cloud Appliance](#task-2-create-an-sap-cloud-appliance)
    - [Task 3: Deploy the Azure Resources](#task-3-deploy-the-azure-resources)
    - [Task 4: Prepare sales data in SAP](#task-4-prepare-sales-data-in-sap)
    - [Task 5: Prepare the business partner service in SAP](#task-5-prepare-the-business-partner-service-in-sap)
    - [Task 6: Prepare payment data in Cosmos DB](#task-6-prepare-payment-data-in-cosmos-db)
      - [Step 1: Create linked services in Azure Synapse Analytics](#step-1-create-linked-services-in-azure-synapse-analytics)
      - [Step 2: Create source and sink integration datasets](#step-2-create-source-and-sink-integration-datasets)
      - [Step 3: Create pipeline to ingest payment data into Cosmos DB](#step-3-create-pipeline-to-ingest-payment-data-into-cosmos-db)

# SAP plus extend and innovate with Data and AI before the hands-on lab setup guide

## Requirements

1. Azure Subscription with Owner role

2. Internet browser such as [Edge](https://www.microsoft.com/edge) or [Chrome](https://www.google.com/chrome/downloads/)

3. [Postman](https://www.postman.com/downloads/)

## Before the hands-on lab

Duration: 3 - 4 hours

### Task 1: Obtain the desired Azure Subscription ID value

1. Using an internet browser, log into the [Azure Portal](https://portal.azure.com).

2. In the top toolbar, search for and select **Subscriptions**.

    ![The Azure portal displays with Subscriptions entered in the search box and the Subscriptions item selected from the search results.](media/azure_portal_subscriptions_search.png "Search for Azure Subscriptions")

3. On the **Subscriptions** screen, locate the desired Azure Subscription to deploy lab resources and copy the **Subscription ID** value. Save this value in a text editor for later use.

    ![The Subscriptions screen displays with the Subscription ID value copied from a list of subscriptions.](media/azure_portal_copy_subscription_id.png "Azure Subscriptions")

### Task 2: Create an SAP Cloud Appliance

1. Using an internet browser, open the [SAP Cloud Appliance Library](https://cal.sap.com/) website.

2. Select the **Log On** button in the header of the website.

    ![A portion of the SAP Cloud Appliance Library site displays with the Log On button highlighted.](media/sapcal_logon_button.png "SAP Cloud Appliance Library Log On")

3. Either register for a new account, or log in with your existing credentials.

4. On the SAP Cloud Appliance Library **Appliance Templates** screen, search for and locate the **SAP S/4HANA 2021, Fully-Activated Appliance** item, and select the **Create Appliance** button in the search results.

    ![The Appliance Templates screen displays with SAP S/4Hana 2021, Fully-Activated Appliance entered in the search box, and the Create Appliance button highlighted in the search results listing.](media/locate_sap_appliance_create_instance_button.png "Create SAP S4/HANA instance")

5. On the **Terms and Conditions** screen, read the conditions of the 30-day trial license, and select the **I Accept** button to continue.

6. On the **Basic Mode: Create Appliance - Account Details** screen, enter the following values, then select the **Authorize** button:

    | Field | Value |
    |-------|-------|
    | Name | MCW SAP plus extend and innovate |
    | Description | SAP instance for the Microsoft Cloud Workshop |
    | Cloud Provider | Select **Microsoft Azure** |
    | Subscription ID | Paste the **Subscription ID** value from Task 1 |
    | Authorization Type | Select **Standard Authorization** |

    ![The Basic Mode: Create Instance Account Details screen displays with the form filled with the preceding values. The Authorize button is highlighted.](media/sap_createinstance_account_details.png "SAP Create Instance")

7. When prompted, authenticate to Azure. If prompted, select to **Consent on behalf of your organization** and select **Accept**.

    ![A Permissions requested modal dialog displays with the Consent on behalf of your organization checkbox checked and the Accept button highlighted.](media/sapcal_consent_modal.png "SAP Cloud Appliance Library Permissions Requested")

8. Returning to the **Basic Mode: Create Appliance** screen fill the **Appliance Details** form as follows and select **Create**:

    | Field | Value |
    |-------|-------|
    | Name  | MCW SAP |
    | Region | Select the nearest location |
    | Password | Choose a strong password |
    | Retype Password | Enter the chosen password |

    ![The Basic Mode: Create Instance screen displays with the Instance Details form filled as previously specified. The Create button is highlighted.](media/sap_create_instance_instance_details.png "Instance Details form")

    >**Note**: If difficulty arises using the **Basic** mode, an alternative is to use **Authorization with Application Type** using a [service principal](https://docs.microsoft.com/azure/active-directory/develop/howto-create-service-principal-portal).

9. On the **Supported VM Sizes** modal dialog, select **OK**.

    ![The Supported VM Sizes dialog displays with the OK button highlighted.](media/sapcal_supportedvmsize_ok.png "Supported VM Sizes")

10. On the **Private Key** modal, select to **Store** the private key in the SAP Cloud Appliance Library. Check the **Encrypt the private key with a password** and enter a password. Type the password once more in the **Retype Password** textbox. Select the **Download** button to download the encrypted key.

    ![The Private Key dialog displays with the password fields filled in and the Store and Download buttons highlighted.](media/sapcal_privatekey.png "Private Key dialog")

11. The deployment  will take approximately 90 minutes. The status will update on the Instances screen. Once complete, the status will indicate **Active**.

    ![The MCW SAP instance displays with a status of Active.](media/sapcal_activeinstance.png "SAP CAL Instance listing")

### Task 3: Deploy the Azure Resources

This lab utilizes Terraform Infrastructure as Code to deploy the necessary Azure resources.

1. In the Azure portal, select the cloud shell button from the upper-right toolbar menu options.

    ![The upper right toolbar displays with the cloud shell button highlighted.](media/cloudshell_icon.png "Cloud Shell")
  
2. In the Cloud Shell pane, ensure the PowerShell language is selected. Clone the source code repository by issuing the following command.

    ```PowerShell
    git clone --branch feature/hands-on-lab https://github.com/codingbandit/MCW-SAP-plus-extend-and-innovate.git
    ```

3. Navigate to the Terraform directory by executing the following command:

    ```PowerShell
    cd 'MCW-SAP-plus-extend-and-innovate/Hands-on lab/Resources/terraform'
    ```

4. Set the desired subscription by executing the following code, replace **SUBSCRIPTION_ID** with the value you recorded earlier in the lab setup.

    ```PowerShell
    az account set --subscription SUBSCRIPTION_ID
    ```

5. Establish a user context by executing the following command. Follow the prompts to authenticate to the Azure Cloud Shell.

    ```PowerShell
    az login
    ```

6. Initialize the Terraform code using the following command:

    ```PowerShell
    terraform init
    ```

7. Deploy the lab resources by executing the following command. When prompted to perform the actions, type `yes` and press <kbd>Enter</kbd>. It will take approximately 15 minutes for the deployment to complete.

    ```PowerShell
    terraform apply
    ```

8. Close the Cloud Shell panel if desired.

### Task 4: Prepare sales data in SAP

This task demonstrates creating a sales view in SAP and exposing it as an OData service for consumption by external services.

1. On the SAP Cloud Appliance Library Instances page, select the **Connect** button on the **MCW SAP** row.

    ![The SAP CAL instances listing displays with the Connect button highlighted next to the MCW SAP item.](media/sapcal_instancerowconnect.png "Connect to SAP Instance")

2. On the **Connect to the instance** dialog, select the **Connect** link on the RDP row. This will download an RDP file.

    ![The Connect to the instance dialog displays with the Connect link highlighted on the RDP row.](media/sapcal_connectrdpdialog.png "Connect via RDP")

3. Open the downloaded RDP file and log into the instance using the username `Administrator` and the password used when deploying the instance.

4. From the desktop double-click the **SAP Dev Tools for Eclipse** PowerShell icon to install Eclipse. Accept the license agreement. Installation can take up to 5 minutes, please be patient.

   ![The SAP Dev Tools for Eclipse PowerShell icon.](media/sapvm_pstoolsinstallicon.png "SAP Dev Tools for Eclipse icon")

5. Once the installation has completed, double-click the **SAP Dev Tools for Eclipse** icon. This will open the Eclipse development environment.

    ![SAP Dev Tools for Eclipse icon.](media/sapvm_eclipseicon.png "SAP Dev Tools for Eclipse icon")

6. In the **Select a directory as workspace** dialog, keep the default value and select **Launch**. Launching will take a few moments, please be patient.

    ![The Select a directory as workspace dialog displays with the Launch button highlighted.](media/sapvm_hanastudioworkspace_prompt.png "Select a directory as workspace dialog")

7. Change the perspective to development by expanding the **Window** menu, **Perspective**, **Open Perspective**, then selecting the **SAP HANA Development** item.

    ![HANA Studio displays with the Window, Perspective, Open Perspective menu items expanded and the SAP HANA Development item is selected.](media/sapvm_changeperspective.png "Change to development perspective")

8. In the left panel, select the **Project Explorer** tab then double-click the **S4H_100_s4h_ext_en** folder.

    ![The left panel of HANA Studio displays with the Project Explorer tab and S4H_100_s4h_ext_en folder selected.](media/sapvm_projectexplorer.png "Project Explorer")

9. When prompted for a password, enter `Welcome1` and select **OK**.

    ![A logon dialog displays with the Password text box and OK button highlighted.](media/sapvm_logins4h_ext.png "Logon dialog")

10. Expand the **File** menu, then **New** and select the **Other** item.

    ![The File and New menus are expanded with the Other item selected.](media/sapvm_file_new_other.png "Create new file")

11. In the **Select a wizard** dialog, search for `Data Definition`. Select the **Data Definition** item beneath the **ABAP / Core Data Services** folders. Select **Next**.

    ![The Select a wizard dialog displays with Data Definition entered in the search box and the Data Definition item selected from the search results. The Next button is highlighted.](media/sapvm_newdatadefinition.png "New Data Definition")

12. Fill in the **New Data Definition** dialog as follows, then select **Finish**.

    | Field | Value |
    |-------|-------|
    | Project | Retain the default **S4H_100_s4h_ext_en**. |
    | Package | Enter `$TMP`. |
    | Name | Enter `ZBD_ISalesDocument_E`. |
    | Description | Enter `ZBD_ISalesDocument_E` |

    ![The New Data Definition dialog displays populated with the preceding values.](media/sapvm_datadefinitionform.png "New Data Definition dialog")

13. Replace the code listing for **ZBD_ISALESDOCUMENT_E** with the following. Save the file.

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

14. Right-click in the whitespace of the **ZBD_ISALESDOCUMENT_E** view code window and select **Activate**.

    ![The ZBD_ISALESDOCUMENT_E view displays a context menu with the activate item selected.](media/sapvm_activatezbd_isalesdocument_e.png "Activate the ZBD_ISALESDOCUMENT_E view")

15. Right-click in the whitespace of the **ZBD_ISALESDOCUMENT_E** view once more, this time select **Open With** and choose **Data Preview**. This will display the raw data of the view.

    ![The ZBD_ISALESDOCUMENT_E view displays a context menu with the Open With and Data Preview items selected.](media/sapvm_preview_menuitem_zbd_isalesdocument_e.png "Preview ZBD_ISALESDOCUMENT_E view")

    ![Raw data for the ZBD_ISALESDOCUMENT_E view displays in tabular format.](media/sapvm_previewsalesdocuments.png "Raw data preview of ZBD_ISALESDOCUMENT_E view")

16. Keep this file open for the next task.

17. Next, expose SAP sales data as an OData service. Add the following code immediately preceding the `define view` line of code of the **ZBD_ISALESDOCUMENT_E** file and save the file.

    ```ABAL
    @OData.publish: true
    ```

    ![A portion of a code window displays with the preceding line of code highlighted.](media/sapvm_addodataannotation.png "Add OData publish annotation")

18. Right-click in the whitespace of the **ZBD_ISALESDOCUMENT_E** file, and select **Activate**.

19. Minimize the Eclipse development environment, and double-click the **SAP Logon** icon located on the desktop of the virtual machine. This will open the SAP GUI application.

    ![The SAP Logon icon located on the virtual machine desktop displays.](media/sapvm_saplogonicon.png "SAP Logon icon")

20. From the top toolbar menu, select the **Log On** button.

    ![A portion of the SAP GUI toolbar displays with the Log On button highlighted.](media/sapvm_sapguilogonbutton.png "Logon")

21. Log in with the username `S4H_EXT` and the password `Welcome1`, press <kbd>Enter</kbd> to submit the form.

    ![The SAP GUI logon form displays populated with the preceding values.](media/sapvm_sapguilogonform.png "SAP GUI Logon form")

22. Once logged on, type `/n/IWFND/MAINT_SERVICE` in the toolbar menu transaction combo box and press <kbd>Enter</kbd>. This opens the **Activate and Maintain Services** window.

    ![The SAP GUI toolbar displays with the transaction combo box highlighted. The n/IFWND/MAINT_SERVICE transaction is entered in the transaction combo box.](media/sapvm_sapgui_transactioncombobox.png "SAP GUI transaction combo box")  

23. From the toolbar menu of the **Activate and Maintain Services** window, select the **Add Service** button.

    ![A portion of the Activate and Maintain Services toolbar displays with the Add service button highlighted.](media/sapvm_sapgui_maintsvcs_addservicebutton.png "Add Service")

24. Populate the **Add Selected Services** filter form as follows, and press <kbd>Enter</kbd>.

    | Field | Value |
    |-------|-------|
    | System Alias | Enter `Local`. |
    | Technical Service Name | Enter `ZBD_*`. |

    ![The filter form displays populated with the preceding values.](media/sapvm_sapgui_svcfilterform.png "Filter form")

25. From the list of results, select the **ZBD_I_SALESDOCUMENT_E_CDS** item.

    ![The filter results display with the ZBD_I_SALESDOCUMENT_E_CDS item highlighted.](media/sapvm_sapgui_svcresults.png "Filter results list")

26. In the **Add Service** dialog, select the **Local Object** button located in the **Creation Information** section. This will populate the **$TMP** value, and press <kbd>Enter</kbd>. An information dialog indicating success will display, dismiss this dialog.

    ![The Add Service dialog displays with the Local Object button highlighted.](media/sapvm_sapgui_addservicedialog.png "Add Service dialog")

27. On the **Add Selected Services** screen, select the **Back** button on the toolbar menu. This will open the **Activate and Maintain Services** window once more.

    ![A portion of the Add Selected Services toolbar displays with the Back button highlighted.](media/sapvm_sapgui_backbuttonaddservices.png "Back button")

28. On the **Activate and Maintain Services** screen, select the **Filter** button from the toolbar menu.

    ![A portion of the Activate and Maintain Services toolbar menu displays with the Filter button highlighted.](media/sapvm_sapgui_activateandmaintainfilterbutton.png "Filter services")

29. In the **Filter for Service Catalog** dialog, type `ZBD_*` in the **Technical Service Name** field and press <kbd>Enter</kbd>.

    ![The Filter for Service Catalog displays with ZBD_* entered in the Technical Service Name field.](media/sapvm_sapgui_svccatalogfilterdialog.png "Filter for Service Catalog dialog")

30. This action filters the **Activate and Maintain Services** screen to a single service. In the **ICF Nodes** pane, select the **SAP Gateway Client** button. If the **SAP GUI Security** dialog displays, check the **Remember My Decision** checkbox and select **Allow**.

    ![The ICF Nodes pane displays with the SAP Gateway Client button highlighted on the toolbar menu.](media/sapvm_sapgui_icfnodessapgatewayclientbutton.png "ICF Nodes SAP Gateway Client")

31. On the **SAP Gateway Client** window, select the **Execute** button from the toolbar menu. This tests the OData service. Verify in the **HTTP Response** pane that the status code indicates **200**.

    ![The SAP Gateway Client window displays with the Execute button highlighted on the toolbar menu and the HTTP Response status code indicating 200.](media/sapvm_sapgui_sapgatewayclientexecution.png "SAP Gateway Client")

32. On the **SAP Gateway Client** window, select the **EntitySets** button on the toolbar menu.

    ![The SAP Gateway window displays with the EntitySets button highlighted.](media/sapvm_sapgui_sapgatewaycliententitysetsbutton.png "EntitySets")

33. On the **EntitySets** dialog, double-click the **ZBD_I_Salesdocument_E** item.

    ![The Entity Sets dialog displays with teh ZBD_I_Salesdocument_E item highlighted.](media/sapvm_sapgui_entitysetsdialog.png "EntitySets dialog")

34. On the **SAP Gateway Client** window, select **Execute**. This service retrieves the sales documents via the OData endpoint. Verify the HTTP Response status code value is **200**.

    ![The SAP Gateway Client window displays with the Execute button highlighted. The HTTP Response status code is 200.](media/sapvm_sapgui_entitysetodataresult.png "EntitySet OData service execution results")

35. On the **SAP Gateway Client** window, select the **Back** button to return to the **Activate and Maintain Services** screen.

36. On the **ICF Node** pane, select the **Call Browser** button. This will bring up the **Security GUI** dialog once more. Copy the URL value for future use in the lab. After recording the value, close the dialog. This URL is the service endpoint for the sales document OData service.

    ![The SAP GUI Security dialog displays with the URL value highlighted.](media/sapvm_sapgui_sapguisecuritydialog.png "Service endpoint")

### Task 5: Prepare the business partner service in SAP

A service is available that allows for the update of a Business Partner record. A Business Partner record is where non-paying entities are flagged in the system. This service does not have company names that match what is imported from the Sales data. This task updates the company name of a record in SAP for use in the lab.

1. In the SAP UI, access the Activate and Maintain Service transaction by typing `/n/IWFND/MAINT_SERVICE` in the toolbar menu transaction combo box and press <kbd>Enter</kbd>. This opens the **Activate and Maintain Services** window.

    ![The SAP GUI toolbar displays with the transaction combo box highlighted. The n/IFWND/MAINT_SERVICE transaction is entered in the transaction combo box.](media/sapvm_sapgui_transactioncombobox.png "SAP GUI transaction combo box")  

2. From the toolbar menu of the **Activate and Maintain Services** window, select the **Add Service** button.

    ![A portion of the Activate and Maintain Services toolbar displays with the Add service button highlighted.](media/sapvm_sapgui_maintsvcs_addservicebutton.png "Add Service")

3. Populate the **Add Selected Services** filter form as follows, and press <kbd>Enter</kbd>.

    | Field | Value |
    |-------|-------|
    | System Alias | Enter `Local`. |
    | Technical Service Name | Enter `*GWSAMPLE*`. |

    ![The filter pane displays with the preceding values populated.](media/sapui_addsvcfilter_gwsample.png "Add Service Filter Pane")

4. From the list of results, select the **/IWBEP/GWSAMPLE_BASIC** item.

    ![The Select Backend Services pane displays with the /IWBEP/GWSAMPLE_BASIC item highlighted.](media/sapui_selectbackendsvc_gwsample.png "Select Backend Services pane")

5. In the **Add Service** dialog, select the **Local Object** button located in the **Creation Information** section. This will populate the **$TMP** value, and press <kbd>Enter</kbd>. An information dialog indicating success will display, dismiss this dialog.

    ![The Add Service dialog displays with the Local Object button highlighted.](media/sapvm_sapgui_addservicedialog_gwsample.png "Add Service dialog")

6. On the **Add Selected Services** screen, select the **Back** button on the toolbar menu. This will open the **Activate and Maintain Services** window once more.

    ![A portion of the Add Selected Services toolbar displays with the Back button highlighted.](media/sapvm_sapgui_backbuttonaddservices_gwsample.png "Back button")

7. On the **Activate and Maintain Services** screen, select the **Filter** button from the toolbar menu.

    ![A portion of the Activate and Maintain Services toolbar menu displays with the Filter button highlighted](media/sapvm_sapgui_activateandmaintainfilterbutton.png "Filter services")

8. In the **Filter for Service Catalog** dialog, type `*GWSAMPLE*` in the **Technical Service Name** field and press <kbd>Enter</kbd>.

    ![The Filter for Service Catalog displays with *GWSAMPLE* entered in the Technical Service Name field.](media/sapvm_sapgui_svccatalogfilterdialog_gwsample.png "Filter for Service Catalog dialog")

9. This action filters the **Activate and Maintain Services** screen to a single service. In the **ICF Nodes** pane, select the **SAP Gateway Client** button. If the **SAP GUI Security** dialog displays, check the **Remember My Decision** checkbox and select **Allow**.

    ![The ICF Nodes pane displays with the SAP Gateway Client button highlighted on the toolbar menu.](media/sapvm_sapgui_icfnodessapgatewayclientbutton.png "ICF Nodes SAP Gateway Client")

10. On the **SAP Gateway Client** window, select the **EntitySets** button on the toolbar menu.

    ![The SAP Gateway window displays with the EntitySets button highlighted.](media/sapvm_sapgui_sapgatewaycliententitysetsbutton_gwsample.png "EntitySets")

11. On the **EntitySets** dialog, double-click the **BusinessPartnerSet** item.

    ![The Entity Sets dialog displays with the BusinessPartnerSet item highlighted.](media/sapvm_sapgui_entitysetsdialog_gwsample.png "EntitySets dialog")

12. On the **SAP Gateway Client** window, select **Execute**. This service retrieves the sales documents via the OData endpoint. Verify the HTTP Response status code value is **200**.

    ![The SAP Gateway Client window displays with the Execute button highlighted. The HTTP Response status code is 200.](media/sapvm_sapgui_entitysetodataresult_gwsample.png "EntitySet OData service execution results")

13. On the **SAP Gateway Client** window, select the **Back** button to return to the **Activate and Maintain Services** screen.

14. On the **ICF Node** pane, select the **Call Browser** button. This will bring up the **Security GUI** dialog once more. Copy the URL value for future use in the lab. After recording the value, close the dialog. This URL is the service endpoint for the Business Partner OData service.

    ![The SAP GUI Security dialog displays with the URL value highlighted.](media/sapvm_sapgui_sapguisecuritydialog_gwsample.png "Service endpoint")

15. Next, obtain the IP Address for the MCWSAP-SAP1 virtual machine. In the [Azure Portal](https://portal.azure.com), enter `MCWSAP-SAP1` in the search box located in the top toolbar and select the **MCWSAP-SAP1** virtual machine from the filtered list of resources.

    ![The Azure Portal toolbar search box displays with MCWSAP-SAP1 text and the MCWSAP-SAP1 virtual machine resource selected.](media/ap_searchmcwsapsap1_vm.png "Search for VM")

16. On the MCWSAP-SAP1 virtual machine Overview screen, copy the IP address and record it for future use.

    ![The MCWSAP-SAP1 Virtual machine screen displays with the Public IP address highlighted.](media/ap_mcwsapsap1vm_ip.png "MCWSAP-SAP1 Virtual Machine Overview")

    >**Note**: This IP address can change, it does not have a static IP. Please obtain the current IP address.

17. Open Postman on your local machine and select **Import** from the Workspace toolbar to import a collection.

    ![The Postman interface displays with the Import button highlighted.](media/pm_importcollection.png "Import Collection")

18. On the Import dialog, select the **Link** tab, then enter the following URL and select **Continue**.

    ```text
    https://raw.githubusercontent.com/codingbandit/MCW-SAP-plus-extend-and-innovate/feature/exercise10/Hands-on%20lab/Resources/postman/SAP%20MCW.postman_collection.json
    ```

    ![The Import dialog displays with the Link tab highlighted and the above URL entered above the Continue button.](media/pm_importlink.png "Import Collection via Link")

19. On the next screen, select **Import**.

    ![The Import dialog shows the collection to be imported. The Import button is highlighted.](media/pm_importcollection2.png "Import Collection")

20. In the Postman Collections list, select the **SAP MCW** collection. Select the **Variables** tab and enter the MCWSAP-SAP1 IP address in the **INITIAL VALUE** and **CURRENT VALUE** column. Select **Save** on the collection.

    ![The Variables for the SAP MCW collection displays with the initial value and current value set to an IP address. The Save button is highlighted.](media/pm_enteripvarsincollection.png "Set ip-address values")

21. Expand the SAP MCW Collection, and select the **GET Company** request. Select **Send**. Notice how the CompanyName is currently **Office Line Prag**.

    ![The SAP MCW Collection is expanded with the GET Company request selected. The Send button is highlighted. The CompanyName of Office Line Prag is highlighted in the response.](media/pm_get_officelineprag.png "Get Company Request - Office Line Prag Company Name")

22. In the SAP MCW Collection, select the **Patch Company** request and select **Send**. The response should show the status of **204 No Content**.

    ![The Patch Company request displays with the Send button highlighted. The status indicates 204 No Content.](media/pm_patchcompanyname.png "PATCH company")

23. Return to the **GET Company** request, and select **Send**. Notice how the CompanyName now shows **Bigmart**.

    ![The GET Company request displays with the Send button highlighted and the CompanyName value set to Bigmart in the response"](media/pm_getcompany_bigmart.png "CompanyName updated to Bigmart")

24. Retain this collection in Postman for use during the hands-on lab.

### Task 6: Prepare payment data in Cosmos DB

Raw payment data is available in Azure Data Lake storage. This exercise walks through loading raw payment data into Cosmos DB by leveraging Azure Synapse Analytics. First, linked services are created, these act as the connection strings to external compute resources. Next, integration datasets are created, these indicate the location and shape of the data being used in the migration. Finally, a pipeline is created to orchestrate moving data from Azure Data Lake Storage Gen2 to Cosmos DB.

#### Step 1: Create linked services in Azure Synapse Analytics

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

9. In the New linked service - Azure Cosmos DB form, fill it in as follows, then select the **Create** button. Unspecified fields retain their default values.

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

#### Step 2: Create source and sink integration datasets

The source data is payment data that is located in Azure Data Lake Storage Gen2 in CSV format. The sink is the paymentData Cosmos DB collection.

1. In Synapse Studio, select the **Data** hub.

   ![The left menu of Synapse Studio displays with the Data hub highlighted.](media/ss_datahub_menu.png "Data hub")

2. From the center pane, select the **Linked** tab. Expand the **Azure Data Lake Storage Gen2** item, followed by the **datalake** item, and select the **payment-data-csv** container. From the **payment-data-csv** tab, select the **paymentData_CAL2021.csv** file. Next, select **New integration dataset** from the toolbar menu.

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

#### Step 3: Create pipeline to ingest payment data into Cosmos DB

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

You should follow all steps provided *before* performing the Hands-on lab.
