# Bikestores-Dataset---End-to-End-SQL-to-Tableau-Dashboard-Visualization

## Table of Contents
- [Project Overview](#Project-Overview) 
- [Data Source](#Data-Source)
- [Objectives](#Objectives)
- [Tools](#Tools)
- [Data Collection](#Data-Collection)
- [Data Cleaning/Preparation](#Data-Cleaning/Preparation)
- [Data Gathering/Analysis](#Data-Gathering/Analysis)
- [Results](#Results)
- [Insights](#Insights)

### Project Overview 
Welcome to the Bikestore Dataset Dashboard Project! This repository contains a comprehensive analysis of Bike data sales, presented through an interactive dashboard created using Tableau with data exploration and extraction using SQL query from the Store sales data imported into SQL Server. The dashboard provides insights into sales trends, top sales rep, and state-specific sales data, customer data etc. By leveraging Tableau's powerful visualization capabilities and SQL Server's robust data management, this project aims to deliver actionable insights that drive informed decision-making and strategic planning. 

### Data Source
The Dataset used for this analysis is the "Bikestores.xlsx" file, containing detailed information about each sales made. 

### Objectives
The objective of this project is to design and implement a dynamic and interactive dashboard that provides comprehensive insights into the company's sales performance. The dashboard will aggregate and display key metrics derived from the sales data, enabling management to make informed decisions based on real-time information.

### Tools
- SQL Server Management Studio (SSMS)
- Tableau

### Data Collection
The company's data was exported from the company database into an Excel file named 'Bikestores.xlsx'. This file was then imported into SQL Server Management Studio (SSMS) to facilitate the retrieval of the necessary data for analysis. The data retrieval followed the process of writing a set of SQL queries as shown below;

```SQL query
SELECT ord.order_id, CONCAT(sc.first_name,' ', sc.last_name) AS customer_fullname, sc.city, sc.state, ord.order_date, SUM(sit.quantity) AS 'total_units', SUM(sit.quantity * sit.list_price) AS 'revenue', pp.product_name, pc.category_name, ss.store_name, CONCAT(sst.first_name, ' ', sst.last_name) AS 'Sales_rep', pb.brand_name
FROM sales.orders AS ord
JOIN sales.customers AS sc
ON ord.customer_id = sc.customer_id
JOIN sales.order_items AS sit
ON ord.order_id = sit.order_id
JOIN production.products AS pp
ON pp.product_id = sit.product_id
JOIN production.categories AS pc
ON pc.category_id = pp.category_id
JOIN sales.stores AS ss
ON ss.store_id = ord.store_id
JOIN sales.staffs AS sst
ON sst.staff_id = ord.staff_id
JOIN production.brands AS pb
ON pb.brand_id = pp.brand_id
GROUP BY ord.order_id, 
		CONCAT(sc.first_name,' ', sc.last_name), 
		sc.city, 
		sc.state, 
		ord.order_date,
		pp.product_name,
		pc.category_name,
		ss.store_name,
		CONCAT(sst.first_name, ' ', sst.last_name),
		pb.brand_name
```
### Data Cleaning
Extensive data cleaning was carried out to ensure the accuracy and reliability of the retrieved dataset. We found that our data was accurate, with no significant errors or discrepancies. 

### Data Gathering/Analysis
The retrieved dataset was successfully imported into the Tableau work environment. Various metrics were analyzed in alignment with the project objectives. This process included:

**1. Data Importation:**
- The dataset was loaded into Tableau, ensuring all necessary fields and tables were accurately represented.
- Initial data validation was performed to verify data integrity and completeness.

**2. Metric Analysis:**
- Key performance indicators (KPIs) and metrics were identified based on the project’s goals.
Detailed analysis was conducted on several dimensions, including:
- Sales Performance: Evaluation of total sales, revenue trends, and unit sales across different periods.
- Customer Insights: Analysis of customer demographics and purchasing behavior.
- Product Analysis: Examination of product performance by category and brand, identifying top-selling products and underperformers.
- Store Performance: Assessment of sales performance by store location and sales representative efficiency.
- Top Sales Person

### Insights
### Insights
[Tableau Public Link ](https://public.tableau.com/views/BikeStoresExecutiveDashboard_17224005264160/Dashboard1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)


