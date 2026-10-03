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

-- ===== SCHEMA CREATION =====
CREATE SCHEMA IF NOT EXISTS ua_4778_manual_v2;

-- ===== TABLES CREATION =====
CREATE TABLE ua_4778_manual_v2.locations
(
    location_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    address     VARCHAR(100) NOT NULL,
    name        VARCHAR(100) NOT NULL
);

CREATE TABLE ua_4778_manual_v2.staff
(
    staff_id    BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    role        VARCHAR(20)  NOT NULL CHECK (role IN ('kitchen_staff', 'server', 'manager')),
    location_id BIGINT       NOT NULL,
    full_name   VARCHAR(100) NOT NULL
);

CREATE TABLE ua_4778_manual_v2.basic_inventory
(
    basic_inventory_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    location_id        BIGINT NOT NULL UNIQUE,
    capacity_kg        BIGINT NOT NULL,
    description        VARCHAR(400)
);

CREATE TABLE ua_4778_manual_v2.menu_items
(
    menu_item_id             BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name                     VARCHAR(100)   NOT NULL,
    category                 VARCHAR(20)    NOT NULL CHECK (category IN ('appetizer', 'main_course', 'dessert')),
    price_usd                DECIMAL(10, 2) NOT NULL CHECK (price_usd > 0),
    preparation_time_minutes INTEGER DEFAULT 0 CHECK (preparation_time_minutes >= 0)
);

CREATE TABLE ua_4778_manual_v2.locations_menu_items
(
    location_id  BIGINT NOT NULL,
    menu_item_id BIGINT NOT NULL,
    PRIMARY KEY (location_id, menu_item_id)
);

