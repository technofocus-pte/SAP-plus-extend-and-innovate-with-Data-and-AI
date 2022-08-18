![Microsoft Cloud Workshops](https://github.com/Microsoft/MCW-Template-Cloud-Workshop/raw/main/Media/ms-cloud-workshop.png "Microsoft Cloud Workshops")

<div class="MCWHeader1">
SAP plus extend and innovate with Data and AI
</div>

<div class="MCWHeader2">
Whiteboard design session student guide
</div>

<div class="MCWHeader3">
August 2022
</div>

Information in this document, including URLs and other Internet Web site references, is subject to change without notice. Unless otherwise noted, the example companies, organizations, products, domain names, e-mail addresses, logos, people, places, and events depicted herein are fictitious, and no association with any real company, organization, product, domain name, e-mail address, logo, person, place or event is intended or should be inferred. Complying with all applicable copyright laws is the responsibility of the user. Without limiting the rights under copyright, no part of this document may be reproduced, stored in or introduced into a retrieval system, or transmitted in any form or by any means (electronic, mechanical, photocopying, recording, or otherwise), or for any purpose, without the express written permission of Microsoft Corporation.

Microsoft may have patents, patent applications, trademarks, copyrights, or other intellectual property rights covering subject matter in this document. Except as expressly provided in any written license agreement from Microsoft, the furnishing of this document does not give you any license to these patents, trademarks, copyrights, or other intellectual property.

The names of manufacturers, products, or URLs are provided for informational purposes only and Microsoft makes no representations and warranties, either expressed, implied, or statutory, regarding these manufacturers or the use of the products with any Microsoft technologies. The inclusion of a manufacturer or product does not imply endorsement of Microsoft of the manufacturer or product. Links may be provided to third party sites. Such sites are not under the control of Microsoft and Microsoft is not responsible for the contents of any linked site or any link contained in a linked site, or any changes or updates to such sites. Microsoft is not responsible for webcasting or any other form of transmission received from any linked site. Microsoft is providing these links to you only as a convenience, and the inclusion of any link does not imply endorsement of Microsoft of the site or the products contained therein.

© 2022 Microsoft Corporation. All rights reserved.

Microsoft and the trademarks listed at https://www.microsoft.com/en-us/legal/intellectualproperty/Trademarks/Usage/General.aspx are trademarks of the Microsoft group of companies. All other trademarks are property of their respective owners.

**Contents**

<!-- TOC -->

- [SAP plus extend and innovate with Data and AI student guide](#sap-plus-extend-and-innovate-student-guide)
  - [Abstract and learning objectives](#abstract-and-learning-objectives)
  - [Step 1: Review the customer case study](#step-1-review-the-customer-case-study)
    - [Customer situation](#customer-situation)
    - [Customer needs](#customer-needs)
    - [Customer objections](#customer-objections)
    - [Infographic for common scenarios](#infographic-for-common-scenarios)
  - [Step 2: Design a proof of concept solution](#step-2-design-a-proof-of-concept-solution)
  - [Step 3: Present the solution](#step-3-present-the-solution)
  - [Wrap-up](#wrap-up)
  - [Additional references](#additional-references)

<!-- /TOC -->

# SAP plus extend and innovate with Data and AI student guide

## Abstract and learning objectives

Contoso Retail, Inc. has been facing challenges in modernizing its on-premises SAP landscape in order to better compete in the current marketplace. Among the main challenges are that Contoso has an aging on-premises infrastructure, not capable of running more demanding analytical workloads.  They do not have a disaster recovery environment and limited high-availability provisions. Contoso has found that it is expensive to maintain development and testing environments. They have a lack of full visibility of supply and demand signals across the value chain.  They are also insufficient in their ability to use customer data, precluding the ability to implement targeted advertising. They have determined that they maintain a suboptimal delivery route planning and scheduling.

As a struggling retailer, Contoso has been dealing with significant financial constraints. Given a hard limit of its capital expenditure budget, Contoso has been considering leveraging its operational budget and taking advantage of the pay-as-you-go model offered by Microsoft Azure. 

To remedy these challenges, Contoso has asked you to design and implement a solution that will help them regain the competitive edge by transitioning their SAP landscape to Azure and modernizing it by leveraging Azure services. 

Contoso has determined that to optimize their environment, the following key success criteria must be met.  They would like a highly available SAP landscape with the ability to minimize cost through right-sizing and optimized resource allocation.  They need data integration and analytics capabilities that include the ability to provide a comprehensive view of logistical and operational data, including sensor data from IoT devices in warehouses, stores, and manufacturing plants.  Contoso would like to utilize social media sentiment analytics and personalized marketing.  In addition, they would like to improve delivery route planning and scheduling, leveraging external data feeds that account for such factors as road closures or inclement weather.  They also would like optimized demand forecasting with automatic anomaly detection within their supply chain.

Your primary objective is to provide integration across all data to be used for analysis and reporting, bringing together manufacturing, supply chain, and sales. Your solution should help the customer, represented by the Chief Marketing Officer, Chief Digital Officer, the Chief Data Officer, and the Customer Experience Manager, deliver a 360-degree view of the Contoso's business operations and to optimize them through data analytics. The Chief Executive Officer (CEO), Chief Financial Officer (CFO), and Chief Information Officer (CIO) believe that providing this level of customer insights will increase revenue and deliver a competitive advantage to Contoso. 

## Step 1: Review the customer case study 

**Outcome**

Analyze your customer's needs.

Timeframe: 15 minutes

Directions: With all participants in the session, the facilitator/SME presents an overview of the customer case study along with technical tips.

1.  Meet your team members and trainer.

2.  Read all directions for steps 1-3 in the student guide.

3.  As a team, review the following customer case study.

### Customer situation

Contoso Retail, Inc. has been selling goods through various retail channels for the past 15 years. They currently have over 200 brick-and-mortar stores but plan to reduce the number of physical locations to 150 in the next year due to declining revenue and various other factors. Of the remaining 150 stores, 35 of them are currently streamlined for an attempted re-branding that happened a few years ago. 

SAP is the line-of-business application and database for all customer and supply chain information. SAP will manage the customer experience, including finance, inventory, delivery, and customer service.  SAP will be used to integrate with suppliers for re-ordering of products based on demand and sales projections. Sales and Inventory data will be delivered to executives for revenue projections for analysis of trends and potential shifts in demand.

Contoso needs the ability to collect and analyze data from within SAP in order to make the best uniform solution possible. They want to take control of their supply chain, so customers know when and where products are available, and stores are prepared to keep up with demand.

The improved ability to meet customer demand will be accomplished by establishing a 360-degree view of the supply chain. With data analysis and reporting, stores will be able to plan and schedule product deliveries based on customer sentiment and current buying trends. 

Contoso has brought together a group of SAP, Azure, Applications, and Data and AI specialists to design and architect a solution that meets the company's needs. To remediate these shortcomings, Contoso is looking for the ability to combine all sources of data, including:

*   Contoso has sensor data from IoT devices in warehouses, stores, and manufacturing plants they would like to be able to analyze.
*   They would like to utilize social media sentiment analytics for inventory recommendations.
*   Contoso would like to use external feeds with such information as road closures and inclement weather to manage deliveries efficiently.

Contoso wants to take control of their supply chain to ensure that their customers can easily locate and purchase the products they are interested in and that their stores are prepared to keep up with the actual demand. To accomplish this, Contoso will need to establish a 360-degree view of the supply chain, with data analysis and reporting that provides the business with the ability to address manufacturing and service issues, plan, and schedule deliveries of products according to forecasted needs, and gauge these needs based on customer sentiment and up-to-date buying trends.

As part of its business plan, Contoso is looking to implement the following objectives:

*   They would like to provision compute and storage resources which capacity exceeds what's currently supported by the aging on-premises infrastructure hosting the existing SAP landscape.  
*   Contoso has invested in SAP S/4HANA for all ERP, finance, customer experience and CRM, and supply chain management solutions.
*   Contoso wants to increase resiliency by including full-fledged high-availability provisions and setting up a disaster recovery site.
*   They want to minimize cost of development and testing environments.
*   Whenever possible, Contoso would like to simplify the operational model by leveraging managed services.
*   Contoso would like to enhance delivery route planning and scheduling by referencing external data feeds that account for such factors as road closures or inclement weather.
*   They would like to integrate the SAP-resident data with disparate data sources, including Twitter feeds and IoT devices.
*   Contoso wants to automate collection, pre-processing, and analytics of streaming data.
*   They would like to consolidate online and in-store data to facilitate targeted advertising tailored towards individual customers.
*   Contoso wants to improve online customer experience by leveraging Artificial Intelligence (AI) technologies such as natural language understanding.

### Customer needs

1.  Contoso wants to minimize the cost by right sizing the SAP landscape implementation and optimize the use of compute resources.

2. They would like to leverage Azure services to extend and innovate data collection and analysis (including sensor data from IoT devices, web site and app telemetry, as well as social networking feeds reflecting customer behavior, sentiment, and purchasing patterns).

3. Contoso would like to fine-tune inventory and staff management to ensure all channels are working with the optimal resource allocation according to predicted demands.

4. Contoso wants to streamline remediation of manufacturing service issues and enhance available-to-promise retail capabilities.

5. They would also like to minimize the operational overhead within their current processes.

### Customer objections

1.  We currently have all the data we need, why do we need to do anything else?

2.  We've spent a lot of money and time building out the systems we have, why should we start over in Azure rather than upgrade our existing hardware?

3.  How will this solution help us to create a better process for getting our products from the manufacturing to the warehouses and then to the stores any quicker? Our staff is already working overtime and trucks won't be able to physically drive any faster while maintaining safety standards. 

4.  How can we ensure the privacy of our customers is sufficiently protected if we pursue targeted advertising by leveraging Azure services?

### Infographic for common scenarios

SAP on Azure provides many potential scenarios and benefits that are shown in this illustration.
![Diagram illustrating SAP on Azure scenarios and benefits.](media/sap-on-azure-scenarios-benefits.png 'SAP on Azure Scenarios and Benefits')

Cloud, data, and AI provide ways to shift how data is utilized. This graphic highlights some of these capabilities.
![Diagram illustrating a transformative shift fueled by cloud, data, and AI.](media/cloud-data-ai-transformative-shift.png 'Cloud, Data, and AI fueling a transformative shift')

There are many drivers for migrating SAP to the cloud.  This graphic illustrates some of these drivers.
![Diagram illustrating drivers for migrating SAP to the cloud.](media/drivers-for-migrating-sap-to-cloud.png 'Drivers for migrating SAP to the cloud')

When migrating to Azure, there are different drivers that optimize your costs. Some of the key factors are in this graphic.

![Diagram illustrating cost savings with Azure.](media/optimize-cost-with-azure.png 'Optimize cost with Azure')

When determining how data is processed, you must understand the architecture of an IoT infrastructure and how data is handled.  This graphic illustrates that lambda architecture for IoT data processing.
![Diagram illustrating Azure IoT lambda architecture.](media/iot-lambda-architecture.png 'Azure IoT Lambda architecture')

This diagram shows how Microsoft's Intelligent Edge can be utilized with SAP on Azure.
![Diagram illustrating integration of Microsoft Intelligent Edge with SAP Business Context.](media/sap-with-microsoft-intelligent-edge.png 'SAP integration with Microsoft Intelligent Edge')

## Step 2: Design a proof of concept solution

**Outcome**

Design a solution and prepare to present the solution to the target customer audience in a 15-minute chalk-talk format.

Timeframe: 60 minutes

**Business needs**

Directions:  With your team, answer the following questions and be prepared to present your solution to others:

1.  Who will you present this solution to? Who is your target customer audience? Who are the decision makers?

2.  What customer business needs do you need to address with your solution?

**Design**

Directions: With your team, respond to the following questions:

_High-level architecture_

1. Without getting into the details (the following sections will address the particular details), diagram your initial vision for handling the top-level requirements for:

   *   Data ingestion and integration
   *   Data transformation and processing
   *   Data analytics
   *   Personalized marketing

Besides addressing the core functional requirements, consider the resiliency and cost optimization provisions that Contoso is looking for. 

_Data ingestion and integration_

1. Which Azure services can you use to ingest data from sources such as IoT devices and social networking feeds?
 
2. Of the options you identified in the previous step, which ones would you recommend to Contoso?

3. What data integration options would Contoso benefit from?

4. Which Azure integration services would you recommend be used by Contoso?

_Data transformation and processing_

1. How would you approach the need for additional analysis of data originating from SAP and non-SAP data sources?

2. Which Azure services would you use to implement the corresponding functionality?

_Data analytics_

1. How would you analyze the data to facilitate identifying relevant information?

2. What Azure services would allow Contoso to further enrich the data by leveraging technologies such as artificial intelligence?

_Personalized marketing_ 

1. How would you improve personalized marketing for Contoso customers?

2. Which Azure services would allow you to enhance personalized marketing experience for Contoso customers?

**Prepare**

Directions: As a team:

1.  Identify any customer needs that are not addressed with the proposed solution.

2.  Identify the benefits of your solution.

3.  Determine how you will respond to the customer's objections.

Prepare a 15-minute chalk-talk style presentation to the customer.

## Step 3: Present the solution

**Outcome**

Present a solution to the target customer audience in a 15-minute chalk-talk format.

Timeframe: 30 minutes

**Presentation**

Directions:

1.  Pair with another team.

2.  One group is the Microsoft team, the other is the customer.

3.  The Microsoft team presents their proposed solution to the customer.

4.  The customer makes one of the objections from the list of objections.

5.  The Microsoft team responds to the objection.

6.  The customer team gives feedback to the Microsoft team.

7.  Switch roles and repeat Steps 2-6.

##  Wrap-up 

Timeframe: 15 minutes

Directions: Reconvene with the larger group to hear the facilitator/SME share the preferred solution for the case study.

## Additional references

| **Description** | **Links** |
| --------------- | --------- |
| SAP on Azure | <https://azure.microsoft.com/solutions/sap/>
| Connect to SAP systems from Azure Logic Apps | <https://docs.microsoft.com/azure/logic-apps/logic-apps-using-sap-connector> |
| What is Azure Databricks | <https://docs.microsoft.com/azure/databricks/scenarios/what-is-azure-databricks> |
| Azure Synapse Analytics | <https://azure.microsoft.com/services/synapse-analytics/> |
| Azure Cosmos DB | <https://azure.microsoft.com/services/cosmos-db/> |
| Azure Machine Learning | <https://azure.microsoft.com/free/machine-learning> |
| What is Azure IoT Hub | <https://docs.microsoft.com/azure/iot-hub/about-iot-hub> |
| Azure IoT Edge | <https://azure.microsoft.com/services/iot-edge/> |
| Event Hubs | <https://azure.microsoft.com/services/event-hubs/> |
| Connect to SAP systems from Azure Logic Apps | <https://docs.microsoft.com/azure/logic-apps/logic-apps-using-sap-connector> |
| SAP API Business Hub | <https://api.sap.com/search?searchterm=retail&tab=All&refinedBy=true&top=12> |
| S/4HANA Extensibility: Use Case Overview | <https://blogs.sap.com/2016/09/12/s4hana-extensibility-use-case-overview/> |
| SAP Extension Suite | <https://www.sapinsideronline.com/extend-your-core-business-applications-and-drive-your-business-forward-with-sap-extension-suite/>|
| SAP reference architecture | <https://docs.microsoft.com/en-us/azure/architecture/reference-architectures/sap/sap-overview>|
| SAP Portfolio categories | <https://www.sap.com/products.html>|
