-- ================================================================
-- SQL DDL TEMPLATE (TOPIC 04)
-- ================================================================
-- WHAT SHOULD BE ADDED HERE:
-- 1) Full PostgreSQL DDL for your finalized schema.
-- 2) CREATE TABLE statements for all entities from your ER diagram.
-- 3) Primary keys, foreign keys, NOT NULL, UNIQUE, CHECK constraints.
-- 4) Indexes for important search/join columns.
-- 5) Clean structure and comments (group by tables/constraints/indexes).
--
-- RECOMMENDED ORDER:
-- 1) Tables
-- 2) Constraints (if not inline)
-- 3) Indexes
--
-- TEAM NOTE:
-- Add short attribution comments for who implemented which part.
-- Example:
-- [Name] - users, roles, permissions tables
-- [Name] - orders, payments, invoices tables
--
-- IMPORTANT:
-- The script must run in PostgreSQL and produce a working schema that
-- matches your approved ER diagram and conceptual schema.
-- Submit this as one SQL file.
-- ================================================================

-- Add your DDL below this line

CREATE schema ua_4778_manual;

CREATE TABLE ua_4778_manual.locations
(
    "UniqueID" bigserial PRIMARY KEY,
    "address"  VARCHAR(100) NOT NULL,
    "name"     VARCHAR(100) NOT NULL
);

CREATE TABLE ua_4778_manual.staff
(
    "UniqueID"    bigserial PRIMARY KEY,
    "role"        varchar(20)  NOT NULL CHECK (role IN ('kitchen_staff', 'server', 'manager')),
    "location_id" bigint       NOT NULL,
    "full_name"   VARCHAR(100) NOT NULL
);

CREATE TABLE ua_4778_manual.basic_inventory
(
    "UniqueID"    bigserial PRIMARY KEY,
    "location_id" bigint NOT NULL
);

CREATE TABLE ua_4778_manual.menu_items
(
    "UniqueID"                 bigserial PRIMARY KEY,
    "name"                     VARCHAR(100) NOT NULL,
    "category"                 VARCHAR(20)  NOT NULL CHECK (category IN ('appetizer', 'main_course', 'dessert')),
    "price_usd"                DECIMAL(10, 2) DEFAULT 0 CHECK (price_usd >= 0),
    "preparation_time_minutes" INT            DEFAULT 0 CHECK ("preparation_time_minutes" >= 0),
    "location_id"              BIGINT       NOT NULL

);

CREATE TABLE ua_4778_manual.orders
(
    "UniqueID"    bigserial PRIMARY KEY,
    "type"        VARCHAR(15) NOT NULL CHECK ( type IN ('dine-in', 'takeaway', 'delivery')),
    "status"      VARCHAR(20) NOT NULL CHECK ("status" IN
                                              ('pending', 'confirmed', 'in_progress', 'completed', 'cancelled')),
    "location_id" BIGINT      NOT NULL
);

CREATE TABLE ua_4778_manual.reservations
(
    "UniqueID"     bigserial PRIMARY KEY,
    "date_time"    timestamp NOT NULL,
    "table_number" INT, --TBD: control max size of the location
    "location_id"  BIGINT    NOT NULL
);

CREATE TABLE ua_4778_manual.menu_items_ingredients
(
    "menu_item_id"  bigint,
    "ingredient_id" bigint,
    PRIMARY KEY ("menu_item_id", "ingredient_id"),
    "quantity"      DECIMAL(10, 3) NOT NULL,
    "unit"          varchar(10)    NOT NULL CHECK ( unit IN ('g', 'ml', 'pcs'))

);

CREATE TABLE ua_4778_manual.staff_orders
(
    "staff_id" bigint,
    "order_id" bigint,
    PRIMARY KEY ("staff_id", "order_id")
);

CREATE TABLE ua_4778_manual.menu_items_orders
(
    "menu_item_id" bigint,
    "order_id"     bigint,
    PRIMARY KEY ("menu_item_id", "order_id")
);

CREATE TABLE ua_4778_manual.shift_schedules
(
    "UniqueID"   bigserial PRIMARY KEY,
    "staff_id"   BIGINT NOT NULL,
    "shift_date" DATE   NOT NULL,
    "start_time" TIME   NOT NULL,
    "end_time"   TIME   NOT NULL
);

CREATE TABLE ua_4778_manual.ingredients
(
    "UniqueID"           bigserial PRIMARY KEY,
    "name"               VARCHAR(50) NOT NULL,
    "quantity"           BIGINT DEFAULT 0,
    "unit"               varchar(10) NOT NULL CHECK ( unit IN ('g', 'ml', 'pcs')),
    "basic_inventory_id" BIGINT      NOT NULL
);

