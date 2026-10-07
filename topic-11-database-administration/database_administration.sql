-- ================================================================
-- DATABASE ADMINISTRATION TEMPLATE (TOPIC 11)
-- ================================================================
-- WHAT SHOULD BE ADDED HERE:
-- 1) CREATE ROLE statements for at least 2 distinct roles.
--    Example roles: read-only analyst, read-write editor.
--
-- 2) GRANT statements assigning appropriate permissions to each role:
--    - Read-only role: GRANT SELECT ON ALL TABLES IN SCHEMA ...
--    - Read-write role: GRANT SELECT, INSERT, UPDATE, DELETE ...
--
-- 3) CREATE USER statements for at least 2 users.
--    Each user must be assigned to one of the defined roles.
--
-- 4) Comments before each section explaining the rationale:
--    - Why this role exists
--    - What access it should and should not have
--
-- RECOMMENDED ORDER:
-- 1) Roles + their GRANTs
-- 2) Users + GRANT ROLE TO USER
-- 3) Optional: REVOKE statements for fine-grained restrictions
-- 4) Optional cleanup block (commented out by default):
--    -- DROP USER ...; DROP ROLE ...;
--
-- IMPORTANT:
-- - Use explicit GRANT / REVOKE statements — do not rely on defaults.
-- - Roles must have meaningfully different permission levels.
-- - Script must execute in PostgreSQL without errors.
-- ================================================================

-- Add your script below this line


--What You Need to Create
--  At least 2 distinct roles with different sets of permissions.
--      Read-write role — can view, insert, update, and delete data.
CREATE ROLE editor;
CREATE ROLE views_editor;

--      Read-only role — can view data but cannot modify it.
CREATE ROLE reader;
CREATE ROLE views_reader;
CREATE ROLE aboba;

GRANT USAGE ON SCHEMA ua_4778_manual_v2 TO editor;
GRANT USAGE ON SCHEMA ua_4778_manual_v2 TO views_editor;
GRANT USAGE ON SCHEMA ua_4778_manual_v2 TO reader;
GRANT USAGE ON SCHEMA ua_4778_manual_v2 TO views_reader;
GRANT USAGE ON SCHEMA ua_4778_manual_v2 TO aboba;

GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA ua_4778_manual_v2 TO editor;

GRANT SELECT, INSERT, UPDATE, DELETE ON ua_4778_manual_v2.customer_feedback_unsatisfied_customers_info_view TO views_editor;
GRANT SELECT, INSERT, UPDATE, DELETE ON ua_4778_manual_v2.location_sumska_orders_view TO views_editor;
GRANT SELECT, INSERT, UPDATE, DELETE ON ua_4778_manual_v2.basic_inventory_enough_quantity_view TO views_editor;
GRANT SELECT, INSERT, UPDATE, DELETE ON ua_4778_manual_v2.top_rating_feedback_view TO views_editor;
GRANT SELECT, INSERT, UPDATE, DELETE ON ua_4778_manual_v2.location_sumska_menu_view TO views_editor;
GRANT SELECT, INSERT, UPDATE, DELETE ON ua_4778_manual_v2.rating_feedback_highest_and_lowest_view TO views_editor;
GRANT SELECT, INSERT, UPDATE, DELETE ON ua_4778_manual_v2.common_menu_view TO views_editor;

GRANT SELECT ON ALL TABLES IN SCHEMA ua_4778_manual_v2 TO reader;

GRANT SELECT ON ua_4778_manual_v2.customer_feedback_unsatisfied_customers_info_view TO views_reader;
GRANT SELECT ON ua_4778_manual_v2.location_sumska_orders_view TO views_reader;
GRANT SELECT ON ua_4778_manual_v2.basic_inventory_enough_quantity_view TO views_reader;
GRANT SELECT ON ua_4778_manual_v2.top_rating_feedback_view TO views_reader;
GRANT SELECT ON ua_4778_manual_v2.location_sumska_menu_view TO views_reader;
GRANT SELECT ON ua_4778_manual_v2.rating_feedback_highest_and_lowest_view TO views_reader;
GRANT SELECT ON ua_4778_manual_v2.common_menu_view TO views_reader;

GRANT SELECT (address, name) ON ua_4778_manual_v2.locations TO aboba;

--      At least 2 users, each assigned to one of the created roles.
CREATE USER user_editor with PASSWORD 'TheUserEditorPass123';
CREATE USER user_views_editor with PASSWORD 'PassPass123';
CREATE USER user_reader_first with PASSWORD 'Password123';
CREATE USER user_reader_second with PASSWORD '123pass';
CREATE USER user_views_reader_first with PASSWORD 'pass123word';
CREATE USER user_views_reader_second with PASSWORD '123123123pppp';
CREATE USER user_aboba with PASSWORD '8828282228282228';

GRANT editor TO user_editor;
GRANT views_editor TO user_views_editor;
GRANT reader TO user_reader_first;
GRANT reader TO user_reader_second;
GRANT aboba TO user_aboba;
GRANT views_reader TO user_views_reader_first;
GRANT views_reader TO user_views_reader_second;


--      Optional Cleanup Section
/*
REVOKE ALL ON ALL TABLES IN SCHEMA ua_4778_manual_v2 FROM aboba;
DROP USER IF EXISTS user_aboba;
DROP ROLE IF EXISTS aboba;
 */
