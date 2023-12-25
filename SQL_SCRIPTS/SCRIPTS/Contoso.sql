use ContosoRetailDW;

select * from DimProductCategory;

-- dim tables: ChannelName and StoreType are the same: 
select ChannelKey, ChannelName from DimChannel;											-- 1-Store, 2-Online, 3-Catalog, 4-Reseller
select count(Datekey) from DimDate;														-- 2,556 days or 7 years
select EntityType, count(EntityKey) from DimEntity group by EntityType;					-- Group (3), Country/Region (33), State (79), Store (306)
select GeographyType, count(GeographyKey) from DimGeography group by GeographyType;		-- Continent (3), Country/Region(34), State/Province (120), City (517)
select ProductCategoryKey, ProductCategoryName from DimProductCategory;					-- 1-Audio, 2-TV and Video, 3-Computers, 4-Cameras and camcorders, 5-Cell phones, 6-Music, Movies and Audio Books, 7-Games and Toys, 8-Home Appliances
select count(ProductKey) from DimProduct;												-- 2,517 products
select count(ProductSubcategoryKey) from DimProductSubcategory;							-- 44 sub categories
select count(ProductCategoryKey) from DimProductCategory;								-- 8 categories
select count(PromotionKey) from DimPromotion;											-- 28 Promotions
select ScenarioKey, ScenarioName from DimScenario;										-- 1-Actual, 2-Budget, 3-Forecast
select count(StoreKey) from DimStore;													-- 306 stores
select distinct StoreType from DimStore;												-- Store, Online, Catalog, Reseller

-- fact tables
select	count(distinct OnlineSalesKey),								-- 12,627,608 transactions: order > order line > product, quantity
		count(distinct CustomerKey),	 							-- 18,869 customers
		count(distinct CurrencyKey),								-- 1 currency: USD
		count(distinct DateKey),									-- 1,096 days or 3 years
		count(distinct ProductKey),									-- 2,516 products
		count(distinct PromotionKey),								-- 28 promotions
		count(distinct StoreKey)									-- 3 scenarios
from	FactOnlineSales;

select	count(distinct SalesKey),									-- 3,406,089
		count(distinct ChannelKey),	 								-- 4 channels
		count(distinct CurrencyKey),								-- 1 currency: USD
		count(distinct DateKey),									-- 1,096 days or 3 years
		count(distinct ProductKey),									-- 2,516 products
		count(distinct PromotionKey),								-- 28 promotions
		count(distinct StoreKey)									-- 306 stores
from	FactSales;

select	count(distinct SalesQuotaKey),								-- 7,465,911
		count(distinct ChannelKey),									-- 4 channels
		count(distinct DateKey),									-- 36 months or 3 years
		count(distinct StoreKey),									-- 306 stores
		count(distinct ProductKey),									-- 2,516 Product level
		count(distinct ScenarioKey),								-- 3 scenarios
		count(distinct CurrencyKey)									-- 1 currency: USD
from	FactSalesQuota;

select	count(distinct StrategyPlanKey),							-- 2,750,628
		count(distinct AccountKey),									-- 17 accounts
		count(distinct DateKey),									-- 36 months or 3 years
		count(distinct EntityKey),									-- 306 entities
		count(distinct ProductCategoryKey),							-- 8 product Categories
		count(distinct ScenarioKey),								-- 3 scenarios
		count(distinct CurrencyKey)									-- 1 currency: USD
from	FactStrategyPlan;

--- only 1 EntityType (Store) in FactStrategyPlan, join Entity[EntityName]:Store[StoreName]=N:1
select	distinct e.EntityType
from	DimEntity e,
		FactStrategyPlan sp
where	e.EntityKey=sp.EntityKey;

-- validate 3 measures: Sales vs SalesQuota (Scenario: Actual)
select	CalendarYear,
		sum(SalesQuantity) SalesQuantity,
		sum(SalesAmount) SalesAmount,
		sum(SalesAmount-ReturnAmount-TotalCost) GrossMargin
from	DimDate d,
		FactSales s
where	d.DateKey = s.DateKey
group	by CalendarYear;

select	CalendarYear,
		sum(SalesQuantityQuota) SalesQuantity,
		sum(SalesAmountQuota) SalesAmount,
		sum(GrossMarginQuota) GrossMargin
from	DimDate d,
		FactSalesQuota sq
where	d.DateKey = sq.DateKey
		and ScenarioKey = 1
group	by CalendarYear;

-- get P&L measures (Scenario: Actual, FactStrategyPlan[Cost of Goods Sold] = FactSales[TotalCost])
select	a.AccountKey,
		ParentAccountKey,
		AccountName,
		CalendarYear,
		sum(Amount) Amount
from	DimAccount a,
		DimDate d,
		FactStrategyPlan sp
where	a.AccountKey = sp.AccountKey
		and d.DateKey = sp.DateKey
		and sp.ScenarioKey = 1
