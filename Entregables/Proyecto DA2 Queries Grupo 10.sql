-- Query Parte I #1
SELECT COUNT(*)
FROM customer_shopping;

-- Query Parte I #2
SELECT SUM(quantity*price) AS "Grand Total"
FROM customer_shopping;

-- Query Parte I #3
SELECT TO_CHAR(MIN(invoice_date), 'YYYY-Mon-DD') AS "Fecha Menor", 
	   TO_CHAR(MAX(invoice_date), 'YYYY-Mon-DD') AS "Fecha Mayor"
FROM customer_shopping;

SELECT *
FROM categories;

-- Query Parte I #4
SELECT cu_shop.invoice_date, 
	   cu_shop.invoice_no, 
	   cu_shop.customer_id,
	   shop_m.shopping_mall
FROM customer_shopping cu_shop
JOIN shopping_malls shop_m ON shop_m.shopping_mall_id = cu_shop.shopping_mall_id
JOIN genders gen ON gen.gender_id = cu_shop.gender_id
JOIN categories cat ON cat.category_id = cu_shop.category_id
JOIN payment_methods pay_me ON pay_me.pmt_method_id = cu_shop.payment_method_id
WHERE (EXTRACT(YEAR FROM cu_shop.invoice_date) = 2021 OR EXTRACT(YEAR FROM cu_shop.invoice_date) = 2022)
	  AND (UPPER(shop_m.district) IN('LEVENT', 'BESIKTAS'))
	  AND (UPPER(gen.gender) = 'FEMALE')
	  AND (cu_shop.age >= 18 AND cu_shop.age <= 25)
	  AND (UPPER(cat.category) IN('CLOTHING', 'SHOES', 'COSMETICS'))
	  AND (UPPER(pay_me.payment_method) IN('CREDIT CARD', 'DEBIT CARD'))
	  AND ((quantity*price) >= 10000);
	  
-- Query Parte I #5
SELECT TO_CHAR(invoice_date, 'YYYY-MM') AS "invoice_date", 
	   SUM(quantity) AS "quantity", 
	   COUNT(invoice_no) AS "transactions", 
	   SUM(quantity*price) "total"
FROM customer_shopping
GROUP BY TO_CHAR(invoice_date, 'YYYY-MM')
ORDER BY TO_CHAR(invoice_date, 'YYYY-MM') ASC;

-- Query Parte I #6
SELECT shop_m.shopping_mall, SUM(quantity*price) AS "total"
FROM customer_shopping cu_shop
JOIN shopping_malls shop_m ON shop_m.shopping_mall_id = cu_shop.shopping_mall_id
GROUP BY shop_m.shopping_mall;

-- Query Parte I #7
SELECT gen.gender, cu_shop.age, SUM(quantity*price) AS "total"
FROM customer_shopping cu_shop
JOIN genders gen ON gen.gender_id = cu_shop.gender_id
GROUP BY gen.gender, cu_shop.age;

-- Query Parte I #8
SELECT TO_CHAR(invoice_date, 'YYYY-MM') AS "invoice_date", 
	   (SUM(price * quantity)/SUM(quantity)) AS precio_promedio_por_item
FROM customer_shopping
GROUP BY TO_CHAR(invoice_date, 'YYYY-MM')
ORDER BY TO_CHAR(invoice_date, 'YYYY-MM') ASC;

-- Query Parte I #9
SELECT TO_CHAR(invoice_date, 'YYYY-MM') AS "invoice_date", 
	   AVG(price * quantity) AS monto_promedio_por_factura
FROM customer_shopping
GROUP BY TO_CHAR(invoice_date, 'YYYY-MM')
ORDER BY TO_CHAR(invoice_date, 'YYYY-MM') ASC;

-- Query Parte I #10
SELECT cu_shop.invoice_date,
	   cat.category,
	   shop_m.shopping_mall,
	   shop_m.district,
	   pay_me.payment_method,
	   cu_shop.age,
	   gen.gender
FROM customer_shopping cu_shop
JOIN shopping_malls shop_m ON shop_m.shopping_mall_id = cu_shop.shopping_mall_id
JOIN genders gen ON gen.gender_id = cu_shop.gender_id
JOIN categories cat ON cat.category_id = cu_shop.category_id
JOIN payment_methods pay_me ON pay_me.pmt_method_id = cu_shop.payment_method_id;

--------------------------------------------------------------------------------

-- Query Parte II
SELECT cu_shop.invoice_no,
	   cu_shop.invoice_date,
	   shop_m.shopping_mall,
	   shop_m.district,
	   cu_shop.customer_id,
	   gen.gender,
	   cu_shop.age,
	   cat.category,
	   pay_me.payment_method,
	   cu_shop.quantity,
	   cu_shop.price
FROM customer_shopping cu_shop
JOIN shopping_malls shop_m ON shop_m.shopping_mall_id = cu_shop.shopping_mall_id
JOIN genders gen ON gen.gender_id = cu_shop.gender_id
JOIN categories cat ON cat.category_id = cu_shop.category_id
JOIN payment_methods pay_me ON pay_me.pmt_method_id = cu_shop.payment_method_id;