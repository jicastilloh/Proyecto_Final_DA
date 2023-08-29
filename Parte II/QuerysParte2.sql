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