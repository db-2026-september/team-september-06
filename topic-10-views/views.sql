-- ================================================================
-- SQL VIEWS TEMPLATE (TOPIC 10)
-- ================================================================
-- WHAT SHOULD BE ADDED HERE:
-- 1) CREATE VIEW scripts for required view types:
--    - Horizontal view (select specific columns)
--    - Vertical view (filter specific rows)
--    - Mixed view (columns + row filters)
--    - Join-based view (multiple tables)
--    - Subquery-based view
--    - UNION-based view
--    - View based on another view
--    - Updatable view with WITH CHECK OPTION
--
-- 2) Comments before each view explaining:
--    - Purpose of the view
--    - How it supports your project design
--
-- 3) Optional demo SELECT statements to show view output.
--
-- RECOMMENDED ORDER:
-- 1) Simple views (horizontal / vertical / mixed)
-- 2) Join and subquery views
-- 3) UNION and layered views
-- 4) CHECK OPTION view
--
-- IMPORTANT:
-- - Script must execute in PostgreSQL without errors.
-- - Keep naming consistent and readable.
-- - Submit all views in this single SQL file.
-- ================================================================

-- Add your CREATE VIEW statements below this line


--Horizontal views — selecting specific columns, for example, a view showing only book titles and authors.
--Show the menu categories and items, common for all the locations
--convenient way to see the common menu without redundant data, categories and items only
CREATE OR REPLACE VIEW ua_4778_manual_v2.common_menu_view AS
SELECT menu_items.category, name
FROM ua_4778_manual_v2.menu_items
ORDER BY category;


--Vertical views — selecting specific rows based on conditions, for example, a view showing only overdue borrowings.
--see all orders per specified location
--useful for the specified location web view
CREATE OR REPLACE VIEW ua_4778_manual_v2.location_sumska_orders_view AS
SELECT *
FROM ua_4778_manual_v2.orders
WHERE location_id = 8
ORDER BY status;

--Mixed views — combining both column and row selection, for example, a view showing active members and their contact information.
--show comment and customer info, for satisfied customers among all locations
--ability to track satisfied customers
CREATE OR REPLACE VIEW ua_4778_manual_v2.top_rating_feedback_view AS
SELECT comment, customer_info
FROM ua_4778_manual_v2.customer_feedback
WHERE rating = 5;

--Views that involve joining multiple tables, for example, a view showing members and the books they have borrowed.
--show menu items including prices per specified location
--web view of menu and prices per location
CREATE OR REPLACE VIEW ua_4778_manual_v2.location_sumska_menu_view AS
SELECT mi.category, mi.name, price_usd
FROM ua_4778_manual_v2.menu_items mi
         JOIN ua_4778_manual_v2.locations_menu_items lmi ON mi.menu_item_id = lmi.menu_item_id
WHERE lmi.location_id = 8
ORDER BY category;

--Views that use subqueries, for example, a view showing books with an average rating above 4.
--show all contacts of specified goods category per specified location
--helps to reach out suppliers of specific goods category per location
CREATE OR REPLACE VIEW ua_4778_manual_v2.location_sumska_beverages_suppliers_contacts AS
SELECT first_name, last_name, job_title, email, phone
FROM ua_4778_manual_v2.supplier_contacts
WHERE supplier_id IN
      (SELECT DISTINCT insp.supplier_id
       FROM ua_4778_manual_v2.ingredients_suppliers insp
                JOIN ua_4778_manual_v2.ingredients i ON insp.ingredient_id = i.ingredient_id
                JOIN ua_4778_manual_v2.basic_inventory_suppliers bis ON insp.supplier_id = bis.supplier_id
                JOIN ua_4778_manual_v2.basic_inventory bi ON bis.basic_inventory_id = bi.basic_inventory_id
       WHERE i.inventory_type_id = 8
         AND bis.basic_inventory_id IN
             (SELECT basic_inventory_id FROM ua_4778_manual_v2.basic_inventory WHERE location_id = 8));

--Views that use UNION operations, for example, a view combining current and past reservations.
--show the most satisfied and not satisfied feedback
--ability to track the most valuable feedback
CREATE OR REPLACE VIEW ua_4778_manual_v2.rating_feedback_highest_and_lowest_view AS
SELECT customer_feedback.rating, comment, customer_info
FROM ua_4778_manual_v2.customer_feedback
WHERE rating = 5
UNION ALL
SELECT customer_feedback.rating, comment, customer_info
FROM ua_4778_manual_v2.customer_feedback
WHERE rating = 1
ORDER BY 1;


--A view that selects from another view, for example, a summary view based on a detailed view.
--show the least satisfied customers feedback
--critical incidents tracking
CREATE OR REPLACE VIEW ua_4778_manual_v2.customer_feedback_unsatisfied_customers_info_view AS
SELECT customer_info
FROM ua_4778_manual_v2.rating_feedback_highest_and_lowest_view
WHERE rating = 1;

--A view with the CHECK OPTION to enforce updatable view constraints, for example, a view allowing updates only for available books.
-- Shows inventory with quantity at or above the critical level
-- Prevents updates that would reduce quantity below the critical level
CREATE OR REPLACE VIEW ua_4778_manual_v2.basic_inventory_enough_quantity_view AS
SELECT location_id, inventory_type_id, current_quantity
FROM ua_4778_manual_v2.basic_inventory
WHERE current_quantity >=
      CASE inventory_type_id
          WHEN 1 THEN 10
          WHEN 2 THEN 10
          WHEN 3 THEN 5
          WHEN 4 THEN 8
          WHEN 5 THEN 9
          WHEN 6 THEN 9
          WHEN 7 THEN 10
          WHEN 8 THEN 10
          WHEN 9 THEN 40
          WHEN 10 THEN 50
          END
WITH CHECK OPTION;
