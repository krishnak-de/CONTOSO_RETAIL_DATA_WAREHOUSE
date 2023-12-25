***CONTOSO_RETAIL_DATA_WAREHOUSE***
    **This is a data warehouse for a fictional retail company called "CONTOSO" with a catalogue of more than 100K+ products and thousands of customers. As a BI consultant, tasked with a report for shareholder to analyze financial statement KPIs that are prevelant for shareholders.
Report includes 3 pages of basis analysis, 3 pages of in-depth analysis. Basic analysis includes 3 dimensions of a retail operating model - people, products and stores, and a 360-degree view of sales and profit KPIs. In-depth analysis includes 4-quadrant analysis, organic growth analysis and discount analysis.
Power BI is used for interactive reports, KPI display on the left to primary analysis in the middle and secondary analysis on the right of all reports. Number of visual groups are limited to 6, bookmarks and buttons are used to toggle multiple analysis.**

**MS SQL SERVER TABLES**
![SQLSERVER_TABLES](https://github.com/krishnak-de/CONTOSO_RETAIL_DATA_WAREHOUSE/assets/130612282/0642f0c0-b55c-4139-b593-419bb9c9c6c1)

**MS SQL SERVER VIEWS - SQL code in Contoso.sql file from line 199 - 308 will create the following views upon execution**
![image](https://github.com/krishnak-de/CONTOSO_RETAIL_DATA_WAREHOUSE/assets/130612282/264a5cf5-f6e2-45a1-a6a8-92d87e1b152d)


**Following database objects are used to get data from MS SQL SERVER into Power BI Power Query Editor for data modeling.**
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
    
**Data Transformation/Cleaning in Power Query Editor**
  - Remove all table prefixes (V_, Dim, Fact).
  - Only keep the following columns listed next to each table and remove other columns (Please see below for the enclosed screenshot of Power BI Data Model):
    - Account Table: AccountKey, ParentAccountKey, AccountName, AccountType.
    - Channel Table: ChannelKey, ChannelName.
    - Date Table: DateKey, CalenderYear, CalenderQuarter, CalenderMonth. Change DateKey to “Date” datatype, Filter CalenderYear only for 2007,2008, and 2009.
    - Entity table: EntityKey, ParentEntityKey, EntityName, EntityType.
    - Flag table: Transform - Use first row as headers.
    - Geography table: GeographyKey, GeographyType, ContinentName, CityName, StateProvinceName, Region CountryName. Select RegionCountryName, right click -> Transform -> Trim. Merge Queries: Geography and Flag Left Outer on RegionCountryName. Expand Flag, only select ImageURL. Uncheck use original table as prefix.
    - Product Table: ProductKey, ProductName, ProductSubcategoryKey, Manufacturer, BrandName, ClassName..
    - Product Category Table: ProductCategoryKey, ProductCategoryName.
    - Product Subcategory Table: ProductSubcategoryKey, ProductSubcategoryName, ProductCategoryKey.
    - Promotion Table: PromotionKey, PromotionName, PromotionType, StartDate, EndDate. Remove other columns. Change StartDate and EndDate datatype to “Date”.
    - Sales Table: Remove CurrencyKey, UnitCost, ETLLoadID, LoadDate, UpdateDate. Change DateKey datatype to “Date”.
    - Scenario Table: ScenarioKey, ScenarioName.
    - Store Table: StoreKey, GeographyKey, StoreType, StoreName, Status, OpenDate, CloseDate, EmployeeCount, SellingAreaSize. Remove other columns. Change OpenDate and CloseDate datatype to “Date”.
    - Strategy Plan Table: StrategyPlanKey, DateKey, EntityKey, ScenarioKey, AccountKey, ProductCategoryKey, Amount. Remove other columns. Change DateKey datatype to “Date”. Filter ScenarioKey: 1,2, Filter AccountKey: 4,9,11. 


**Power BI Data Model**
![PowerBI_DataModel_CONTOSO](https://github.com/krishnak-de/CONTOSO_RETAIL_DATA_WAREHOUSE/assets/130612282/7d9befce-c61d-4c8d-9d1b-2d83969ba75c)

**Data Relationships in Power BI**
  - Fact tables: Sales, Strategy Plan
  - From Sales to
    -	Channel: ChannelKey
    -	Date: DateKey
    -	Product: ProductKey
    -	Promotion: PromotionKey
    -	Store: StoreKey
  - From StrategyPlan to
    -	Account: AccountKey
    -	Date: DateKey
    -	Entity: EntityKey
    -	ProdcutCategory: ProductCateogryKey
    -	Scenario: ScenarioKey
    
- Dimension Table Relationships
  -	Entity to Store: EntityName  StoreName
  -	Product to ProductSubcategory: ProductSubcategoryKey
  -	ProductLabel to Product: ProductKey
  -	ProductSubcategory to ProductCategory: ProductCategoryKey
  -	Store to City: GeographyKey
  -	Store to Geography: GeographyKey
  -	StoreLabel to Store: StoreKey

**CONTOSO RETAIL DASHBOARD**
![CONTOSO_DASHBOARD](https://github.com/krishnak-de/CONTOSO_RETAIL_DATA_WAREHOUSE/assets/130612282/adcb28f6-60bc-4156-b620-a78b565aca71)
