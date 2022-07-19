![](https://github.com/Microsoft/MCW-Template-Cloud-Workshop/raw/main/Media/ms-cloud-workshop.png "Microsoft Cloud Workshops")

<div class="MCWHeader1">
SAP plus extend and innovate
</div>

<div class="MCWHeader2">
Before the hands-on lab setup guide
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

- [SAP plus extend and innovate before the hands-on lab setup guide](#sap-plus-extend-and-innovate-before-the-hands-on-lab-setup-guide)
  - [Requirements](#requirements)
  - [Before the hands-on lab](#before-the-hands-on-lab)
    - [Task 1: Obtain the desired Azure Subscription Id value](#task-1-obtain-the-desired-azure-subscription-id-value)
    - [Task 2: Create a SAP Cloud Appliance](#task-2-create-a-sap-cloud-appliance)
    - [Task 3: Populate SAP data](#task-3-populate-sap-data)
    - [Task 4: Expose SAP sales data as an OData service](#task-4-expose-sap-sales-data-as-an-odata-service)
    - [Task 5: Deploy Azure Resources](#task-5-deploy-azure-resources)

# SAP plus extend and innovate before the hands-on lab setup guide

## Requirements

1. An Azure account with the ability to provision an Azure Synapse Workspace

2. Internet browser such as [Edge](https://www.microsoft.com/edge) or [Chrome](https://www.google.com/chrome/downloads/)

## Before the hands-on lab

Duration: X minutes

### Task 1: Obtain the desired Azure Subscription Id value

1. Using an internet browser, log into the [Azure Portal](https://portal.azure.com).

2. In the top toolbar, search for and select **Subscriptions**.

    ![The Azure portal displays with Subscriptions entered in the search box and the Subscriptions item selected from the search results.](media/azure_portal_subscriptions_search.png "Search for Azure Subscriptions")

3. On the **Subscriptions** screen, locate the desired Azure Subscription to deploy lab resources and copy the **Subscription ID** value. Save this value in a text editor for later use.

    ![The Subscriptions screen displays with the Subscription ID value copied from a list of subscriptions.](media/azure_portal_copy_subscription_id.png "Azure Subscriptions")

### Task 2: Create a SAP Cloud Appliance

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

9. On the **Supported VM Sizes** modal dialog, select **OK**.

    ![The Supported VM Sizes dialog displays with the OK button highlighted.](media/sapcal_supportedvmsize_ok.png "Supported VM Sizes")

10. On the **Private Key** modal, select to **Store** the private ky in the SAP Cloud Appliance Library. Check the **Encrypt the private key with a password** and enter a password. Type the password once more in the **Retype Password** textbox. Select the **Download** button to download the encrypted key.

    ![The Private Key dialog displays with the password fields filled in and the Store and Download buttons highlighted.](media/sapcal_privatekey.png "Private Key dialog")

11. The deployment  will take approximately 90 minutes. The status will update on the Instances screen. Once complete, the status will indicate **Active**.

    ![The MCW SAP instance displays with a status of Active](media/sapcal_activeinstance.png "SAP CAL Instance listing")

### Task 3: Populate SAP data

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

15. Keep the virtual machine with the Eclipse development environment open for the next task.

### Task 4: Expose SAP sales data as an OData service

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

### Task 5: Deploy Azure Resources

This lab utilizes Terraform Infrastructure as Code to deploy the necessary Azure resources.

1. In the Azure portal, select the cloud shell button from the upper-right toolbar menu options.

    ![The upper right toolbar displays with the cloud shell button highlighted.](media/cloudshell_icon.png "Cloud Shell")
  
2. In the Cloud Shell pane, ensure the PowerShell language is selected. Clone the source code repository by issuing the following command.

    ```PowerShell
    git clone https://github.com/codingbandit/MCW-SAP-plus-extend-and-innovate.git
    ```

3. Navigate to the Terraform directory by executing the following command.

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

6. Initialize the Terraform code using the following command.

    ```PowerShell
    terraform init
    ```

7. Deploy the lab resources by executing the following command. When prompted to perform the actions, type `yes` and press <kbd>Enter</kbd>. It will take approximately 15 minutes for the deployment to complete.

    ```PowerShell
    terraform apply
    ```

8. Close the Cloud Shell panel if desired.

You should follow all steps provided *before* performing the Hands-on lab.