group	by a.AccountKey,
			ParentAccountKey,
			AccountName,
			CalendarYear;

-- sample FactSales table
select	top 10 *
from	FactSales
where	ReturnAmount > 0
		and DiscountAmount > 0;

-- sales measures
select	CalendarYear,
		sum(DiscountAmount)/sum(UnitPrice*DiscountQuantity) DiscountRatio,
		sum(ReturnQuantity)/sum(SalesQuantity) ReturnRatio,
		sum(SalesAmount) SalesAmount,
		sum(ReturnAmount) ReturnAmount,
		sum(SalesAmount-ReturnAmount) NetSales,
		sum(TotalCost) TotalCost,
		sum(SalesAmount-ReturnAmount-TotalCost) GrossProfit,
		sum(SalesAmount-ReturnAmount-TotalCost)/SUM(SalesAmount-ReturnAmount) GrossMargin
from	DimDate d,
		FactSales s
where	d.Datekey = s.DateKey
group	by CalendarYear;

-- validate SalesAmount
select	*
from	(select	StoreName Name,
				sum(SalesAmount) SalesAmount
		from	DimStore ds, FactSales fs
		where	ds.StoreKey = fs.StoreKey
		group	by StoreName) x,
		(select	EntityName Name,
				sum(Amount) SalesAmount
		from	DimEntity de,
				FactStrategyPlan fsp
		where	de.EntityKey = fsp.EntityKey
				and AccountKey = 4
				and ScenarioKey = 1
		group	by EntityName) y
where	x.name = y.Name;

select	EntityName,
		CalendarYear,
		ScenarioKey,
		sum(Amount) SalesAmount
from	DimDate dd,
		DimEntity de,
		FactStrategyPlan fsp
where	dd.DateKey = fsp.DateKey
		and de.EntityKey = fsp.EntityKey
		and AccountKey = 4
group	by EntityName,
		   CalendarYear,
		   ScenarioKey
order	by EntityName,
		   CalendarYear,
		   ScenarioKey;

-- StoreArea and Employees (11039)
select	sum(SellingAreaSize) StoreArea,
		sum(EmployeeCount) Employees
from	DimStore

-- Employees (293)
select	count(distinct EmployeeKey) Employees
from	DimEmployee;

-- SKU, Brands, Categories
select	CalendarYear,
		count(distinct b.ProductCategoryKey) Categories,
		count(distinct c.ProductSubcategoryKey) Subcategories,
		count(distinct d.ProductKey) SKUs,
		count(distinct BrandName) Brands,
		count(distinct Manufacturer) Manfacturers
from	DimDate a,
		DimProductCategory b,
		DimProductSubcategory c,
		DimProduct d,
		FactSales e
where	a.DateKey = e.DateKey
		and b.ProductCategoryKey = c.ProductCategoryKey
		and c.ProductSubcategoryKey = d.ProductSubcategoryKey
		and d.ProductKey = e.ProductKey
group	by CalendarYear;

-- Georgraphy > Store
select RegionCountryName from DimGeography where GeographyType = 'Country/Region';

select	CalendarYear,
		count(distinct ContinentName) Continents,
		count(distinct RegionCountryName) Countries,
		count(distinct CityName) Cities,
		count(distinct c.StoreKey) Stores
from	DimDate a,
		DimGeography b,
		DimStore c,
		FactSales d
where	a.DateKey = d.DateKey
		and b.GeographyKey = c.GeographyKey
		and c.StoreKey = d.StoreKey
group	by CalendarYear;

-- convert Geometry to Latitude and Longitude, create a view V_City
use ContosoRetailDW;
go
create view V_City
as
select	GeographyKey,
		GeographyType,
		CityName,
		Geometry,
		Geometry.STY Latitude,
		Geometry.STX Longitude
from	DimGeography
where	GeographyType='City';
go

-- create 2 views: StoreLabel vs ProductLabel
use ContosoRetailDW;
go
create view V_StoreLabel
as
select	StoreKey,
		concat(coalesce([2007],9), coalesce([2008],9)) [2007-2008],
		concat(coalesce([2008],9), coalesce([2009],9)) [2008-2009]
from	(select	CalendarYear,
				StoreKey,
				case when RunningTotal <= Total*0.2 then 0 else 1 end StoreLabel
		from	(select	*,
						sum(GrossProfit) over (partition by CalendarYear order by GrossProfit) RunningTotal,
						sum(GrossProfit) over (partition by CalendarYear) Total
				from	(select	CalendarYear,
								StoreKey,
								sum(SalesAmount-ReturnAmount-TotalCost) GrossProfit
						from	DimDate dd,
								FactSales fs
						where	dd.DateKey = fs.DateKey
						group	by CalendarYear,
								   StoreKey) x) y) z
pivot	(sum(StoreLabel) for CalendarYear in ([2007], [2008], [2009])) pvt;
go