CREATE TABLE ua_4778_manual_v2.orders
(
    order_id    BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    type        VARCHAR(15) NOT NULL CHECK (type IN ('dine_in', 'takeaway', 'delivery')),
    status      VARCHAR(20) NOT NULL CHECK (status IN
                                            ('pending', 'confirmed', 'in_progress', 'completed', 'cancelled')),
    location_id BIGINT      NOT NULL,
    created_at  TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE ua_4778_manual_v2.reservations
(
    reservation_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    date_time      TIMESTAMPTZ NOT NULL,
    table_number   INTEGER     NOT NULL CHECK (table_number > 0), --TBD: control max size of the location
    location_id    BIGINT      NOT NULL,
    CONSTRAINT unique_location_id_table_number_date_time UNIQUE (location_id, table_number, date_time)
);

CREATE TABLE ua_4778_manual_v2.menu_items_ingredients
(
    menu_item_id  BIGINT,
    ingredient_id BIGINT,
    quantity      DECIMAL(10, 3) NOT NULL CHECK (quantity > 0),
    PRIMARY KEY (menu_item_id, ingredient_id)
);

CREATE TABLE ua_4778_manual_v2.staff_orders
(
    staff_id BIGINT,
    order_id BIGINT,
    PRIMARY KEY (staff_id, order_id)
);

CREATE TABLE ua_4778_manual_v2.menu_items_orders
(
    menu_item_id BIGINT,
    order_id     BIGINT,
    quantity     INTEGER NOT NULL DEFAULT 1,
    PRIMARY KEY (menu_item_id, order_id)
);

CREATE TABLE ua_4778_manual_v2.shift_schedules
(
    shift_schedule_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    staff_id          BIGINT      NOT NULL,
    start_time        TIMESTAMPTZ NOT NULL,
    end_time          TIMESTAMPTZ NOT NULL
);

CREATE TABLE ua_4778_manual_v2.ingredients
(
    ingredient_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name          VARCHAR(50) NOT NULL,
    unit          VARCHAR(10) NOT NULL CHECK (unit IN ('g', 'ml', 'pcs'))
);

CREATE TABLE ua_4778_manual_v2.basic_inventory_ingredients
(
    basic_inventory_id BIGINT,
    ingredient_id      BIGINT,
    quantity           DECIMAL(10, 3) NOT NULL CHECK (quantity >= 0),
    PRIMARY KEY (basic_inventory_id, ingredient_id)
);

CREATE TABLE ua_4778_manual_v2.ingredients_suppliers
(
    ingredient_id BIGINT,
    supplier_id   BIGINT,
    PRIMARY KEY (ingredient_id, supplier_id)
);

CREATE TABLE ua_4778_manual_v2.suppliers
(
    supplier_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title       VARCHAR(100) NOT NULL,
    website     VARCHAR(255),
    address     VARCHAR(255),
    city        VARCHAR(100),
    country     VARCHAR(100),
    tax_id      VARCHAR(50),
    details     VARCHAR(200)
);

CREATE TABLE ua_4778_manual_v2.supplier_contacts
(
    supplier_contact_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    supplier_id         BIGINT       NOT NULL,
    is_primary          BOOLEAN      NOT NULL DEFAULT FALSE,
    first_name          VARCHAR(100) NOT NULL,
    last_name           VARCHAR(100),
    job_title           VARCHAR(100),
    email               VARCHAR(255),
    phone               VARCHAR(30)
);

CREATE TABLE ua_4778_manual_v2.customer_feedback
(
    customer_feedback_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    rating               SMALLINT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    comment              VARCHAR(200),
    customer_info        VARCHAR(200),
    order_id             BIGINT,
    reservation_id       BIGINT
);

-- ===== ALTERING TABLES =====
ALTER TABLE ua_4778_manual_v2.staff
    ADD CONSTRAINT staff_location_id_fk FOREIGN KEY (location_id) REFERENCES ua_4778_manual_v2.locations (location_id) ON DELETE CASCADE;

ALTER TABLE ua_4778_manual_v2.basic_inventory
    ADD CONSTRAINT basic_inventory_location_id_fk FOREIGN KEY (location_id) REFERENCES ua_4778_manual_v2.locations (location_id) ON DELETE CASCADE;

ALTER TABLE ua_4778_manual_v2.locations_menu_items
    ADD CONSTRAINT locations_menu_items_location_id_fk FOREIGN KEY (location_id) REFERENCES ua_4778_manual_v2.locations (location_id) ON DELETE CASCADE,
    ADD CONSTRAINT locations_menu_items_menu_item_id_fk FOREIGN KEY (menu_item_id) REFERENCES ua_4778_manual_v2.menu_items (menu_item_id) ON DELETE CASCADE;

ALTER TABLE ua_4778_manual_v2.orders
    ADD CONSTRAINT orders_location_id_fk FOREIGN KEY (location_id) REFERENCES ua_4778_manual_v2.locations (location_id) ON DELETE CASCADE;

ALTER TABLE ua_4778_manual_v2.reservations
    ADD CONSTRAINT reservations_location_id_fk FOREIGN KEY (location_id) REFERENCES ua_4778_manual_v2.locations (location_id) ON DELETE CASCADE;

ALTER TABLE ua_4778_manual_v2.shift_schedules
    ADD CONSTRAINT shift_schedules_staff_id_fk FOREIGN KEY (staff_id) REFERENCES ua_4778_manual_v2.staff (staff_id) ON DELETE CASCADE,
    ADD CONSTRAINT shift_schedule_start_time_before_end_time CHECK (end_time > start_time);

ALTER TABLE ua_4778_manual_v2.staff_orders
    ADD CONSTRAINT staff_orders_staff_id_fk FOREIGN KEY (staff_id) REFERENCES ua_4778_manual_v2.staff (staff_id) ON DELETE CASCADE,
    ADD CONSTRAINT staff_orders_order_id_fk FOREIGN KEY (order_id) REFERENCES ua_4778_manual_v2.orders (order_id) ON DELETE CASCADE;

ALTER TABLE ua_4778_manual_v2.menu_items_ingredients
    ADD CONSTRAINT menu_items_ingredients_menu_item_id_fk FOREIGN KEY (menu_item_id) REFERENCES ua_4778_manual_v2.menu_items (menu_item_id) ON DELETE CASCADE,
    ADD CONSTRAINT menu_items_ingredients_ingredient_id_fk FOREIGN KEY (ingredient_id) REFERENCES ua_4778_manual_v2.ingredients (ingredient_id) ON DELETE CASCADE;

ALTER TABLE ua_4778_manual_v2.menu_items_orders
    ADD CONSTRAINT menu_items_orders_menu_item_id_fk FOREIGN KEY (menu_item_id) REFERENCES ua_4778_manual_v2.menu_items (menu_item_id) ON DELETE CASCADE,
    ADD CONSTRAINT menu_items_orders_order_id_fk FOREIGN KEY (order_id) REFERENCES ua_4778_manual_v2.orders (order_id) ON DELETE CASCADE,
    ADD CONSTRAINT menu_item_order_quantity_positive CHECK (quantity > 0);

ALTER TABLE ua_4778_manual_v2.ingredients_suppliers
    ADD CONSTRAINT ingredients_suppliers_ingredient_id_fk FOREIGN KEY (ingredient_id) REFERENCES ua_4778_manual_v2.ingredients (ingredient_id) ON DELETE CASCADE,
    ADD CONSTRAINT ingredients_suppliers_supplier_id_fk FOREIGN KEY (supplier_id) REFERENCES ua_4778_manual_v2.suppliers (supplier_id) ON DELETE CASCADE;

ALTER TABLE ua_4778_manual_v2.customer_feedback
    ADD CONSTRAINT customer_feedback_order_id_unique UNIQUE (order_id),
    ADD CONSTRAINT customer_feedback_order_fk FOREIGN KEY (order_id) REFERENCES ua_4778_manual_v2.orders (order_id),
    ADD CONSTRAINT customer_feedback_reservation_unique UNIQUE (reservation_id),
    ADD CONSTRAINT customer_feedback_reservation_fk FOREIGN KEY (reservation_id) REFERENCES ua_4778_manual_v2.reservations (reservation_id),
    ADD CONSTRAINT customer_feedback_order_xor_reservation_chk CHECK (
        (order_id IS NOT NULL AND reservation_id IS NULL) OR
        (order_id IS NULL AND reservation_id IS NOT NULL)
        );

ALTER TABLE ua_4778_manual_v2.supplier_contacts
    ADD CONSTRAINT supplier_contacts_supplier_id_fk FOREIGN KEY (supplier_id) REFERENCES ua_4778_manual_v2.suppliers (supplier_id) ON DELETE CASCADE;

ALTER TABLE ua_4778_manual_v2.basic_inventory_ingredients
    ADD CONSTRAINT basic_inventory_ingredients_basic_inventory_id_fk FOREIGN KEY (basic_inventory_id) REFERENCES ua_4778_manual_v2.basic_inventory (basic_inventory_id) ON DELETE CASCADE,
    ADD CONSTRAINT basic_inventory_ingredients_ingredient_id_fk FOREIGN KEY (ingredient_id) REFERENCES ua_4778_manual_v2.ingredients (ingredient_id) ON DELETE CASCADE;

-- ===== INDEXES =====
CREATE INDEX idx_staff_location_id ON ua_4778_manual_v2.staff (location_id);
CREATE INDEX idx_orders_location_id ON ua_4778_manual_v2.orders (location_id);
CREATE INDEX idx_reservations_location_id ON ua_4778_manual_v2.reservations (location_id);
CREATE INDEX idx_locations_menu_items_menu_item_id ON ua_4778_manual_v2.locations_menu_items (menu_item_id);
CREATE INDEX idx_menu_basic_inventory_location_id ON ua_4778_manual_v2.basic_inventory (location_id);

CREATE INDEX idx_shift_schedules_staff_id ON ua_4778_manual_v2.shift_schedules (staff_id);
CREATE INDEX idx_customer_feedback_order_id ON ua_4778_manual_v2.customer_feedback (order_id);
CREATE INDEX idx_customer_feedback_reservation_id ON ua_4778_manual_v2.customer_feedback (reservation_id);

CREATE INDEX idx_staff_orders_order_id ON ua_4778_manual_v2.staff_orders (order_id);
CREATE INDEX idx_menu_items_orders_order_id ON ua_4778_manual_v2.menu_items_orders (order_id);
CREATE INDEX idx_menu_items_ingredient_id ON ua_4778_manual_v2.menu_items_ingredients (ingredient_id);
CREATE INDEX idx_ingredients_suppliers_supplier_id ON ua_4778_manual_v2.ingredients_suppliers (supplier_id);
CREATE INDEX idx_basic_inventory_ingredients_ingredient_id ON ua_4778_manual_v2.basic_inventory_ingredients (ingredient_id);

CREATE INDEX idx_reservations_loc_time ON ua_4778_manual_v2.reservations (location_id, date_time);

CREATE INDEX idx_supplier_contacts_supplier_id ON ua_4778_manual_v2.supplier_contacts (supplier_id);

CREATE INDEX idx_supplier_contacts_supplier_id ON ua_4778_manual_v2.supplier_contacts (supplier_id);
