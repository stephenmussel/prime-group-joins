-- ***** BASE *****

-- Get all customers and their addresses.
SELECT "c"."first_name", "c"."last_name", "a"."street", "a"."city", "a"."state", "a"."zip"
FROM "customers" as "c"
JOIN "addresses" as "a" ON "c"."id" = "a"."customer_id";

-- Get all orders and their line items (orders, quantity and product).
SELECT "o"."id", "li"."quantity", "li"."product_id" 
FROM "orders" as "o"
JOIN "line_items" as "li" ON "li"."order_id" = "o"."id";

-- Which warehouses have cheetos?
SELECT "w"."warehouse", "description" FROM "warehouse" as "w"
JOIN "warehouse_product" as "wp" ON "w"."id" = "wp"."warehouse_id"
JOIN "products" as "p" ON "p"."id" = "wp"."product_id"
WHERE "description" = 'cheetos';

-- Which warehouses have diet pepsi?
SELECT "w"."warehouse", "description" FROM "warehouse" as "w"
JOIN "warehouse_product" as "wp" ON "w"."id" = "wp"."warehouse_id"
JOIN "products" as "p" ON "p"."id" = "wp"."product_id"
WHERE "description" = 'diet pepsi';

-- Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT "c"."first_name", "c"."last_name", COUNT("o"."id") FROM "customers" as "c"
JOIN "addresses" as "a" ON "c"."id" = "a"."customer_id"
JOIN "orders" as "o" ON "a"."id" = "o"."address_id"
GROUP BY "c"."first_name", "c"."last_name";

-- How many customers do we have?
SELECT COUNT("c"."id") FROM "customers" as "c";

-- How many products do we carry?
SELECT COUNT("p"."id") FROM "products" as "p";

-- What is the total available on-hand quantity of diet pepsi?

-- ***** STRETCH *****

-- How much was the total cost for each order?
-- How much has each customer spent in total?
-- How much has each customer spent in total? Customers who have spent $0 should still show up in the table. It should say 0, not NULL (research coalesce).