use ContosoRetailDW;
go
create view V_ProductLabel
as
select	ProductKey,
		concat(coalesce([2007],9), coalesce([2008],9)) [2007-2008],
		concat(coalesce([2008],9), coalesce([2009],9)) [2008-2009]
from	(select	CalendarYear,
				ProductKey,
				case when RunningTotal <= Total*0.2 then 0 else 1 end ProductLabel
		from	(select	*,
						sum(GrossProfit) over (partition by CalendarYear order by GrossProfit) RunningTotal,
						sum(GrossProfit) over (partition by CalendarYear) Total
				from	(select	CalendarYear,
								ProductKey,
								sum(SalesAmount-ReturnAmount-TotalCost) GrossProfit
						from	DimDate dd,
								FactSales fs
						where	dd.DateKey = fs.DateKey
						group	by CalendarYear,
									ProductKey) x) y) z
pivot	(sum(ProductLabel) for CalendarYear in ([2007], [2008], [2009])) pvt;
go

-- append Quadrant to FactSales and create a view V_Sales
use ContosoRetailDW;
go
create view V_Sales
as
select	fs.*,
		case when StoreLabel = 1 and ProductLabel = 1 then 1
		     when StoreLabel = 1 and ProductLabel = 0 then 2
			 when StoreLabel = 0 and ProductLabel = 1 then 3
			 when StoreLabel = 0 and ProductLabel = 0 then 4
			 else null end Quadrant
from	FactSales	fs
		left join	DimDate dd
			   on	fs.DateKey = dd.DateKey
		left join	(select	CalendarYear,
							StoreKey,
							case when RunningTotal <= Total*0.2 then 0 else 1 end StoreLabel
							from	(select	*,
											sum(GrossProfit) over (partition by CalendarYear order by GrossProfit) RunningTotal,
											sum(GrossProfit) over (partition by CalendarYear) Total
									from	(select	CalendarYear,
													StoreKey,
													sum(SalesAmount-ReturnAmount-TotalCost) GrossProfit
											from	DimDate dd,
													FactSales fs
											where	dd.DateKey = fs.DateKey
											group	by CalendarYear,
													   StoreKey) x) y) sl
			   on	dd.CalendarYear = sl.CalendarYear
			  and	fs.StoreKey = sl.StoreKey
		left join	(select	CalendarYear,
							ProductKey,
							case when RunningTotal <= Total*0.2 then 0 else 1 end ProductLabel
							from	(select	*,
											sum(GrossProfit) over (partition by CalendarYear order by GrossProfit) RunningTotal,
											sum(GrossProfit) over (partition by CalendarYear) Total
									from	(select	CalendarYear,
													ProductKey,
													sum(SalesAmount-ReturnAmount-TotalCost) GrossProfit
											from	DimDate dd,
													FactSales fs
											where	dd.DateKey = fs.DateKey
											group	by CalendarYear,
														ProductKey) x) y) pl
				on	dd.CalendarYear = pl.CalendarYear
			   and	fs.ProductKey = pl.ProductKey;
go

-- Toboyoo doesn't include "TV and Video" and "Home Appliances, remove these 2 product categories?
select	ProductCategoryName,
		sum(SalesAmount - ReturnAmount) NetSales,
		sum(SalesQuantity - ReturnQuantity) SalesQuantity,
		sum(SalesAmount - ReturnAmount) / sum(SalesQuantity - ReturnQuantity) AverageUnitPrice
from	FactSales a,
		DimProduct b,
		DimProductSubcategory c,
		DimProductCategory d
where	a.ProductKey = b.ProductKey
		and b.ProductSubCategoryKey = c.ProductSubCategoryKey
		and c.ProductCategoryKey = d.ProductCategoryKey
group	by ProductCategoryName;

-- Employees and StoreArea by CalendarYear and StoreKey
select StoreKey, EmployeeCount, SellingAreaSize from DimStore order by StoreKey;

-- NetSales and DiscountAmount by CalendarYear and StoreKey
select	CalendarYear,
		c.StoreKey,
		sum(DiscountAmount) DiscountAmount,
		sum(SalesAmount) SalesAmount
from	DimDate a,
		DimStore b,
		FactSales c
where	a.DateKey = c.DateKey
		and	b.StoreKey = c.StoreKey
group	by CalendarYear, c.StoreKey
order	by CalendarYear, c.StoreKey;


-- NetSales and DiscountAmount by CalendarYear and ProductSubCateogryKey
select	CalendarYear,
		c.ProductSubCategoryKey,
		sum(DiscountAmount) DiscountAmount,
		sum(SalesAmount) SalesAmount
from	DimDate a,
		DimProduct b,
		DimProductSubcategory c,
		FactSales d
where	a.DateKey = d.DateKey
		and b.ProductSubCategoryKey = c.ProductSubCategoryKey
		and	b.ProductKey = d.ProductKey
group	by CalendarYear, c.ProductSubCategoryKey
order	by CalendarYear, c.ProductSubCategoryKey;