CREATE TABLE ua_4778_manual.ingredients_suppliers
(
    "ingredient_id" BIGINT,
    "supplier_id"   BIGINT,
    PRIMARY KEY ("ingredient_id", "supplier_id")
);

CREATE TABLE ua_4778_manual.suppliers
(
    "UniqueID" bigserial PRIMARY KEY,
    "details"  VARCHAR(200)
);

CREATE TABLE ua_4778_manual.customer_feedback
(
    "UniqueID"       bigserial PRIMARY KEY,
    "rating"         INT NOT NULL CHECK ("rating" IN (1, 2, 3, 4, 5)),
    "comment"        VARCHAR(200),
    "customer_info"  VARCHAR(200),
    "order_id"       BIGINT,
    "reservation_id" BIGINT
        CHECK (
            ("order_id" IS NOT NULL AND "reservation_id" IS NULL)
                OR
            ("order_id" IS NULL AND "reservation_id" IS NOT NULL)
            )
);

ALTER TABLE ua_4778_manual.staff
    ADD FOREIGN KEY ("location_id") REFERENCES ua_4778_manual.locations ("UniqueID");

ALTER TABLE ua_4778_manual.basic_inventory
    ADD FOREIGN KEY ("location_id") REFERENCES ua_4778_manual.locations ("UniqueID");

ALTER TABLE ua_4778_manual.menu_items
    ADD FOREIGN KEY ("location_id") REFERENCES ua_4778_manual.locations ("UniqueID");

ALTER TABLE ua_4778_manual.orders
    ADD FOREIGN KEY ("location_id") REFERENCES ua_4778_manual.locations ("UniqueID");

ALTER TABLE ua_4778_manual.reservations
    ADD FOREIGN KEY ("location_id") REFERENCES ua_4778_manual.locations ("UniqueID");

ALTER TABLE ua_4778_manual.shift_schedules
    ADD FOREIGN KEY ("staff_id") REFERENCES ua_4778_manual.staff ("UniqueID"),
    ADD CONSTRAINT start_time_before_end_time CHECK (end_time > start_time);

ALTER TABLE ua_4778_manual.ingredients
    ADD FOREIGN KEY ("basic_inventory_id") REFERENCES ua_4778_manual.basic_inventory ("UniqueID");

ALTER TABLE ua_4778_manual.staff_orders
    ADD FOREIGN KEY ("staff_id") REFERENCES ua_4778_manual.staff ("UniqueID"),
    ADD FOREIGN KEY ("order_id") REFERENCES ua_4778_manual.orders ("UniqueID");

ALTER TABLE ua_4778_manual.menu_items_ingredients
    ADD FOREIGN KEY ("menu_item_id") REFERENCES ua_4778_manual.menu_items ("UniqueID"),
    ADD FOREIGN KEY ("ingredient_id") REFERENCES ua_4778_manual.ingredients ("UniqueID");

ALTER TABLE ua_4778_manual.menu_items_orders
    ADD FOREIGN KEY ("menu_item_id") REFERENCES ua_4778_manual.menu_items ("UniqueID"),
    ADD FOREIGN KEY ("order_id") REFERENCES ua_4778_manual.orders ("UniqueID"),
    ADD COLUMN "quantity" INTEGER NOT NULL DEFAULT 1,
    ADD CONSTRAINT menu_item_order_quantity_positive CHECK ("quantity" > 0);

ALTER TABLE ua_4778_manual.ingredients_suppliers
    ADD FOREIGN KEY ("ingredient_id") REFERENCES ua_4778_manual.ingredients ("UniqueID"),
    ADD FOREIGN KEY ("supplier_id") REFERENCES ua_4778_manual.suppliers ("UniqueID");

ALTER TABLE ua_4778_manual.customer_feedback
    ADD CONSTRAINT customer_feedback_order_id_unique UNIQUE ("order_id"),
    ADD CONSTRAINT customer_feedback_order_fk FOREIGN KEY ("order_id")
        REFERENCES ua_4778_manual.orders ("UniqueID");

ALTER TABLE ua_4778_manual.customer_feedback
    ADD CONSTRAINT customer_feedback_reservation_unique UNIQUE ("reservation_id"),
    ADD CONSTRAINT customer_feedback_reservation_fk FOREIGN KEY ("reservation_id")
        REFERENCES ua_4778_manual.reservations ("UniqueID");
