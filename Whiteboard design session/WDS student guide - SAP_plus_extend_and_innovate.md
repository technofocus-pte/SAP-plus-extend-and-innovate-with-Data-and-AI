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

- [SAP plus extend and innovate with Data and AI student guide](#sap-plus-extend-and-innovate-with-data-and-ai-student-guide)
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

Contoso Food Distribution (CFD), Inc., subsidiary of Contoso Retail Inc., has been selling goods through various channels for the past 15 years. Their primary customer segments are supermarkets, retail chains, and small- to mid-size enterprise stores.  The business has been built on great customer service and relationships.  They have been facing recent challenges leveraging their SAP and Azure Cosmos DB investments to manage their accounts receivable (AR) and customer accounts.

Food processing and distribution has small profit margins and large transaction volume.  Inventory is perishable and needs to be delivered quickly.  CFD's CEO, Jan Smith, has chosen to deliver product first and manage account details later.  Unfortunately, CFD is having issues with high accounts receivables and rising inventory finance costs.  Mari Stephens, the CFO, is frustrated CFD operational credit line is being capped and the interest rate increased until they can lower their accounts receivable balances and predict their future cash flow is healthy.  This small interest expense increase is a problem given the industry’s thin profit margins.

The accounting department director, Sarah Smith, says customer AR management has always been a problem.  The AR and sales data is spread across different systems. Manually merging and analyzing the data sources is time consuming and error prone.  Accounting runs reports from the two different systems and exports the data into spreadsheets.

![The current process shows Excel spreadsheets exported and merged.](media/contoso-current-process.png "Contoso Current Process")

By the time a problem account is identified, it becomes more difficult to correct.  Valuable constrained accounting resources are manually contacting delinquent accounts weeks after the problem has started. Some existing customers are habitually late payers and new accounts drift into this problem behavior.

Contoso needs cash now and is considering selling some of its accounts receivables to outside debt collection agencies for a short-term cash infusion and is thinking about enforcing late payment fees for customers with balances beyond 50 days.  This type of option would have a positive cash flow, but might lead to weakening customer relationships and sales reductions.  Correcting customer payment behavior problems early is critical. The invoice late payment fees are substantial and could help manage customer paying behaviors. Also, the account managers believe it would be useful to notify customers when they are approaching an invoice due date.

Large supermarkets and retail chains, hold the upper hand in negotiations due to their large purchasing power and number of competing product suppliers.  Generous credit limits and payment terms are offered by Contoso to entice customers in exchange for high sales volume. The finance department would like the ability to use data analytics to determine a consistent amount of customer credit based on sales data and payment history. Finance and accounting want to identify delinquent accounts easily and adjust the amount of credit offered based on payment behaviors.

Timely and accurate AR and sales reports are required to support difficult decisions, like changing a customer from credit to cash only basis. Downgrading a customer’s credit may result in reduced sales but would improve the organization’s overall financial health.  Customer AR and sales data must be correlated and reviewed when these account decisions are made.

Contoso is looking for the ability to integrate relevant sources of data into a central data warehouse. They are looking forward to data analytics and automation tools. For example, the accounting department would like to be notified by email quickly when customer AR balances reach certain payment delinquency thresholds. Customers with invoices slightly past their due dates should receive an email reminder. These types of automated alerts would reduce the lag between problem discovery and mitigation.

The accounting department has asked IT for assistance with creating workflows and reports to assist with AR reporting problems in the past.  Sarah thinks IT did a great job creating payment tracking system, which utilizes Azure Cosmos DB.  Unfortunately, IT resources are constrained, and they do not have the necessary time to develop a new system from the ground up.  Sarah says accounting feels like they are on their own when it comes reporting and process improvements.  They like the independence because, “they know the data and can develop Excel reports quickly.”  She hates the manual time-consuming data merging and the inability to share reports easily. The process is so time consuming, the data becomes stale quickly. The accounting department would like a self-service reporting solution.  Small report configuration changes need to happen quickly without having to wait weeks or months for the IT department to respond.  Guy Information, the CIO, is concerned about the shadow accounting processes created previously and reminded Sarah about how difficult it was to identify and share the correct AR balance data.  Duplicate spreadsheets became a real problem.  IT and Accounting want to make sure there is proper governance and a single source of truth for critical data.

The Chief Executive Officer (CEO), Chief Financial Officer (CFO), Chief Information Officer (CIO), and accounting department are looking for a comprehensive solution to the challenges described above.

### Customer needs

1. Contoso wants to focus on their customers’ payment behavior.  The want to extend credit to the customers with responsible payment history.  Slow-paying customers should be identified as candidates for cash-only sales, have reduced credit lines, and be managed more closely.  The accounting staff needs to identify and collect on invoices at 30, 50, 70 days past due. They need an automated data workflow that updates a centralized dashboard.

2. Predictive analytics will provide the ability forecast cash flows based on customer payment history and sales orders. Contoso would like to fine-tune staff management to ensure optimal resource allocation according to customer payment predictions. The accounting staff will focus on high-risk accounts to maximize payments.

3. They would like to leverage Azure services to extend and innovate data collection and analysis.

4. They would also like to minimize the operational overhead within their current processes. The accounting and IT department would like a low-code self-service approach to reporting and automated workflows.

### Customer objections

1. How will this solution help us to create a better process for visualizing and discovering AR balance problems and collecting payments from our customers?

2. Our staff is already working overtime we don’t want staff to be distracted by a new process and reviewing large reports with tons of data. The accounting and finance departments want a centralized system to create dashboards, share critical data, and automate repetitive manual tasks.  They do not have months to learn a complex tool or wait for IT to create reports for them.

3. Predicting cash flows seems very appealing.  We have heard that creating a machine learning model takes a month to build and another 2-3 months to operationalize to be useable from our production systems. Is this true?

4. Management does not want to spend large amounts of money on IT hardware they have to manage on-premises.

### Infographic for common scenarios

![Diagram illustrating SAP on Azure scenarios and benefits for data pipeline.](media/infographic.png "Infographic - Datapipeline")

## Step 2: Design a proof of concept solution

**Outcome**

Design a solution and prepare to present the solution to the target customer audience in a 15-minute chalk-talk format.

Timeframe: 60 minutes

**Business needs**

Directions: With your team, answer the following questions and be prepared to present your solution to others:

1. Who will you present this solution to? Who is your target customer audience? Who are the decision makers?

2. What customer business needs do you need to address with your solution?

**Design**

Directions: With your team, respond to the following questions:

_High-level architecture_

1. Without getting into the details (the following sections will address the particular details), diagram your initial vision for handling the top-level requirements for:

   - Data ingestion and integration
   - Data transformation and processing
   - Centralized data and predictive analytics
   - Workflow and alert automation

Besides addressing the core functional requirements, consider the resiliency and cost optimization provisions that Contoso is looking for.

_Data ingestion and integration_

1. Which Azure services can you use to ingest data from SAP and non-SAP data sources?

2. Of the options you identified in the previous step, which ones would you recommend to Contoso?

3. What data integration options would Contoso benefit from?

4. Which Azure integration services would you recommend be used by Contoso?

_Data transformation and processing_

1. How would you approach the need for additional analysis of data originating from SAP and non-SAP data sources?

2. Which Azure services would you use to implement the corresponding functionality?

_Data analytics_

1. How would you analyze the data to facilitate identifying relevant information and then sharing it with team members?

2. What Azure services would allow Contoso to further enrich the data by leveraging technologies such as artificial intelligence?

_Streamline repetitive  tasks via automation_

1. How would you automatically send alerts based on KPI thresholds and rules?

2. What services seamlessly integrate with the analytic solution?

**Prepare**

Directions: As a team:

1. Identify any customer needs that are not addressed with the proposed solution.

2. Identify the benefits of your solution.

3. Determine how you will respond to the customer's objections.

Prepare a 15-minute chalk-talk style presentation to the customer.

## Step 3: Present the solution

**Outcome**

Present a solution to the target customer audience in a 15-minute chalk-talk format.

Timeframe: 30 minutes

**Presentation**

Directions:

1. Pair with another team.

2. One group is the Microsoft team and the other is the customer.

3. The Microsoft team presents their proposed solution to the customer.

4. The customer makes one of the objections from the list of objections.

5. The Microsoft team responds to the objection.

6. The customer team gives feedback to the Microsoft team.

7. Switch roles and repeat Steps 2-6.

## Wrap-up

Timeframe: 15 minutes

Directions: Reconvene with the larger group to hear the facilitator/SME share the preferred solution for the case study.

## Additional references

| **Description** | **Links** |
| --------------- | --------- |
| SAP on Azure | <https://azure.microsoft.com/solutions/sap/>
| Connect to SAP systems from Azure Logic Apps | <https://docs.microsoft.com/azure/logic-apps/logic-apps-using-sap-connector> |
| Azure Synapse Analytics | <https://azure.microsoft.com/services/synapse-analytics/> |
| Azure Cosmos DB | <https://azure.microsoft.com/services/cosmos-db/> |
| Azure Machine Learning | <https://azure.microsoft.com/free/machine-learning> |
| Connect to SAP systems from Azure Logic Apps | <https://docs.microsoft.com/azure/logic-apps/logic-apps-using-sap-connector> |
| SAP API Business Hub | <https://api.sap.com/search?searchterm=retail&tab=All&refinedBy=true&top=12> |
| S/4HANA Extensibility: Use Case Overview | <https://blogs.sap.com/2016/09/12/s4hana-extensibility-use-case-overview/> |
| SAP Extension Suite | <https://www.sapinsideronline.com/extend-your-core-business-applications-and-drive-your-business-forward-with-sap-extension-suite/>|
| SAP reference architecture | <https://docs.microsoft.com/en-us/azure/architecture/reference-architectures/sap/sap-overview>|
| SAP Portfolio categories | <https://www.sap.com/products.html>|
| Extracting SAP data using OData | <https://techcommunity.microsoft.com/t5/azure-synapse-analytics-blog/extracting-sap-data-using-odata-part-7-delta-extraction-using/ba-p/2865383> |
