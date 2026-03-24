USE CompanyDB;
GO

/* display the first 20 rows*/
SELECT TOP 20* FROM dbo.riyadh_apartments_data ;

/* Number of properties in each neighborhood and its corresponding region */
SELECT Neighborhood,Region, COUNT(*) AS properties_Count FROM dbo.riyadh_apartments_data GROUP BY Neighborhood,Region ORDER BY properties_Count DESC;

/*highest and lowest selling price for each area*/
SELECT Region,MAX([Selling_Price_SAR]) AS Max_price,MIN([Selling_Price_SAR]) AS Min_price,AVG([Selling_Price_SAR]) AS Avg_price
FROM dbo.riyadh_apartments_data
GROUP BY Region
ORDER BY Avg_price DESC;

/*display average Price in each Neighborhood*/
SELECT Neighborhood, AVG([Selling_Price_SAR]) AS Avg_price 
FROM dbo.riyadh_apartments_data
GROUP BY Neighborhood
ORDER BY Avg_price DESC;

/* the relationship between area and price per square meter*/
SELECT Neighborhood,AVG([Selling_Price_SAR] / [Area_sqm] ) AS Avg_price_per_SQM FROM dbo.riyadh_apartments_data
GROUP BY Neighborhood
ORDER BY Avg_price_per_SQM DESC;

/* number of furnished and unfurnished property and average*/
SELECT  Furnished, AVG([Selling_Price_SAR]) AS Avg_price FROM dbo.riyadh_apartments_data GROUP BY Furnished;

/*Avreage price if we have elevator */
SELECT  Elevator, AVG([Selling_Price_SAR]) AS Avg_price FROM dbo.riyadh_apartments_data GROUP BY Elevator;

/*Avreage price and number of bedrooms*/
SELECT  Bedrooms, AVG([Selling_Price_SAR]) AS Avg_price FROM dbo.riyadh_apartments_data GROUP BY Bedrooms ORDER BY Avg_price DESC;

/*Avreage price and number of bathrooms*/
SELECT  Bathrooms, AVG([Selling_Price_SAR]) AS Avg_price FROM dbo.riyadh_apartments_data GROUP BY Bathrooms ORDER BY Avg_price DESC;

/* the relationship between Property age years and price */
SELECT Property_Age_years, COUNT(*) AS Property_Count,AVG([Selling_Price_SAR]) AS Avg_Price
FROM dbo.riyadh_apartments_data
GROUP BY Property_Age_years
ORDER BY Avg_Price DESC ;

/* the relationship between floor number and price */
SELECT Floor_Number, COUNT(*) AS Property_Count,AVG([Selling_Price_SAR]) AS Avg_Price
FROM dbo.riyadh_apartments_data
GROUP BY Floor_Number
ORDER BY Floor_Number DESC;

/* display top 5 high and low property */
/*the most expensive*/
SELECT TOP 5 * FROM dbo.riyadh_apartments_data ORDER BY Selling_Price_SAR DESC ;
 /*the cheapest*/
SELECT TOP 5 * FROM dbo.riyadh_apartments_data ORDER BY Selling_Price_SAR ASC ;

/* The most expensive property in each region and in which Neighborhood*/
SELECT Region,Neighborhood, MAX([Selling_Price_SAR]) AS MaxPrice FROM dbo.riyadh_apartments_data
GROUP BY Region, Neighborhood
HAVING MAX([Selling_Price_SAR]) = (
    SELECT MAX([Selling_Price_SAR]) 
    FROM dbo.riyadh_apartments_data AS P2 
    WHERE P2.Region = dbo.riyadh_apartments_data.Region
)
ORDER BY MaxPrice DESC ;

/* The cheapest property in each region and in which Neighborhood*/ 
SELECT Region,Neighborhood, MIN([Selling_Price_SAR]) AS MinPrice FROM dbo.riyadh_apartments_data
GROUP BY Region, Neighborhood
HAVING MIN([Selling_Price_SAR]) = (
    SELECT MIN([Selling_Price_SAR]) 
    FROM dbo.riyadh_apartments_data AS P2 
    WHERE P2.Region = dbo.riyadh_apartments_data.Region
)
ORDER BY MinPrice ASC ;
