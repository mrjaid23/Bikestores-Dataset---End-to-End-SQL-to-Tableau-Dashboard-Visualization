-- CREATE A TABLE TO populate the Order ID, Customer Full name, City, State, Order date, Volume sold, revenue, Product name, Product Category, Store name, and Staff name.

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
