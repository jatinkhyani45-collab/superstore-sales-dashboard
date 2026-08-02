CREATE DATABASE superstore_db;
USE superstore_db;
CREATE TABLE superstoreee (
    Row_ID INT,
    Order_ID VARCHAR(30),
    Order_Date DATE,
    Ship_Date DATE,
    Ship_Mode VARCHAR(50),
    Customer_ID VARCHAR(30),
    Customer_Name VARCHAR(100),
    Segment VARCHAR(50),
    Country VARCHAR(50),
    City VARCHAR(100),
    State VARCHAR(100),
    Postal_Code INT,
    Region VARCHAR(50),
    Product_ID VARCHAR(50),
    Category VARCHAR(50),
    Sub_Category VARCHAR(50),
    Product_Name VARCHAR(255),
    Sales DECIMAL(10,2),
    Quantity INT,
    Discount DECIMAL(5,2),
    Profit DECIMAL(10,2),
    Order_Year INT,
    Order_Month VARCHAR(20),
    Month_No INT,
    Quarter INT,
    Ship_Days INT,
    Profit_Margin DECIMAL(10,2)
);
SELECT COUNT(*) AS Total_Rows FROM superstoreee;
DESCRIBE superstoreee;

 -- Total Sales
SELECT ROUND(SUM(Sales),2) AS Total_Sales FROM superstoreee;

 -- Total Profit
SELECT ROUND(SUM(Profit),2) AS Total_Profit FROM superstoreee;

 -- Total Orders
SELECT COUNT(DISTINCT `Order ID`) AS Total_Orders FROM superstoreee;

 -- Total Customers
SELECT COUNT(DISTINCT `Customer ID`) AS Total_Customers FROM superstoreee; 

 -- Average Order Value
SELECT ROUND(AVG(OrderSales),2) AS Average_Order_Value FROM (SELECT `Order ID`, SUM(Sales) AS OrderSales FROM superstoreee GROUP BY `Order ID`) AS Orders;

 -- Sales by Category
SELECT Category,ROUND(SUM(Sales),2) AS Sales FROM superstoreee GROUP BY Category ORDER BY Sales DESC;

 -- Profit by Category
SELECT Category,ROUND(SUM(Profit),2) AS Profit FROM superstoreee GROUP BY Category ORDER BY Profit DESC;

 -- Sales by Sub-Category
SELECT 'Sub-Category' , ROUND(SUM(Sales),2) AS Sales FROM superstoreee GROUP BY 'Sub- Category'  ORDER BY Sales DESC;

 -- Profit by Sub-Category
SELECT 'Sub-Category', ROUND(SUM(Profit),2) AS Profit FROM superstoreee GROUP BY 'Sub-Category' ORDER BY Profit DESC;

 -- Top 10 Products by Sales
SELECT 'Product Name', ROUND(SUM(Sales),2) AS Sales FROM superstoreee GROUP BY 'Product Name' ORDER BY Sales DESC LIMIT 10;

 -- Sales by Region
SELECT Region,ROUND(SUM(Sales),2) AS Total_Sales FROM superstoreee GROUP BY Region ORDER BY Total_Sales DESC;

 -- Profit by Region
 SELECT Region,ROUND(SUM(Profit),2) AS Total_Profit FROM superstoreee GROUP BY Region ORDER BY Total_Profit DESC;
 
 -- Sales by State
 SELECT State,ROUND(SUM(Sales),2) AS Total_Sales FROM superstoreee GROUP BY State ORDER BY Total_Sales DESC;
 
 -- Top 10 States by Profit
 SELECT State,ROUND(SUM(Profit),2) AS Total_Profit FROM superstoreee GROUP BY State ORDER BY Total_Profit DESC LIMIT 10;

 -- Bottom 10 States by Profit
 SELECT State,ROUND(SUM(Profit),2) AS Total_Profit FROM superstoreee GROUP BY State ORDER BY Total_Profit ASC LIMIT 10;
 
 -- Sales by Customer Segment
 SELECT Segment,ROUND(SUM(Sales),2) AS Total_Sales,ROUND(SUM(Profit),2) AS Total_Profit FROM superstoreee GROUP BY Segment ORDER BY Total_Sales DESC;
 
 -- Average Discount by Category
 SELECT Category,ROUND(AVG(Discount)*100,2) AS Avg_Discount_Percentage FROM superstoreee GROUP BY Category ORDER BY Avg_Discount_Percentage DESC;
 
 -- Average Profit Margin by Category
 SELECT Category,ROUND((SUM(Profit)/SUM(Sales))*100,2) AS Profit_Margin_Percentage FROM superstoreee GROUP BY Category ORDER BY Profit_Margin_Percentage DESC;
 
-- Top 10 Customers by Sales
SELECT `Customer Name`,ROUND(SUM(Sales),2) AS Total_Sales FROM superstoreee GROUP BY `Customer Name` ORDER BY Total_Sales DESC LIMIT 10;
 
 -- Top 10 Customers by Profit
 SELECT `Customer Name`,ROUND(SUM(Profit),2) AS Total_Profit FROM superstoreee GROUP BY `Customer Name` ORDER BY Total_Profit DESC LIMIT 10;
 
 -- Top 10 Products by Profit
 SELECT `Product Name`,ROUND(SUM(Profit),2) AS Total_Profit FROM superstoreee GROUP BY `Product Name` ORDER BY Total_Profit DESC LIMIT 10;
 
 -- Top 10 Loss-Making Products
SELECT `Product Name`,ROUND(SUM(Profit),2) AS Total_Profit FROM superstoreee GROUP BY `Product Name` ORDER BY Total_Profit ASC LIMIT 10; 

 -- Orders with High Discount
 SELECT `Order ID`,`Product Name`,Discount,Profit FROM superstoreee WHERE Discount >= 0.30 ORDER BY Discount DESC;
 
 -- Products Sold More Than 100 Times
 SELECT `Product Name`,SUM(Quantity) AS Total_Quantity FROM superstoreee GROUP BY `Product Name` HAVING SUM(Quantity) > 100 ORDER BY Total_Quantity DESC;
 
-- Categories with Profit Greater Than $50,000
 SELECT Category,ROUND(SUM(Profit),2) AS Total_Profit FROM superstoreee GROUP BY Category HAVING SUM(Profit) > 50000;
 
-- States Having Sales Greater Than $100,000
SELECT State,ROUND(SUM(Sales),2) AS Total_Sales FROM superstoreee GROUP BY State HAVING SUM(Sales) > 100000 ORDER BY Total_Sales DESC;

-- Average Shipping Time by Ship Mode
SELECT `Ship Mode`,ROUND(AVG(`Ship Date`),2) AS Average_Shipping_Days FROM superstoreee GROUP BY `Ship Mode` ORDER BY Average_Shipping_Days;
 
-- Number of Orders by Region
 SELECT Region,COUNT(DISTINCT `Order ID`) AS Total_Orders FROM superstoreee GROUP BY Region ORDER BY Total_Orders DESC;
 
-- Number of Customers by State
SELECT State,COUNT(DISTINCT `Customer ID`) AS Total_Customers FROM superstoreee GROUP BY State ORDER BY Total_Customers DESC; 
  
-- Most Profitable Category in Each Region
SELECT Region,Category,ROUND(SUM(Profit),2) AS Total_Profit FROM superstoreee GROUP BY Region, Category ORDER BY Region, Total_Profit DESC;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
SELECT *  FROM superstoreee LIMIT 5;
