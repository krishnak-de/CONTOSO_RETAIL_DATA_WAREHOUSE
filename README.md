***CONTOSO_RETAIL_DATA_WAREHOUSE***

<sub>This is a data warehouse for a fictional retail company called "CONTOSO" with a catalogue of more than 100K+ products and thousands of customers. As a BI consultant, tasked with a report for shareholder to analyze financial statement KPIs that are prevelant for shareholders.
Report includes 3 pages of basis analysis, 3 pages of in-depth analysis. Basic analysis includes 3 dimensions of a retail operating model - people, products and stores, and a 360-degree view of sales and profit KPIs. In-depth analysis includes 4-quadrant analysis, organic growth analysis and discount analysis.
Power BI is used for interactive reports, KPI display on the left to primary analysis in the middle and secondary analysis on the right of all reports. Number of visual groups are limited to 6, bookmarks and buttons are used to toggle multiple analysis.</sub>

**MS SQL SERVER TABLES**
![SQLSERVER_TABLES](https://github.com/krishnak-de/CONTOSO_RETAIL_DATA_WAREHOUSE/assets/130612282/0642f0c0-b55c-4139-b593-419bb9c9c6c1)

**MS SQL SERVER VIEWS**
![image](https://github.com/krishnak-de/CONTOSO_RETAIL_DATA_WAREHOUSE/assets/130612282/264a5cf5-f6e2-45a1-a6a8-92d87e1b152d)

**Following database objects are used to connect with Power Query Editor in Power BI for data modeling.**
  -	V_City
  -	V_Productlabel
  - V_Sales
  -	V_StoreLabel
  - DimAccount
  -	DimChannel
  -	DimDate
  -	DimEntity
  -	DimGeography
  -	DimProduct
  -	DimProductCategory
  -	DimProductSubcategory
  -	DimPromotion
  -	DimScenario
  -	DimStore
  -	FactStrategyPlan

**Power BI Data Model**
![PowerBI_DataModel_CONTOSO](https://github.com/krishnak-de/CONTOSO_RETAIL_DATA_WAREHOUSE/assets/130612282/7d9befce-c61d-4c8d-9d1b-2d83969ba75c)

**Data Relationships in Power BI**
  <sub>Fact tables: Sales, Strategy Plan</sub>
  -From Sales to
    -	Channel: ChannelKey
    -	Date: DateKey
    -	Product: ProductKey
    -	Promotion: PromotionKey
    -	Store: StoreKey
  -From StrategyPlan to
    -	Account: AccountKey
    -	Date: DateKey
    -	Entity: EntityKey
    -	ProdcutCategory: ProductCateogryKey
    -	Scenario: ScenarioKey
    
-Dimension Table Relationships
  -	Entity to Store: EntityName  StoreName
  -	Product to ProductSubcategory: ProductSubcategoryKey
  -	ProductLabel to Product: ProductKey
  -	ProductSubcategory to ProductCategory: ProductCategoryKey
  -	Store to City: GeographyKey
  -	Store to Geography: GeographyKey
  -	StoreLabel to Store: StoreKey

**CONTOSO RETAIL DASHBOARD**
![CONTOSO_DASHBOARD](https://github.com/krishnak-de/CONTOSO_RETAIL_DATA_WAREHOUSE/assets/130612282/adcb28f6-60bc-4156-b620-a78b565aca71)
