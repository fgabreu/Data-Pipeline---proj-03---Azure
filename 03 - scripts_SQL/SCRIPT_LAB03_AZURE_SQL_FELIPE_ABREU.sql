CREATE SCHEMA STAGE_felipe_abreu
GO
CREATE SCHEMA DW_felipe_abreu
GO

CREATE TABLE STAGE_felipe_abreu.orders(
	Region VARCHAR(50),
	Country	VARCHAR(50),
	Item_Type VARCHAR(50),
	Sales_Channel VARCHAR(50),
	Order_Priority VARCHAR(50),
	Order_Date	DATE,
	Order_ID INT PRIMARY KEY,
	Ship_Date DATE,
	Units_Sold INT,
	Unit_Price FLOAT,
	Unit_Cost FLOAT,
	Total_Revenue FLOAT,
	Total_Cost FLOAT,
	Total_Profit FLOAT
)


--CRIAÇÃO DAS TABELAS DIMENSÕES

CREATE TABLE DW_felipe_abreu.DIM_region(
	Id_Region INT NOT NULL PRIMARY KEY IDENTITY,
	Region VARCHAR(50)
)

CREATE TABLE DW_felipe_abreu.DIM_country(
	Id_Country INT NOT NULL PRIMARY KEY IDENTITY,
	Country VARCHAR(50)
)

CREATE TABLE DW_felipe_abreu.DIM_channel(
	Id_Sales_Channel INT NOT NULL PRIMARY KEY IDENTITY,
	Sales_Channel VARCHAR(50) NOT NULL
)



--CRIAÇÃO DA TABELA FATO

CREATE TABLE DW_felipe_abreu.FATO_sales(
	Region VARCHAR(50),
	Country	VARCHAR(50),
	Item_Type VARCHAR(50),
	Sales_Channel VARCHAR(50),
	Order_Priority VARCHAR(50),
	Order_Date	DATE,
	Order_ID INT PRIMARY KEY,
	Ship_Date DATE,
	Units_Sold INT,
	Unit_Price FLOAT,
	Unit_Cost FLOAT,
	Total_Revenue FLOAT,
	Total_Cost FLOAT,
	Total_Profit FLOAT
)


-- CRIAÇÃO DA STORAGE PROCEDURE
CREATE PROCEDURE DW_felipe_abreu.procedure_felipe_abreu
AS  
BEGIN

TRUNCATE TABLE DW_felipe_abreu.DIM_channel
TRUNCATE TABLE DW_felipe_abreu.DIM_country
TRUNCATE TABLE DW_felipe_abreu.DIM_region
TRUNCATE TABLE DW_felipe_abreu.FATO_sales 

INSERT INTO DW_felipe_abreu.DIM_channel(Sales_Channel)
	SELECT Sales_Channel FROM STAGE_felipe_abreu.orders 
	GROUP BY Sales_Channel
	ORDER BY Sales_Channel;

INSERT INTO DW_felipe_abreu.DIM_country(Country)
	SELECT Country FROM STAGE_felipe_abreu.orders 
	GROUP BY Country
	ORDER BY Country;

INSERT INTO DW_felipe_abreu.DIM_region(Region)
	SELECT Region FROM STAGE_felipe_abreu.orders 
	GROUP BY Region
	ORDER BY Region;

INSERT INTO DW_felipe_abreu.FATO_sales (
			Region,                   	                             
			Country,
			Item_Type,
			Sales_Channel,
			Order_Priority,	
			Order_Date,	
			Order_ID,
			Ship_Date,
			Units_Sold,	
			Unit_Price,
			Unit_Cost,	
			Total_Revenue,	
			Total_Cost,	
			Total_Profit)

	SELECT 	o.Region,                   	                             
			o.Country,
			o.Item_Type,
			o.Sales_Channel,
			o.Order_Priority,	
			o.Order_Date,	
			o.Order_ID,
			o.Ship_Date DATE,
			o.Units_Sold,	
			o.Unit_Price,
			o.Unit_Cost,	
			o.Total_Revenue,	
			o.Total_Cost,	
			o.Total_Profit 
		FROM STAGE_felipe_abreu.orders AS o
		INNER JOIN DW_felipe_abreu.DIM_channel AS s
			ON s.Sales_Channel = o.Sales_Channel
		INNER JOIN DW_felipe_abreu.DIM_country AS c
			ON c.Country = o.Country
		INNER JOIN DW_felipe_abreu.DIM_region AS r 
			ON r.Region = o.Region
		TRUNCATE TABLE STAGE_felipe_abreu.orders;
END



