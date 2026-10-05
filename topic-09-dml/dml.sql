-- ================================================================
-- SQL DML TEMPLATE (TOPIC 09)
-- ================================================================
-- WHAT SHOULD BE ADDED HERE:
-- 1) INSERT scripts for all required tables in your database.
-- 2) At least 10 records per table with meaningful, realistic values.
-- 3) UPDATE / DELETE scripts where they are relevant to business logic.
-- 4) If UPDATE / DELETE are not relevant for a table, add a short note
--    in documentation explaining why.
-- 5) Comments by section so the script is easy to read and run.
--
-- SCRIPT GOALS:
-- - Populate the database with usable test data.
-- - Validate constraints through realistic DML scenarios.
-- - Support the core functionality of your application.
--
-- RECOMMENDED ORDER:
-- 1) Reference data (lookups/dictionaries)
-- 2) Core entities
-- 3) Transactional data
-- 4) Optional UPDATE / DELETE checks
--
-- IMPORTANT:
-- - Use anonymized or privacy-safe sample data where possible.
-- - The script must execute in PostgreSQL.
-- - Submit this as one SQL file.
-- ================================================================

-- Add your DML below this line


INSERT INTO ua_4778_manual_v2.units_of_measure
    (name, symbol)
VALUES
-- Positive scenarios
('kilogram', 'kg'),
('gram', 'g'),
('liter', 'l'),
('milliliter', 'ml'),
('piece', 'pcs')
-- Negative scenarios to test the constraints
;

INSERT INTO ua_4778_manual_v2.inventory_types
    (name, unit)
VALUES
    -- Positive scenarios
    ('dry_ingredients', 'kg'),
    ('meat_poultry', 'kg'),
    ('fish_seafood', 'kg'),
    ('vegetables', 'kg'),
    ('fruits', 'kg'),
    ('dairy', 'l'),
    ('frozen_products', 'kg'),
    ('beverages', 'l'),
    ('sauces_condiments', 'pcs'),
    ('packaging', 'pcs')
-- Negative scenarios to test the constraints
--('packaging','test')
;


INSERT INTO ua_4778_manual_v2.locations
    (name, address)
VALUES
-- Positive scenarios
('Marinello Saltovka Dafi', 'Heroes of Labor St, 9, Kharkiv'),
('Marinello Saltovka North', 'Traktorobudivnykiv Ave, 89, Kharkiv'),
('Marinello Saltovka 521', 'Akademika Pavlova St, 120, Kharkiv'),
('Marinello Saltovka 606', 'Akademika Pavlova St, 44Б, Kharkiv'),
('Marinello Saltovka 607', 'Heroes of Labor St, 24, Kharkiv'),
('Marinello Tarasivska', 'Tarasivska St, 1, Kharkiv'),
('Marinello 23 Aug', '23-ho Serpnia St, 31, Kharkiv'),
('Marinello Sumska', 'Sumska St, 71, Kharkiv'),
('Marinello Central Park', 'Myronosytska St, 99, Kharkiv'),
('Marinello Gogolia', 'Hoholivska St, 2, Kharkiv')
-- Negative scenarios to test the constraints
--(NULL, NULL),
--('', NULL)
;

INSERT INTO ua_4778_manual_v2.staff
    (role, location_id, full_name)
-- Positive scenarios
VALUES
-- Location 1
('kitchen_staff', 1, 'Andrii Kovalenko'),
('kitchen_staff', 1, 'Oleh Shevchuk'),
('kitchen_staff', 1, 'Mykola Savchuk'),
('kitchen_staff', 1, 'Taras Hrytsenko'),
('kitchen_staff', 1, 'Dmytro Melnyk'),
('server', 1, 'Boris Blade'),
('server', 1, 'Valera Borov'),
('server', 1, 'Maksym Bondarenko'),
('manager', 1, 'Iryna Tkachenko'),
('manager', 1, 'Iryna Myroshnychenko'),
-- Location 2
('kitchen_staff', 2, 'Serhii Lysenko'),
('kitchen_staff', 2, 'Roman Koval'),
('kitchen_staff', 2, 'Vladyslav Moroz'),
('kitchen_staff', 2, 'Ihor Marchuk'),
('kitchen_staff', 2, 'Pavlo Danylchuk'),
('server', 2, 'Artem Boyko'),
('server', 2, 'Yaroslav Oliynyk'),
('server', 2, 'Denys Shevchuk'),
('manager', 2, 'Olena Marchenko'),
('manager', 2, 'Oleksa Aprilchenko'),
-- Location 3
('kitchen_staff', 3, 'Volodymyr Kravchenko'),
('kitchen_staff', 3, 'Bohdan Romaniuk'),
('kitchen_staff', 3, 'Oleksii Kostenko'),
('kitchen_staff', 3, 'Nazar Tkach'),
('kitchen_staff', 3, 'Andrii Klymenko'),
('server', 3, 'Roman Bondar'),
('server', 3, 'Maksym Honchar'),
('server', 3, 'Danylo Kovtun'),
('manager', 3, 'Kateryna Polishchuk'),
('manager', 3, 'Taras Borsch'),
-- Location 4
('kitchen_staff', 4, 'Yurii Melnyk'),
('kitchen_staff', 4, 'Petro Kravets'),
('kitchen_staff', 4, 'Viktor Oliynyk'),
('kitchen_staff', 4, 'Oleksandr Tkachenko'),
('kitchen_staff', 4, 'Denys Rudenko'),
('server', 4, 'Svitlana Bondar'),
('server', 4, 'Anna Moroz'),
('server', 4, 'Viktoriia Marchenko'),
('manager', 4, 'Serhii Koval'),
('manager', 4, 'Volodymyr Nevmutui'),
-- Location 5
('kitchen_staff', 5, 'Maksym Shevchenko'),
('kitchen_staff', 5, 'Ihor Kovalenko'),
('kitchen_staff', 5, 'Bohdan Lysenko'),
('kitchen_staff', 5, 'Taras Bondarenko'),
('kitchen_staff', 5, 'Dmytro Savchuk'),
('server', 5, 'Natalia Bondar'),
('server', 5, 'Yuliia Petrenko'),
('server', 5, 'Anastasiia Kovtun'),
('manager', 5, 'Vladyslav Moroz'),
('manager', 5, 'Anatolii Zhma'),
-- Location 6
('kitchen_staff', 6, 'Volodymyr Shevchuk'),
('kitchen_staff', 6, 'Andrii Marchuk'),
('kitchen_staff', 6, 'Mykola Hrytsenko'),
('kitchen_staff', 6, 'Oleh Danylchuk'),
('kitchen_staff', 6, 'Roman Melnyk'),
('server', 6, 'Maria Honchar'),
('server', 6, 'Tetiana Sydorenko'),
('server', 6, 'Olha Kravchenko'),
('manager', 6, 'Pavlo Kostenko'),
('manager', 6, 'Petro Choco'),
-- Location 7
('kitchen_staff', 7, 'Danylo Lysenko'),
('kitchen_staff', 7, 'Serhii Bondarenko'),
('kitchen_staff', 7, 'Artem Kovalenko'),
('kitchen_staff', 7, 'Nazar Hrytsenko'),
('kitchen_staff', 7, 'Yaroslav Melnyk'),
('server', 7, 'Iryna Shevchuk'),
('server', 7, 'Viktoriia Moroz'),
('server', 7, 'Svitlana Koval'),
('manager', 7, 'Oleksii Marchenko'),
('manager', 7, 'Volodymyr Stoner'),
-- Location 8
('kitchen_staff', 8, 'Petro Savchuk'),
('kitchen_staff', 8, 'Ihor Bondar'),
('kitchen_staff', 8, 'Maksym Kravets'),
('kitchen_staff', 8, 'Volodymyr Tkachenko'),
('kitchen_staff', 8, 'Taras Koval'),
('server', 8, 'Kateryna Lysenko'),
('server', 8, 'Olena Bondarenko'),
('server', 8, 'Yuliia Hrytsenko'),
('manager', 8, 'Bohdan Shevchenko'),
('manager', 8, 'Borys Saksaganskii'),
-- Location 9
('kitchen_staff', 9, 'Andrii Rudenko'),
('kitchen_staff', 9, 'Oleh Kostenko'),
('kitchen_staff', 9, 'Mykola Marchuk'),
('kitchen_staff', 9, 'Roman Danylchuk'),
('kitchen_staff', 9, 'Dmytro Koval'),
('server', 9, 'Anastasiia Melnyk'),
('server', 9, 'Natalia Shevchuk'),
('server', 9, 'Maria Kovtun'),
('manager', 9, 'Serhii Bondar'),
('manager', 9, 'Muhamad Abdulaizi'),
-- Location 10
('kitchen_staff', 10, 'Viktor Hrytsenko'),
('kitchen_staff', 10, 'Denys Kovalenko'),
('kitchen_staff', 10, 'Pavlo Shevchuk'),
('kitchen_staff', 10, 'Yurii Melnyk'),
('kitchen_staff', 10, 'Bohdan Kravchenko'),
('server', 10, 'Tetiana Bondar'),
('server', 10, 'Olha Marchenko'),
('server', 10, 'Iryna Kovtun'),
('manager', 10, 'Oleksandr Lysenko'),
('manager', 10, 'Oleksii Lysenko')

-- Negative scenarios to test the constraints
--('role_not_in_the_list', 1, 'test1'),
--('manager', 1, NULL)
;

INSERT INTO ua_4778_manual_v2.reservations
    (date_time, table_number, location_id)
-- Positive scenarios
VALUES
-- Location 1
('2026-10-03 12:00:00', 1, 1),
('2026-10-03 18:30:00', 4, 1),
('2026-10-05 19:00:00', 7, 1),
('2026-10-08 20:00:00', 2, 1),
('2026-10-10 13:00:00', 5, 1),
('2026-10-12 18:30:00', 8, 1),
('2026-10-15 19:30:00', 3, 1),
('2026-10-18 20:00:00', 10, 1),
('2026-10-21 12:30:00', 6, 1),
('2026-10-24 19:00:00', 9, 1),
-- Location 2
('2026-10-03 13:00:00', 3, 2),
('2026-10-04 18:00:00', 6, 2),
('2026-10-06 19:30:00', 9, 2),
('2026-10-10 20:00:00', 1, 2),
('2026-10-11 12:30:00', 4, 2),
('2026-10-14 18:30:00', 7, 2),
('2026-10-17 19:00:00', 2, 2),
('2026-10-20 20:30:00', 8, 2),
('2026-10-23 13:30:00', 5, 2),
('2026-10-27 19:30:00', 10, 2),
-- Location 3
('2026-10-03 12:30:00', 2, 3),
('2026-10-05 18:30:00', 5, 3),
('2026-10-07 19:00:00', 8, 3),
('2026-10-11 20:30:00', 4, 3),
('2026-10-12 13:00:00', 1, 3),
('2026-10-15 18:00:00', 6, 3),
('2026-10-18 19:30:00', 9, 3),
('2026-10-21 20:00:00', 3, 3),
('2026-10-25 12:30:00', 7, 3),
('2026-10-29 19:00:00', 10, 3),
-- Location 4
('2026-10-04 12:00:00', 1, 4),
('2026-10-04 19:00:00', 3, 4),
('2026-10-07 18:30:00', 7, 4),
('2026-10-12 20:00:00', 10, 4),
('2026-10-13 13:30:00', 4, 4),
('2026-10-16 18:00:00', 8, 4),
('2026-10-19 19:30:00', 2, 4),
('2026-10-22 20:30:00', 6, 4),
('2026-10-26 12:00:00', 9, 4),
('2026-10-30 19:00:00', 5, 4),
-- Location 5
('2026-10-03 13:30:00', 2, 5),
('2026-10-06 18:00:00', 5, 5),
('2026-10-08 19:30:00', 8, 5),
('2026-10-13 20:00:00', 4, 5),
('2026-10-15 12:30:00', 7, 5),
('2026-10-18 18:30:00', 1, 5),
('2026-10-21 19:00:00', 10, 5),
('2026-10-24 20:30:00', 3, 5),
('2026-10-27 13:00:00', 6, 5),
('2026-10-31 19:30:00', 9, 5),
-- Location 6
('2026-10-04 12:30:00', 1, 6),
('2026-10-05 18:30:00', 6, 6),
('2026-10-09 19:00:00', 9, 6),
('2026-10-14 20:30:00', 3, 6),
('2026-10-16 13:00:00', 5, 6),
('2026-10-19 18:00:00', 8, 6),
('2026-10-22 19:30:00', 2, 6),
('2026-10-25 20:00:00', 10, 6),
('2026-10-28 12:30:00', 4, 6),
('2026-10-31 19:00:00', 7, 6),
-- Location 7
('2026-10-03 12:00:00', 4, 7),
('2026-10-06 19:00:00', 7, 7),
('2026-10-10 18:30:00', 2, 7),
('2026-10-15 20:00:00', 11, 7),
('2026-10-17 13:30:00', 5, 7),
('2026-10-20 18:00:00', 9, 7),
('2026-10-23 19:30:00', 1, 7),
('2026-10-26 20:30:00', 6, 7),
('2026-10-28 12:30:00', 8, 7),
('2026-10-31 19:00:00', 3, 7),
-- Location 8
('2026-10-04 13:00:00', 3, 8),
('2026-10-07 18:00:00', 5, 8),
('2026-10-11 19:30:00', 8, 8),
('2026-10-16 20:00:00', 1, 8),
('2026-10-18 12:30:00', 6, 8),
('2026-10-21 18:30:00', 10, 8),
('2026-10-24 19:00:00', 4, 8),
('2026-10-27 20:30:00', 7, 8),
('2026-10-29 13:00:00', 2, 8),
('2026-10-31 19:30:00', 9, 8),
-- Location 9
('2026-10-03 12:30:00', 2, 9),
('2026-10-05 19:00:00', 6, 9),
('2026-10-09 18:30:00', 10, 9),
('2026-10-17 20:30:00', 4, 9),
('2026-10-19 13:00:00', 1, 9),
('2026-10-22 18:00:00', 7, 9),
('2026-10-25 19:30:00', 3, 9),
('2026-10-28 20:00:00', 8, 9),
('2026-10-30 12:30:00', 5, 9),
('2026-10-31 19:00:00', 9, 9),
-- Location 10
('2026-10-04 12:00:00', 1, 10),
('2026-10-06 18:30:00', 5, 10),
('2026-10-10 19:00:00', 9, 10),
('2026-10-18 20:00:00', 3, 10),
('2026-10-20 13:30:00', 7, 10),
('2026-10-23 18:00:00', 2, 10),
('2026-10-25 19:30:00', 6, 10),
('2026-10-28 20:30:00', 10, 10),
('2026-10-30 12:30:00', 4, 10),
('2026-10-31 19:00:00', 8, 10);

-- randomize timestamp
UPDATE ua_4778_manual_v2.reservations
SET date_time = TIMESTAMPTZ '2026-01-01 12:00:00 Europe/Kyiv'
    + ((reservation_id * 137) % 365) * INTERVAL '1 day'
    + ((reservation_id * 47) % 10) * INTERVAL '1 hour'
    + ((reservation_id * 13) % 2) * INTERVAL '30 minutes'
WHERE EXTRACT(YEAR FROM date_time) = 2026

-- Negative scenarios to test the constraints
;

INSERT INTO ua_4778_manual_v2.orders
    (type, status, location_id, created_at)
VALUES
-- Positive scenarios
('dine_in', 'completed', 1, '2026-01-03 09:15:00 +00:00'),
('takeaway', 'completed', 2, '2026-01-06 10:30:00 +00:00'),
('delivery', 'confirmed', 3, '2026-01-09 11:45:00 +00:00'),
('dine_in', 'completed', 4, '2026-01-12 13:00:00 +00:00'),
('takeaway', 'cancelled', 5, '2026-01-15 14:15:00 +00:00'),
('delivery', 'completed', 6, '2026-01-18 15:30:00 +00:00'),
('dine_in', 'cancelled', 7, '2026-01-21 16:45:00 +00:00'),
('takeaway', 'confirmed', 8, '2026-01-24 17:00:00 +00:00'),
('delivery', 'completed', 9, '2026-01-27 18:15:00 +00:00'),
('dine_in', 'completed', 10, '2026-01-30 19:30:00 +00:00'),
('takeaway', 'completed', 1, '2026-02-02 09:30:00 +00:00'),
('delivery', 'completed', 2, '2026-02-05 10:45:00 +00:00'),
('dine_in', 'confirmed', 3, '2026-02-08 12:00:00 +00:00'),
('dine_in', 'completed', 4, '2026-02-11 13:15:00 +00:00'),
('takeaway', 'completed', 5, '2026-02-14 14:30:00 +00:00'),
('delivery', 'completed', 6, '2026-02-17 15:45:00 +00:00'),
('dine_in', 'completed', 7, '2026-02-20 16:00:00 +00:00'),
('delivery', 'cancelled', 8, '2026-02-23 17:15:00 +00:00'),
('takeaway', 'confirmed', 9, '2026-02-26 18:30:00 +00:00'),
('dine_in', 'completed', 10, '2026-02-28 19:45:00 +00:00'),
('delivery', 'completed', 1, '2026-03-02 09:45:00 +00:00'),
('dine_in', 'confirmed', 2, '2026-03-05 11:00:00 +00:00'),
('takeaway', 'completed', 3, '2026-03-08 12:15:00 +00:00'),
('dine_in', 'completed', 4, '2026-03-11 13:30:00 +00:00'),
('delivery', 'completed', 5, '2026-03-14 14:45:00 +00:00'),
('takeaway', 'completed', 6, '2026-03-17 15:00:00 +00:00'),
('dine_in', 'cancelled', 7, '2026-03-20 16:15:00 +00:00'),
('delivery', 'confirmed', 8, '2026-03-23 17:30:00 +00:00'),
('takeaway', 'completed', 9, '2026-03-26 18:45:00 +00:00'),
('dine_in', 'completed', 10, '2026-03-29 20:00:00 +00:00'),
('dine_in', 'completed', 1, '2026-04-01 09:15:00 +00:00'),
('delivery', 'completed', 2, '2026-04-04 10:30:00 +00:00'),
('takeaway', 'confirmed', 3, '2026-04-07 11:45:00 +00:00'),
('dine_in', 'completed', 4, '2026-04-10 13:00:00 +00:00'),
('delivery', 'completed', 5, '2026-04-13 14:15:00 +00:00'),
('takeaway', 'completed', 6, '2026-04-16 15:30:00 +00:00'),
('dine_in', 'cancelled', 7, '2026-04-19 16:45:00 +00:00'),
('delivery', 'cancelled', 8, '2026-04-22 17:00:00 +00:00'),
('takeaway', 'confirmed', 9, '2026-04-25 18:15:00 +00:00'),
('dine_in', 'completed', 10, '2026-04-28 19:30:00 +00:00'),
('delivery', 'completed', 1, '2026-05-01 09:30:00 +00:00'),
('takeaway', 'completed', 2, '2026-05-04 10:45:00 +00:00'),
('dine_in', 'confirmed', 3, '2026-05-07 12:00:00 +00:00'),
('dine_in', 'completed', 4, '2026-05-10 13:15:00 +00:00'),
('delivery', 'completed', 5, '2026-05-13 14:30:00 +00:00'),
('takeaway', 'completed', 6, '2026-05-16 15:45:00 +00:00'),
('dine_in', 'cancelled', 7, '2026-05-19 16:00:00 +00:00'),
('delivery', 'confirmed', 8, '2026-05-22 17:15:00 +00:00'),
('takeaway', 'completed', 9, '2026-05-25 18:30:00 +00:00'),
('dine_in', 'completed', 10, '2026-05-28 19:45:00 +00:00'),
('dine_in', 'completed', 1, '2026-06-01 09:45:00 +00:00'),
('delivery', 'completed', 2, '2026-06-04 11:00:00 +00:00'),
('takeaway', 'confirmed', 3, '2026-06-07 12:15:00 +00:00'),
('dine_in', 'completed', 4, '2026-06-10 13:30:00 +00:00'),
('delivery', 'completed', 5, '2026-06-13 14:45:00 +00:00'),
('takeaway', 'completed', 6, '2026-06-16 15:00:00 +00:00'),
('dine_in', 'cancelled', 7, '2026-06-19 16:15:00 +00:00'),
('delivery', 'cancelled', 8, '2026-06-22 17:30:00 +00:00'),
('takeaway', 'confirmed', 9, '2026-06-25 18:45:00 +00:00'),
('dine_in', 'completed', 10, '2026-06-28 20:00:00 +00:00'),
('delivery', 'completed', 1, '2026-07-01 09:15:00 +00:00'),
('takeaway', 'completed', 2, '2026-07-04 10:30:00 +00:00'),
('dine_in', 'confirmed', 3, '2026-07-07 11:45:00 +00:00'),
('dine_in', 'completed', 4, '2026-07-10 13:00:00 +00:00'),
('delivery', 'completed', 5, '2026-07-13 14:15:00 +00:00'),
('takeaway', 'completed', 6, '2026-07-16 15:30:00 +00:00'),
('dine_in', 'cancelled', 7, '2026-07-19 16:45:00 +00:00'),
('delivery', 'confirmed', 8, '2026-07-22 17:00:00 +00:00'),
('takeaway', 'completed', 9, '2026-07-25 18:15:00 +00:00'),
('dine_in', 'completed', 10, '2026-07-28 19:30:00 +00:00'),
('dine_in', 'completed', 1, '2026-08-01 09:30:00 +00:00'),
('delivery', 'cancelled', 2, '2026-08-04 10:45:00 +00:00'),
('takeaway', 'confirmed', 3, '2026-08-07 12:00:00 +00:00'),
('dine_in', 'completed', 4, '2026-08-10 13:15:00 +00:00'),
('delivery', 'completed', 5, '2026-08-13 14:30:00 +00:00'),
('takeaway', 'completed', 6, '2026-08-16 15:45:00 +00:00'),
('dine_in', 'cancelled', 7, '2026-08-19 16:00:00 +00:00'),
('delivery', 'cancelled', 8, '2026-08-22 17:15:00 +00:00'),
('takeaway', 'confirmed', 9, '2026-08-25 18:30:00 +00:00'),
('dine_in', 'completed', 10, '2026-08-28 19:45:00 +00:00'),
('delivery', 'completed', 1, '2026-09-01 09:45:00 +00:00'),
('takeaway', 'completed', 2, '2026-09-04 11:00:00 +00:00'),
('dine_in', 'confirmed', 3, '2026-09-07 12:15:00 +00:00'),
('dine_in', 'completed', 4, '2026-09-10 13:30:00 +00:00'),
('delivery', 'completed', 5, '2026-09-13 14:45:00 +00:00'),
('takeaway', 'completed', 6, '2026-09-16 15:00:00 +00:00'),
('dine_in', 'cancelled', 7, '2026-09-19 16:15:00 +00:00'),
('delivery', 'confirmed', 8, '2026-09-22 17:30:00 +00:00'),
('takeaway', 'completed', 9, '2026-09-25 18:45:00 +00:00'),
('dine_in', 'completed', 10, '2026-09-28 20:00:00 +00:00'),
('delivery', 'completed', 1, '2026-10-01 09:15:00 +00:00'),
('takeaway', 'completed', 2, '2026-10-01 12:30:00 +00:00'),
('dine_in', 'confirmed', 3, '2026-10-02 10:00:00 +00:00'),
('dine_in', 'completed', 4, '2026-10-02 13:15:00 +00:00'),
('delivery', 'cancelled', 5, '2026-10-02 16:30:00 +00:00'),
('takeaway', 'pending', 6, '2026-10-02 18:45:00 +00:00'),
('delivery', 'in_progress', 7, '2026-10-03 09:15:00 +00:00'),
('takeaway', 'in_progress', 8, '2026-10-03 10:30:00 +00:00'),
('dine_in', 'in_progress', 9, '2026-10-03 12:00:00 +00:00'),
('delivery', 'in_progress', 10, '2026-10-03 13:30:00 +00:00')
-- Negative scenarios to test the constraints
;

INSERT INTO ua_4778_manual_v2.menu_items
    (name, category, price_usd, preparation_time_minutes)
VALUES
-- Positive scenarios
('Garlic Bread', 'appetizer', 4.50, 10),
('Caesar Salad', 'appetizer', 6.50, 12),
('Bruschetta', 'appetizer', 5.00, 10),
('Chicken Wings', 'appetizer', 8.50, 20),
('Mozzarella Sticks', 'appetizer', 7.00, 15),
('Greek Salad', 'appetizer', 6.00, 10),
('Nachos Supreme', 'appetizer', 8.00, 15),
('Calamari', 'appetizer', 9.50, 20),
('Tomato Soup', 'appetizer', 5.50, 15),
('Stuffed Mushrooms', 'appetizer', 7.50, 18),
('Pizza Diablo', 'main_course', 10.00, 25),
('Margherita Pizza', 'main_course', 9.00, 20),
('Pepperoni Pizza', 'main_course', 11.00, 25),
('Chicken Alfredo', 'main_course', 12.50, 25),
('Beef Burger', 'main_course', 11.50, 20),
('Chicken Burger', 'main_course', 10.50, 18),
('Grilled Salmon', 'main_course', 16.00, 30),
('Beef Steak', 'main_course', 22.00, 35),
('Chicken Teriyaki', 'main_course', 13.00, 25),
('Vegetable Pasta', 'main_course', 10.00, 20),
('Tiramisu', 'dessert', 6.50, 10),
('Cheesecake', 'dessert', 6.00, 10),
('Chocolate Brownie', 'dessert', 5.50, 12),
('Apple Pie', 'dessert', 5.00, 15),
('Panna Cotta', 'dessert', 6.00, 10),
('Ice Cream Sundae', 'dessert', 4.50, 5),
('Chocolate Mousse', 'dessert', 5.50, 10),
('Creme Brulee', 'dessert', 6.50, 12),
('Fruit Tart', 'dessert', 5.50, 15),
('Banana Split', 'dessert', 5.00, 8)

-- Negative scenarios to test the constraints
;

INSERT INTO ua_4778_manual_v2.basic_inventory
    (location_id, inventory_type_id, current_quantity, max_capacity)
-- Positive scenarios
VALUES
-- Location 1
(1, 1, 10, 30),
(1, 2, 8, 30),
(1, 3, 4, 30),
(1, 4, 20, 30),
(1, 5, 10, 30),
(1, 6, 7.5, 20),
(1, 7, 9, 20),
(1, 8, 20, 40),
(1, 9, 37, 150),
(1, 10, 100, 150),

-- Location 2
(2, 1, 18, 40),
(2, 2, 15, 35),
(2, 3, 7, 25),
(2, 4, 25, 40),
(2, 5, 14, 30),
(2, 6, 12.5, 25),
(2, 7, 13, 25),
(2, 8, 28, 50),
(2, 9, 65, 200),
(2, 10, 140, 250),

-- Location 3
(3, 1, 25, 50),
(3, 2, 22, 45),
(3, 3, 10, 30),
(3, 4, 35, 50),
(3, 5, 18, 35),
(3, 6, 15, 30),
(3, 7, 17, 30),
(3, 8, 35, 60),
(3, 9, 90, 250),
(3, 10, 180, 300),

-- Location 4
(4, 1, 12, 30),
(4, 2, 9, 30),
(4, 3, 5, 20),
(4, 4, 22, 35),
(4, 5, 8, 25),
(4, 6, 9, 20),
(4, 7, 11, 20),
(4, 8, 18, 40),
(4, 9, 45, 150),
(4, 10, 110, 180),

-- Location 5
(5, 1, 20, 45),
(5, 2, 18, 40),
(5, 3, 8, 25),
(5, 4, 30, 45),
(5, 5, 16, 35),
(5, 6, 11.5, 25),
(5, 7, 14, 25),
(5, 8, 30, 50),
(5, 9, 72, 220),
(5, 10, 155, 250),

-- Location 6
(6, 1, 15, 35),
(6, 2, 12, 30),
(6, 3, 6, 20),
(6, 4, 24, 40),
(6, 5, 12, 30),
(6, 6, 8.5, 20),
(6, 7, 10, 20),
(6, 8, 24, 45),
(6, 9, 52, 180),
(6, 10, 125, 200),

-- Location 7
(7, 1, 28, 55),
(7, 2, 25, 50),
(7, 3, 12, 35),
(7, 4, 40, 60),
(7, 5, 22, 40),
(7, 6, 18, 35),
(7, 7, 20, 35),
(7, 8, 42, 70),
(7, 9, 110, 300),
(7, 10, 220, 350),

-- Location 8
(8, 1, 17, 40),
(8, 2, 14, 35),
(8, 3, 7, 25),
(8, 4, 27, 45),
(8, 5, 13, 30),
(8, 6, 10, 25),
(8, 7, 12, 25),
(8, 8, 26, 45),
(8, 9, 60, 200),
(8, 10, 135, 220),

-- Location 9
(9, 1, 22, 45),
(9, 2, 20, 40),
(9, 3, 9, 30),
(9, 4, 32, 50),
(9, 5, 17, 35),
(9, 6, 14, 30),
(9, 7, 16, 30),
(9, 8, 32, 55),
(9, 9, 82, 240),
(9, 10, 170, 280),

-- Location 10
(10, 1, 30, 60),
(10, 2, 28, 55),
(10, 3, 14, 40),
(10, 4, 45, 70),
(10, 5, 25, 45),
(10, 6, 20, 40),
(10, 7, 24, 40),
(10, 8, 48, 80),
(10, 9, 125, 350),
(10, 10, 260, 400)

-- Negative scenarios to test the constraints
;

INSERT INTO ua_4778_manual_v2.shift_schedules
    (staff_id, start_time, end_time)
-- Positive scenarios
    (SELECT s.staff_id,
            (date + TIME '8:00:00') AT TIME ZONE 'Europe/Kyiv'  start_time,
            (date + TIME '20:00:00') AT TIME ZONE 'Europe/Kyiv' end_time
     FROM (SELECT staff_id FROM ua_4778_manual_v2.staff WHERE staff_id % 2 = 1) s
              CROSS JOIN (SELECT generate_series(
                                         DATE '2026-01-01',
                                         CURRENT_DATE,
                                         INTERVAL '2 days'
                                 )::date AS date) date

     UNION ALL

     SELECT s.staff_id,
            (date + TIME '8:00:00') AT TIME ZONE 'Europe/Kyiv'  start_time,
            (date + TIME '20:00:00') AT TIME ZONE 'Europe/Kyiv' end_time
     FROM (SELECT staff_id FROM ua_4778_manual_v2.staff WHERE staff_id % 2 = 0) s
              CROSS JOIN (SELECT generate_series(
                                         DATE '2026-01-02',
                                         CURRENT_DATE,
                                         INTERVAL '2 days'
                                 )::date AS date) date
     ORDER BY start_time)

-- Negative scenarios to test the constraints
;

INSERT INTO ua_4778_manual_v2.customer_feedback
    (rating, comment, customer_info, order_id, reservation_id)
VALUES
-- Positive scenarios
(5, 'Excellent food and very friendly service.', 'Andrii K.', 1, NULL),
(4, 'Good food, but the waiting time was a little long.', 'Olena S.', 2, NULL),
(5, 'Everything was perfect. Will definitely come again.', 'Maksym P.', NULL, 1),
(3, 'Food was okay, but nothing special.', 'Iryna M.', 3, NULL),
(2, 'The order was late and the food was cold.', 'Dmytro H.', 4, NULL),
(5, 'Great atmosphere and delicious meals.', 'Kateryna B.', NULL, 2),
(4, 'Very good experience overall.', 'Oleh T.', 5, NULL),
(5, 'Fresh ingredients and excellent presentation.', 'Sofia R.', 6, NULL),
(3, 'Service was average. Food was acceptable.', 'Viktor L.', NULL, 3),
(1, 'Very disappointing experience.', 'Anna C.', 7, NULL),
(4, 'Tasty food and polite staff.', 'Mykhailo D.', 8, NULL),
(5, 'Amazing dinner. Everything was delicious.', 'Natalia K.', NULL, 4),
(3, 'The food was good but the portions were small.', 'Roman V.', 9, NULL),
(4, 'Nice place for a family dinner.', 'Yulia P.', 10, NULL),
(2, 'Had to wait too long for the order.', 'Serhii M.', NULL, 5),
(5, 'Wonderful service and great food.', 'Maria H.', 11, NULL),
(4, 'Good quality and reasonable prices.', 'Bohdan R.', 12, NULL),
(5, 'Really enjoyed the evening.', 'Alina T.', NULL, 6),
(3, 'Average experience. Could be better.', 'Taras K.', 13, NULL),
(1, 'The staff was rude and the food was poor.', 'Oksana L.', 14, NULL),
(5, 'Excellent restaurant with great service.', 'Denys P.', NULL, 7),
(4, 'Very tasty meals and clean restaurant.', 'Viktoriia S.', 15, NULL),
(5, 'Perfect experience from start to finish.', 'Artem B.', 16, NULL),
(3, 'Food was fine, but service was slow.', 'Liliia M.', NULL, 8),
(4, 'Nice atmosphere and tasty food.', 'Pavlo H.', 17, NULL),
(2, 'The food was cold when it arrived.', 'Yevhen K.', 18, NULL),
(5, 'Fantastic food and excellent staff.', 'Daria V.', NULL, 9),
(4, 'Good restaurant. Would recommend it.', 'Oleksii R.', 19, NULL),
(3, 'Nothing bad, but nothing memorable either.', 'Nazar T.', 20, NULL),
(5, 'Absolutely loved the dessert.', 'Anastasiia P.', NULL, 10),
(4, 'Fast service and tasty food.', 'Ihor M.', 21, NULL),
(5, 'Everything was fresh and delicious.', 'Polina S.', 22, NULL),
(2, 'The table was not ready at the reserved time.', 'Volodymyr K.', NULL, 11),
(4, 'Friendly staff and nice atmosphere.', 'Olesia B.', 23, NULL),
(5, 'Great place for a special occasion.', 'Yurii L.', 24, NULL),
(3, 'The service could have been faster.', 'Tetiana H.', NULL, 12),
(4, 'Good food and comfortable seating.', 'Vadym C.', 25, NULL),
(5, 'Excellent steaks and great service.', 'Kristina R.', 26, NULL),
(1, 'Food was badly prepared and overpriced.', 'Oleksandr P.', NULL, 13),
(4, 'Overall a pleasant experience.', 'Iuliia D.', 27, NULL),
(5, 'Very delicious and beautifully presented.', 'Serhii V.', 28, NULL),
(3, 'The food was average for the price.', 'Marta K.', NULL, 14),
(4, 'Nice service and good food.', 'Vasyl T.', 29, NULL),
(5, 'One of the best restaurants in town.', 'Halyna M.', 30, NULL),
(2, 'The order took almost an hour.', 'Andrii S.', NULL, 15),
(4, 'Good experience overall.', 'Olha P.', 31, NULL),
(5, 'Very professional staff.', 'Borys H.', 32, NULL),
(3, 'Decent food but noisy environment.', 'Svitlana L.', NULL, 16),
(4, 'Fresh food and friendly staff.', 'Ihor B.', 33, NULL),
(5, 'Excellent service and wonderful food.', 'Nadiia R.', 34, NULL),
(3, 'The portions could be larger.', 'Maksym T.', NULL, 17),
(4, 'Good place for lunch.', 'Oksana V.', 35, NULL),
(5, 'Everything tasted amazing.', 'Danylo K.', 36, NULL),
(2, 'The waiter forgot part of our order.', 'Inna M.', NULL, 18),
(4, 'Very pleasant restaurant.', 'Petro S.', 37, NULL),
(5, 'Great food and quick service.', 'Lesia H.', 38, NULL),
(3, 'Average food, good service.', 'Roman P.', NULL, 19),
(4, 'Would visit again.', 'Yana D.', 39, NULL),
(5, 'Perfect dinner with friends.', 'Oleksandr T.', 40, NULL),
(1, 'Very poor service and long waiting time.', 'Svitlana B.', NULL, 20),
(4, 'Good quality food.', 'Dmytro P.', 41, NULL),
(5, 'Excellent experience.', 'Kateryna L.', 42, NULL),
(3, 'Food was okay but expensive.', 'Viktor H.', NULL, 21),
(4, 'Friendly and attentive staff.', 'Iryna T.', 43, NULL),
(5, 'Delicious food and great atmosphere.', 'Bohdan K.', 44, NULL),
(2, 'The food was not fresh.', 'Alina M.', NULL, 22),
(4, 'Nice restaurant with good service.', 'Mykhailo R.', 45, NULL),
(5, 'Loved everything about the restaurant.', 'Sofiia K.', 46, NULL),
(3, 'Service was slow during busy hours.', 'Taras V.', NULL, 23),
(4, 'Good experience for the price.', 'Natalia P.', 47, NULL),
(5, 'Amazing food and excellent presentation.', 'Denys M.', 48, NULL),
(4, 'Very good service.', 'Maria S.', NULL, 24),
(3, 'Food was acceptable.', 'Oleh K.', 49, NULL),
(5, 'Fantastic restaurant. Highly recommended.', 'Yevheniia T.', 50, NULL),
(2, 'Reservation was delayed.', 'Serhii L.', NULL, 25),
(4, 'Tasty food and clean tables.', 'Anna P.', 51, NULL),
(5, 'Great experience with the family.', 'Maksym H.', 52, NULL),
(3, 'Could improve the service speed.', 'Olena V.', NULL, 26),
(4, 'Nice food and pleasant atmosphere.', 'Vladyslav R.', 53, NULL),
(5, 'Everything was excellent.', 'Daria K.', 54, NULL),
(4, 'Good food and helpful staff.', 'Pavlo M.', NULL, 27),
(5, 'Excellent dinner experience.', 'Yulia H.', 55, NULL),
(3, 'Average experience overall.', 'Artem L.', 56, NULL),
(4, 'Would recommend this restaurant.', 'Oksana R.', NULL, 28),
(5, 'Very tasty and fresh food.', 'Ihor P.', 57, NULL),
(2, 'Food arrived cold.', 'Tetiana S.', 58, NULL),
(4, 'Good service and comfortable atmosphere.', 'Vasyl K.', NULL, 29),
(5, 'Really enjoyed our dinner.', 'Kristina M.', 59, NULL),
(3, 'The food was fine, but service was slow.', 'Roman D.', 60, NULL),
(4, 'Pleasant experience.', 'Liliia P.', NULL, 30),
(5, 'Excellent food and wonderful staff.', 'Andrii H.', 61, NULL),
(4, 'Good restaurant with reasonable prices.', 'Iryna K.', 62, NULL),
(3, 'Average food quality.', 'Oleh V.', NULL, 31),
(5, 'Perfect place for dinner.', 'Svitlana T.', 63, NULL),
(4, 'Everything was good.', 'Dmytro R.', 64, NULL),
(2, 'We had to wait too long.', 'Olha M.', NULL, 32),
(5, 'Fantastic food and atmosphere.', 'Bohdan P.', 65, NULL),
(4, 'Very nice experience.', 'Nadiia S.', 66, NULL),
(3, 'Nothing exceptional.', 'Yurii K.', NULL, 33),
(5, 'Would definitely come back.', 'Anastasiia H.', 67, NULL),
(4, 'Good food and friendly service.', 'Denys R.', 68, NULL),
(5, 'Excellent restaurant.', 'Maria K.', NULL, 34),
(3, 'The food was okay.', 'Viktor P.', 69, NULL),
(4, 'Nice place and good service.', 'Kateryna T.', 70, NULL),
(5, 'Everything was delicious.', 'Mykhailo S.', NULL, 35),
(2, 'The service was disappointing.', 'Olesia M.', 71, NULL),
(4, 'Good overall experience.', 'Taras H.', 72, NULL),
(5, 'Amazing dinner.', 'Yevhen R.', NULL, 36),
(3, 'Food was average.', 'Polina K.', 73, NULL),
(4, 'I enjoyed the visit.', 'Oleksii M.', 74, NULL)

-- Negative scenarios to test the constraints
--(4, 'I enjoyed the visit.', 'Oleksii M.', 74, 22);
;

INSERT INTO ua_4778_manual_v2.ingredients
    (name, inventory_type_id, unit)
-- Positive scenarios
VALUES
-- 1. Dry ingredients
('Flour', 1, 'kg'),
('Rice', 1, 'kg'),
('Pasta', 1, 'kg'),
('Buckwheat', 1, 'kg'),
('Oatmeal', 1, 'kg'),
('Sugar', 1, 'kg'),
('Salt', 1, 'kg'),
('Black Pepper', 1, 'kg'),
('Breadcrumbs', 1, 'kg'),

-- 2. Meat & poultry
('Chicken Breast', 2, 'kg'),
('Chicken Thigh', 2, 'kg'),
('Chicken Wings', 2, 'kg'),
('Chicken Drumsticks', 2, 'kg'),
('Beef Tenderloin', 2, 'kg'),
('Beef Mince', 2, 'kg'),
('Pork Tenderloin', 2, 'kg'),
('Pork Ribs', 2, 'kg'),
('Pork Mince', 2, 'kg'),
('Turkey Breast', 2, 'kg'),
('Bacon', 2, 'kg'),
('Beef Steak', 2, 'kg'),

-- 3. Fish & seafood
('Salmon', 3, 'kg'),
('Tuna', 3, 'kg'),
('Cod Fillet', 3, 'kg'),
('Hake Fillet', 3, 'kg'),
('Trout', 3, 'kg'),
('Shrimp', 3, 'kg'),
('Mussels', 3, 'kg'),
('Squid', 3, 'kg'),

-- 4. Vegetables
('Tomato', 4, 'kg'),
('Cucumber', 4, 'kg'),
('Onion', 4, 'kg'),
('Garlic', 4, 'kg'),
('Potato', 4, 'kg'),
('Carrot', 4, 'kg'),
('Bell Pepper', 4, 'kg'),
('Broccoli', 4, 'kg'),
('Cauliflower', 4, 'kg'),
('Cabbage', 4, 'kg'),
('Spinach', 4, 'kg'),
('Lettuce', 4, 'kg'),
('Zucchini', 4, 'kg'),
('Eggplant', 4, 'kg'),
('Mushrooms', 4, 'kg'),

-- 5. Fruits
('Apple', 5, 'kg'),
('Banana', 5, 'kg'),
('Orange', 5, 'kg'),
('Lemon', 5, 'kg'),
('Lime', 5, 'kg'),
('Pear', 5, 'kg'),
('Pineapple', 5, 'kg'),
('Mango', 5, 'kg'),
('Strawberry', 5, 'kg'),
('Blueberry', 5, 'kg'),

-- 6. Dairy
('Milk', 6, 'l'),
('Cream', 6, 'l'),
('Kefir', 6, 'l'),
('Yogurt', 6, 'l'),
('Sour Cream', 6, 'l'),
('Mozzarella', 6, 'kg'),
('Cheddar', 6, 'kg'),
('Butter', 6, 'kg'),

-- 7. Frozen products
('Frozen Peas', 7, 'kg'),
('Frozen Corn', 7, 'kg'),
('Frozen Spinach', 7, 'kg'),
('Frozen Berries', 7, 'kg'),
('Frozen French Fries', 7, 'kg'),
('Frozen Mixed Vegetables', 7, 'kg'),
('Frozen Chicken Nuggets', 7, 'kg'),
('Frozen Dumplings', 7, 'kg'),

-- 8. Beverages
('Still Water', 8, 'l'),
('Sparkling Water', 8, 'l'),
('Orange Juice', 8, 'l'),
('Apple Juice', 8, 'l'),
('Cola', 8, 'l'),
('Lemonade', 8, 'l'),
('Iced Tea', 8, 'l'),

-- 9. Sauces & condiments
('Ketchup', 9, 'pcs'),
('Mayonnaise', 9, 'pcs'),
('Mustard', 9, 'pcs'),
('Soy Sauce', 9, 'pcs'),
('Hot Sauce', 9, 'pcs'),

-- 10. Packaging
('Paper Cups', 10, 'pcs'),
('Food Containers', 10, 'pcs'),
('Paper Bags', 10, 'pcs'),
('Plastic Lids', 10, 'pcs'),
('Paper Napkins', 10, 'pcs')

-- Negative scenarios to test the constraints
;

INSERT INTO ua_4778_manual_v2.suppliers
    (title, website, address, city, country, tax_id, details)
VALUES
-- Positive scenarios
('FreshFarm Ukraine', 'https://freshfarm.ua', '12 Shevchenka St', 'Kyiv', 'Ukraine', 'UA4012345678',
 'Fresh vegetables and fruits supplier'),
('MeatPro', 'https://meatpro.ua', '45 Industrialna St', 'Lviv', 'Ukraine', 'UA4012345679',
 'Beef, pork and poultry supplier'),
('Ocean Foods', 'https://oceanfoods.ua', '18 Portova St', 'Odesa', 'Ukraine', 'UA4012345680',
 'Fish and seafood supplier'),
('Dairy House', 'https://dairyhouse.ua', '27 Moloka St', 'Khmelnytskyi', 'Ukraine', 'UA4012345681',
 'Milk and dairy products supplier'),
('Grain Trade', 'https://graintrade.ua', '8 Zelena St', 'Ternopil', 'Ukraine', 'UA4012345682',
 'Flour, rice and grains supplier'),
('FoodLine', 'https://foodline.ua', '31 Soborna St', 'Vinnytsia', 'Ukraine', 'UA4012345683',
 'General food products supplier'),
('EuroFrozen', 'https://eurofrozen.ua', '76 Promyslova St', 'Kyiv', 'Ukraine', 'UA4012345684',
 'Frozen products supplier'),
('DrinkMarket', 'https://drinkmarket.ua', '14 Naberezhna St', 'Dnipro', 'Ukraine', 'UA4012345685',
 'Beverages and juices supplier'),
('Sauce World', 'https://sauceworld.ua', '22 Franka St', 'Lviv', 'Ukraine', 'UA4012345686',
 'Sauces and condiments supplier'),
('PackPro', 'https://packpro.ua', '9 Zavodska St', 'Kharkiv', 'Ukraine', 'UA4012345687', 'Food packaging supplier'),
('Green Basket', 'https://greenbasket.ua', '16 Sadova St', 'Zhytomyr', 'Ukraine', 'UA4012345688',
 'Fresh fruits and vegetables supplier'),
('Prime Poultry', 'https://primepoultry.ua', '54 Avtobudivna St', 'Cherkasy', 'Ukraine', 'UA4012345689',
 'Chicken and turkey supplier'),
('Black Sea Seafood', 'https://blackseafood.ua', '7 Morska St', 'Odesa', 'Ukraine', 'UA4012345690',
 'Fresh and frozen seafood supplier'),
('Sweet Ingredients', 'https://sweetingredients.ua', '33 Bakery St', 'Kyiv', 'Ukraine', 'UA4012345691',
 'Sugar, flour and baking ingredients supplier'),
('Nordic Dairy', 'https://nordicdairy.ua', '19 Hrushevskoho St', 'Rivne', 'Ukraine', 'UA4012345692',
 'Dairy and cheese supplier'),
('Farm Choice', 'https://farmchoice.ua', '42 Tsentralna St', 'Poltava', 'Ukraine', 'UA4012345693',
 'Farm-produced food supplier'),
('Frozen Food Hub', 'https://frozenfoodhub.ua', '61 Logistics St', 'Kyiv', 'Ukraine', 'UA4012345694',
 'Frozen vegetables and prepared products supplier'),
('City Beverage', 'https://citybeverage.ua', '25 Velyka St', 'Ivano-Frankivsk', 'Ukraine', 'UA4012345695',
 'Soft drinks and bottled water supplier'),
('Global Foods UA', 'https://globalfoods.ua', '88 Peremohy St', 'Kyiv', 'Ukraine', 'UA4012345696',
 'Imported food ingredients supplier'),
('Kitchen Supply', 'https://kitchensupply.ua', '11 Warehouse St', 'Brovary', 'Ukraine', 'UA4012345697',
 'Restaurant ingredients and supplies supplier'),
('Organic Fields', 'https://organicfields.ua', '29 Polova St', 'Uzhhorod', 'Ukraine', 'UA4012345698',
 'Organic fruits and vegetables supplier'),
('Central Wholesale', 'https://centralwholesale.ua', '73 Industrialna St', 'Khmelnytskyi', 'Ukraine', 'UA4012345699',
 'Wholesale food distributor'),
('Restaurant Partners', 'https://restaurantpartners.ua', '36 Business St', 'Kyiv', 'Ukraine', 'UA4012345700',
 'Full-range restaurant supply distributor');

-- Negative scenarios to test the constraints
;

INSERT INTO ua_4778_manual_v2.supplier_contacts
(supplier_id, is_primary, first_name, last_name, job_title, email, phone)
-- Positive scenarios
VALUES
-- Supplier 1: FreshFarm Ukraine
(1, TRUE, 'Oleksandr', 'Bondarenko', 'Sales Manager', 'o.bondarenko@freshfarm.ua', '+380501001001'),
(1, FALSE, 'Iryna', 'Koval', 'Account Manager', 'i.koval@freshfarm.ua', '+380501001002'),
(1, FALSE, 'Maksym', 'Tkachenko', 'Sales Representative', 'm.tkachenko@freshfarm.ua', '+380501001003'),

-- Supplier 2: MeatPro
(2, TRUE, 'Andrii', 'Melnyk', 'Sales Manager', 'a.melnyk@meatpro.ua', '+380502001001'),
(2, FALSE, 'Olena', 'Shevchenko', 'Key Account Manager', 'o.shevchenko@meatpro.ua', '+380502001002'),
(2, FALSE, 'Viktor', 'Kravets', 'Account Manager', 'v.kravets@meatpro.ua', '+380502001003'),
(2, FALSE, 'Svitlana', 'Bondar', 'Sales Specialist', 's.bondar@meatpro.ua', '+380502001004'),

-- Supplier 3: Ocean Foods
(3, TRUE, 'Dmytro', 'Kozak', 'Commercial Manager', 'd.kozak@oceanfoods.ua', '+380503001001'),
(3, FALSE, 'Kateryna', 'Lysenko', 'Sales Manager', 'k.lysenko@oceanfoods.ua', '+380503001002'),

-- Supplier 4: Dairy House
(4, TRUE, 'Taras', 'Hrytsenko', 'Sales Manager', 't.hrytsenko@dairyhouse.ua', '+380504001001'),
(4, FALSE, 'Natalia', 'Marchenko', 'Account Manager', 'n.marchenko@dairyhouse.ua', '+380504001002'),
(4, FALSE, 'Roman', 'Polishchuk', 'Sales Representative', 'r.polishchuk@dairyhouse.ua', '+380504001003'),
(4, FALSE, 'Yulia', 'Savchuk', 'Customer Manager', 'y.savchuk@dairyhouse.ua', '+380504001004'),
(4, FALSE, 'Mykola', 'Rudenko', 'Sales Specialist', 'm.rudenko@dairyhouse.ua', '+380504001005'),

-- Supplier 5: Grain Trade
(5, TRUE, 'Serhii', 'Kovalchuk', 'Sales Manager', 's.kovalchuk@graintrade.ua', '+380505001001'),
(5, FALSE, 'Oksana', 'Moroz', 'Account Manager', 'o.moroz@graintrade.ua', '+380505001002'),
(5, FALSE, 'Ihor', 'Savchenko', 'Sales Representative', 'i.savchenko@graintrade.ua', '+380505001003'),

-- Supplier 6: FoodLine
(6, TRUE, 'Volodymyr', 'Romanenko', 'Commercial Director', 'v.romanenko@foodline.ua', '+380506001001'),
(6, FALSE, 'Anna', 'Klymenko', 'Sales Manager', 'a.klymenko@foodline.ua', '+380506001002'),

-- Supplier 7: EuroFrozen
(7, TRUE, 'Bohdan', 'Fedorov', 'Sales Manager', 'b.fedorov@eurofrozen.ua', '+380507001001'),
(7, FALSE, 'Liliia', 'Kucher', 'Account Manager', 'l.kucher@eurofrozen.ua', '+380507001002'),
(7, FALSE, 'Artem', 'Danylchuk', 'Sales Representative', 'a.danylchuk@eurofrozen.ua', '+380507001003'),
(7, FALSE, 'Maria', 'Yaremchuk', 'Customer Manager', 'm.yaremchuk@eurofrozen.ua', '+380507001004'),

-- Supplier 8: DrinkMarket
(8, TRUE, 'Yevhen', 'Pavlenko', 'Sales Manager', 'y.pavlenko@drinkmarket.ua', '+380508001001'),
(8, FALSE, 'Viktoriia', 'Levchenko', 'Account Manager', 'v.levchenko@drinkmarket.ua', '+380508001002'),

-- Supplier 9: Sauce World
(9, TRUE, 'Oleksii', 'Didenko', 'Sales Manager', 'o.didenko@sauceworld.ua', '+380509001001'),
(9, FALSE, 'Alina', 'Koval', 'Sales Specialist', 'a.koval@sauceworld.ua', '+380509001002'),
(9, FALSE, 'Denys', 'Petryk', 'Account Manager', 'd.petryk@sauceworld.ua', '+380509001003'),

-- Supplier 10: PackPro
(10, TRUE, 'Maksym', 'Havryliuk', 'Sales Manager', 'm.havryliuk@packpro.ua', '+380510001001'),
(10, FALSE, 'Olha', 'Bilenko', 'Account Manager', 'o.bilenko@packpro.ua', '+380510001002'),
(10, FALSE, 'Pavlo', 'Nesterenko', 'Sales Representative', 'p.nesterenko@packpro.ua', '+380510001003'),
(10, FALSE, 'Sofiia', 'Koval', 'Customer Manager', 's.koval@packpro.ua', '+380510001004'),
(10, FALSE, 'Vadym', 'Korniienko', 'Sales Specialist', 'v.korniienko@packpro.ua', '+380510001005'),

-- Supplier 11: Green Basket
(11, TRUE, 'Ihor', 'Marchuk', 'Sales Manager', 'i.marchuk@greenbasket.ua', '+380511001001'),
(11, FALSE, 'Tetiana', 'Hnatiuk', 'Account Manager', 't.hnatiuk@greenbasket.ua', '+380511001002'),

-- Supplier 12: Prime Poultry
(12, TRUE, 'Ruslan', 'Kushnir', 'Commercial Manager', 'r.kushnir@primepoultry.ua', '+380512001001'),
(12, FALSE, 'Nazar', 'Borysenko', 'Sales Manager', 'n.borysenko@primepoultry.ua', '+380512001002'),
(12, FALSE, 'Iryna', 'Fomenko', 'Account Manager', 'i.fomenko@primepoultry.ua', '+380512001003'),
(12, FALSE, 'Oleh', 'Melnychenko', 'Sales Representative', 'o.melnychenko@primepoultry.ua', '+380512001004'),

-- Supplier 13: Black Sea Seafood
(13, TRUE, 'Volodymyr', 'Kravchuk', 'Sales Manager', 'v.kravchuk@blackseafood.ua', '+380513001001'),
(13, FALSE, 'Halyna', 'Dorosh', 'Account Manager', 'h.dorosh@blackseafood.ua', '+380513001002'),
(13, FALSE, 'Stepan', 'Yurchenko', 'Sales Specialist', 's.yurchenko@blackseafood.ua', '+380513001003'),

-- Supplier 14: Sweet Ingredients
(14, TRUE, 'Anatolii', 'Ponomarenko', 'Sales Manager', 'a.ponomarenko@sweetingredients.ua', '+380514001001'),
(14, FALSE, 'Larysa', 'Tymoshenko', 'Account Manager', 'l.tymoshenko@sweetingredients.ua', '+380514001002'),

-- Supplier 15: Nordic Dairy
(15, TRUE, 'Mykhailo', 'Kuzmenko', 'Commercial Manager', 'm.kuzmenko@nordicdairy.ua', '+380515001001'),
(15, FALSE, 'Vira', 'Onyshchenko', 'Sales Manager', 'v.onyshchenko@nordicdairy.ua', '+380515001002'),
(15, FALSE, 'Andrii', 'Bohdan', 'Account Manager', 'a.bohdan@nordicdairy.ua', '+380515001003'),
(15, FALSE, 'Inna', 'Fedorchuk', 'Sales Specialist', 'i.fedorchuk@nordicdairy.ua', '+380515001004'),

-- Supplier 16: Farm Choice
(16, TRUE, 'Petro', 'Lytvyn', 'Sales Manager', 'p.lytvyn@farmchoice.ua', '+380516001001'),
(16, FALSE, 'Olesia', 'Kucher', 'Account Manager', 'o.kucher@farmchoice.ua', '+380516001002'),
(16, FALSE, 'Danylo', 'Shapoval', 'Sales Representative', 'd.shapoval@farmchoice.ua', '+380516001003'),

-- Supplier 17: Frozen Food Hub
(17, TRUE, 'Serhii', 'Korniienko', 'Commercial Manager', 's.korniienko@frozenfoodhub.ua', '+380517001001'),
(17, FALSE, 'Marta', 'Zakharchuk', 'Sales Manager', 'm.zakharchuk@frozenfoodhub.ua', '+380517001002'),

-- Supplier 18: City Beverage
(18, TRUE, 'Oleksandr', 'Danylchuk', 'Sales Manager', 'o.danylchuk@citybeverage.ua', '+380518001001'),
(18, FALSE, 'Yana', 'Kravets', 'Account Manager', 'y.kravets@citybeverage.ua', '+380518001002'),
(18, FALSE, 'Vasyl', 'Hryhorenko', 'Sales Specialist', 'v.hryhorenko@citybeverage.ua', '+380518001003'),
(18, FALSE, 'Svitlana', 'Kovalchuk', 'Customer Manager', 's.kovalchuk@citybeverage.ua', '+380518001004'),

-- Supplier 19: Global Foods UA
(19, TRUE, 'Roman', 'Tkachenko', 'Commercial Director', 'r.tkachenko@globalfoods.ua', '+380519001001'),
(19, FALSE, 'Kateryna', 'Bondar', 'Sales Manager', 'k.bondar@globalfoods.ua', '+380519001002'),
(19, FALSE, 'Yurii', 'Kozlov', 'Account Manager', 'y.kozlov@globalfoods.ua', '+380519001003'),

-- Supplier 20: Kitchen Supply
(20, TRUE, 'Denys', 'Koval', 'Sales Manager', 'd.koval@kitchensupply.ua', '+380520001001'),
(20, FALSE, 'Oksana', 'Havryliuk', 'Account Manager', 'o.havryliuk@kitchensupply.ua', '+380520001002'),

-- Supplier 21: Organic Fields
(21, TRUE, 'Borys', 'Melnyk', 'Sales Manager', 'b.melnyk@organicfields.ua', '+380521001001'),
(21, FALSE, 'Nadiia', 'Kozak', 'Account Manager', 'n.kozak@organicfields.ua', '+380521001002'),
(21, FALSE, 'Marko', 'Lysenko', 'Sales Representative', 'm.lysenko@organicfields.ua', '+380521001003'),
(21, FALSE, 'Iryna', 'Marchenko', 'Customer Manager', 'i.marchenko@organicfields.ua', '+380521001004'),
(21, FALSE, 'Yaroslav', 'Savchuk', 'Sales Specialist', 'y.savchuk@organicfields.ua', '+380521001005'),

-- Supplier 22: Central Wholesale
(22, TRUE, 'Viktor', 'Pavliuk', 'Commercial Manager', 'v.pavliuk@centralwholesale.ua', '+380522001001'),
(22, FALSE, 'Lilia', 'Moroz', 'Sales Manager', 'l.moroz@centralwholesale.ua', '+380522001002'),
(22, FALSE, 'Maksym', 'Klymenko', 'Account Manager', 'm.klymenko@centralwholesale.ua', '+380522001003'),

-- Supplier 23: Restaurant Partners
(23, TRUE, 'Andrii', 'Fedorchuk', 'Commercial Director', 'a.fedorchuk@restaurantpartners.ua', '+380523001001'),
(23, FALSE, 'Svitlana', 'Rudenko', 'Sales Manager', 's.rudenko@restaurantpartners.ua', '+380523001002'),
(23, FALSE, 'Oleksii', 'Marchuk', 'Account Manager', 'o.marchuk@restaurantpartners.ua', '+380523001003'),
(23, FALSE, 'Yulia', 'Bondarenko', 'Customer Manager', 'y.bondarenko@restaurantpartners.ua', '+380523001004')

-- Negative scenarios to test the constraints
;


----------------------------
-- many-to-many relations --
----------------------------

INSERT INTO ua_4778_manual_v2.locations_menu_items
    (location_id, menu_item_id)
-- Positive scenarios
    (SELECT l.location_id, mi.menu_item_id
     FROM ua_4778_manual_v2.locations l
              CROSS JOIN ua_4778_manual_v2.menu_items mi
     ORDER BY 1)
-- Negative scenarios to test the constraints
;

INSERT INTO ua_4778_manual_v2.staff_orders
    (order_id, staff_id)
-- Positive scenarios
    (SELECT o.order_id,
            s.staff_id
     FROM ua_4778_manual_v2.orders o
              CROSS JOIN ua_4778_manual_v2.staff s
     WHERE EXTRACT(DAY FROM o.created_at)::int % 2 = s.staff_id % 2
       AND o.location_id = s.location_id
     ORDER BY o.created_at)
-- Negative scenarios to test the constraints
;

INSERT INTO ua_4778_manual_v2.menu_items_orders
    (order_id, menu_item_id, quantity)
VALUES
    -- Positive scenarios
    (1, 2, 2),
    (1, 11, 1),
    (1, 21, 2),
    (2, 1, 1),
    (2, 13, 2),
    (2, 26, 1),
    (3, 4, 2),
    (3, 15, 1),
    (3, 23, 2),
    (4, 3, 1),
    (4, 12, 2),
    (4, 14, 1),
    (4, 22, 2),
    (5, 7, 2),
    (5, 16, 1),
    (6, 6, 1),
    (6, 17, 2),
    (6, 25, 1),
    (7, 4, 1),
    (7, 13, 2),
    (8, 1, 2),
    (8, 15, 2),
    (8, 27, 1),
    (9, 8, 1),
    (9, 18, 1),
    (9, 21, 2),
    (10, 2, 2),
    (10, 14, 1),
    (10, 28, 1),
    (11, 3, 1),
    (11, 11, 2),
    (11, 26, 2),
    (12, 4, 3),
    (12, 19, 1),
    (12, 23, 2),
    (13, 6, 2),
    (13, 12, 1),
    (13, 25, 1),
    (14, 1, 2),
    (14, 13, 1),
    (14, 21, 2),
    (14, 22, 1),
    (15, 5, 2),
    (15, 16, 1),
    (15, 27, 1),
    (16, 8, 1),
    (16, 17, 2),
    (16, 29, 1),
    (17, 2, 2),
    (17, 15, 1),
    (17, 23, 3),
    (18, 7, 1),
    (18, 14, 1),
    (19, 3, 2),
    (19, 14, 1),
    (19, 26, 2),
    (20, 4, 2),
    (20, 18, 1),
    (20, 21, 1),
    (21, 1, 1),
    (21, 11, 2),
    (21, 24, 2),
    (22, 6, 2),
    (22, 16, 1),
    (22, 22, 1),
    (23, 2, 1),
    (23, 13, 2),
    (23, 28, 1),
    (24, 5, 2),
    (24, 19, 1),
    (24, 25, 2),
    (25, 8, 1),
    (25, 17, 2),
    (25, 27, 1),
    (26, 1, 2),
    (26, 12, 1),
    (26, 21, 2),
    (27, 4, 1),
    (27, 15, 1),
    (28, 3, 2),
    (28, 18, 1),
    (28, 23, 2),
    (29, 2, 2),
    (29, 14, 1),
    (29, 26, 1),
    (30, 7, 2),
    (30, 11, 1),
    (30, 22, 2),
    (31, 1, 1),
    (31, 13, 2),
    (31, 21, 1),
    (32, 6, 2),
    (32, 17, 1),
    (32, 29, 2),
    (33, 4, 1),
    (33, 16, 2),
    (33, 27, 1),
    (34, 2, 2),
    (34, 12, 1),
    (34, 25, 2),
    (35, 8, 1),
    (35, 19, 2),
    (35, 23, 1),
    (36, 3, 2),
    (36, 15, 1),
    (36, 28, 2),
    (37, 7, 1),
    (37, 4, 1),
    (38, 5, 2),
    (38, 13, 1),
    (39, 1, 2),
    (39, 18, 1),
    (39, 26, 2),
    (40, 4, 1),
    (40, 14, 2),
    (40, 21, 1),
    (41, 2, 2),
    (41, 11, 1),
    (41, 24, 2),
    (42, 6, 1),
    (42, 16, 2),
    (42, 22, 1),
    (43, 3, 2),
    (43, 17, 1),
    (43, 25, 2),
    (44, 1, 1),
    (44, 15, 2),
    (44, 27, 1),
    (45, 8, 2),
    (45, 19, 1),
    (45, 23, 2),
    (46, 5, 1),
    (46, 12, 2),
    (46, 26, 1),
    (47, 4, 1),
    (47, 15, 1),
    (48, 2, 2),
    (48, 18, 1),
    (48, 28, 2),
    (49, 7, 1),
    (49, 14, 2),
    (49, 21, 1),
    (50, 1, 2),
    (50, 13, 1),
    (50, 22, 2),
    (51, 6, 1),
    (51, 11, 2),
    (51, 25, 1),
    (52, 3, 2),
    (52, 17, 1),
    (52, 23, 2),
    (53, 4, 1),
    (53, 15, 2),
    (53, 26, 1),
    (54, 2, 2),
    (54, 14, 1),
    (54, 21, 2),
    (55, 8, 1),
    (55, 19, 2),
    (55, 29, 1),
    (56, 5, 2),
    (56, 12, 1),
    (56, 27, 2),
    (57, 1, 1),
    (57, 4, 1),
    (58, 7, 2),
    (58, 5, 1),
    (59, 3, 1),
    (59, 13, 2),
    (59, 22, 1),
    (60, 6, 2),
    (60, 18, 1),
    (60, 25, 2),
    (61, 2, 1),
    (61, 11, 2),
    (61, 21, 1),
    (62, 4, 2),
    (62, 16, 1),
    (62, 26, 2),
    (63, 1, 2),
    (63, 17, 1),
    (63, 23, 2),
    (64, 5, 1),
    (64, 14, 2),
    (64, 28, 1),
    (65, 8, 2),
    (65, 19, 1),
    (65, 24, 2),
    (66, 3, 1),
    (66, 12, 2),
    (66, 27, 1),
    (67, 4, 1),
    (67, 2, 1),
    (68, 2, 2),
    (68, 15, 1),
    (68, 21, 2),
    (69, 7, 1),
    (69, 13, 2),
    (69, 25, 1),
    (70, 1, 2),
    (70, 18, 1),
    (70, 22, 2),
    (71, 6, 1),
    (71, 11, 2),
    (71, 26, 1),
    (72, 5, 1),
    (72, 16, 1),
    (73, 3, 2),
    (73, 16, 1),
    (73, 23, 2),
    (74, 4, 1),
    (74, 14, 2),
    (74, 21, 1),
    (75, 8, 2),
    (75, 17, 1),
    (75, 29, 2),
    (76, 2, 1),
    (76, 12, 2),
    (76, 27, 1),
    (77, 7, 1),
    (77, 4, 1),
    (78, 4, 1),
    (78, 13, 1),
    (79, 1, 2),
    (79, 15, 1),
    (79, 28, 2),
    (80, 6, 1),
    (80, 19, 2),
    (80, 22, 1),
    (81, 2, 2),
    (81, 13, 1),
    (81, 21, 2),
    (82, 3, 1),
    (82, 18, 2),
    (82, 25, 1),
    (83, 5, 2),
    (83, 14, 1),
    (83, 26, 2),
    (84, 8, 1),
    (84, 17, 2),
    (84, 23, 1),
    (85, 1, 2),
    (85, 12, 1),
    (85, 27, 2),
    (86, 4, 1),
    (86, 16, 2),
    (86, 29, 1),
    (87, 2, 1),
    (87, 7, 1),
    (88, 7, 2),
    (88, 19, 1),
    (88, 21, 2),
    (89, 3, 1),
    (89, 11, 2),
    (89, 24, 1),
    (90, 6, 2),
    (90, 15, 1),
    (90, 22, 2),
    (91, 2, 1),
    (91, 13, 2),
    (91, 26, 1),
    (92, 1, 2),
    (92, 14, 1),
    (92, 21, 2),
    (93, 4, 1),
    (93, 17, 2),
    (93, 25, 1),
    (94, 3, 2),
    (94, 12, 1),
    (94, 28, 2),
    (95, 8, 1),
    (95, 18, 1),
    (96, 5, 2),
    (96, 16, 1),
    (97, 2, 2),
    (97, 19, 1),
    (97, 23, 2),
    (98, 7, 1),
    (98, 15, 2),
    (98, 27, 1),
    (99, 1, 2),
    (99, 18, 1),
    (99, 22, 2),
    (100, 4, 1),
    (100, 14, 2),
    (100, 21, 1)
-- Negative scenarios to test the constraints
;

INSERT INTO ua_4778_manual_v2.menu_items_ingredients
    (menu_item_id, ingredient_id, quantity)
-- Positive scenarios
VALUES
-- =========================================================
-- APPETIZERS
-- =========================================================

-- 1. Garlic Bread
(1, 1, 0.080),   -- Flour
(1, 33, 0.015),  -- Garlic
(1, 62, 0.020),  -- Butter
(1, 60, 0.030),  -- Mozzarella
(1, 7, 0.003),   -- Salt
(1, 8, 0.001),   -- Black Pepper

-- 2. Caesar Salad
(2, 10, 0.100),  -- Chicken Breast
(2, 41, 0.080),  -- Lettuce
(2, 9, 0.020),   -- Breadcrumbs
(2, 61, 0.025),  -- Cheddar
(2, 59, 0.030),  -- Sour Cream
(2, 79, 1.000),  -- Mayonnaise
(2, 8, 0.002),   -- Black Pepper
(2, 7, 0.002),   -- Salt

-- 3. Bruschetta
(3, 1, 0.070),   -- Flour
(3, 30, 0.080),  -- Tomato
(3, 33, 0.010),  -- Garlic
(3, 32, 0.020),  -- Onion
(3, 60, 0.025),  -- Mozzarella
(3, 7, 0.002),   -- Salt
(3, 8, 0.001),   -- Black Pepper

-- 4. Chicken Wings
(4, 12, 0.250),  -- Chicken Wings
(4, 82, 1.000),  -- Hot Sauce
(4, 79, 1.000),  -- Mayonnaise
(4, 33, 0.008),  -- Garlic
(4, 7, 0.003),   -- Salt
(4, 8, 0.002),   -- Black Pepper

-- 5. Mozzarella Sticks
(5, 60, 0.120),  -- Mozzarella
(5, 9, 0.050),   -- Breadcrumbs
(5, 1, 0.020),   -- Flour
(5, 78, 1.000),  -- Ketchup
(5, 7, 0.002),   -- Salt

-- 6. Greek Salad
(6, 41, 0.060),  -- Lettuce
(6, 30, 0.080),  -- Tomato
(6, 31, 0.060),  -- Cucumber
(6, 32, 0.025),  -- Onion
(6, 36, 0.025),  -- Bell Pepper
(6, 60, 0.040),  -- Mozzarella
(6, 7, 0.002),   -- Salt
(6, 8, 0.001),   -- Black Pepper

-- 7. Nachos Supreme
(7, 1, 0.080),   -- Flour
(7, 15, 0.070),  -- Beef Mince
(7, 61, 0.060),  -- Cheddar
(7, 30, 0.040),  -- Tomato
(7, 32, 0.025),  -- Onion
(7, 36, 0.020),  -- Bell Pepper
(7, 82, 1.000),  -- Hot Sauce
(7, 79, 1.000),  -- Mayonnaise

-- 8. Calamari
(8, 29, 0.160),  -- Squid
(8, 1, 0.040),   -- Flour
(8, 9, 0.030),   -- Breadcrumbs
(8, 48, 0.020),  -- Lemon
(8, 79, 1.000),  -- Mayonnaise
(8, 7, 0.003),   -- Salt
(8, 8, 0.002),   -- Black Pepper

-- 9. Tomato Soup
(9, 30, 0.180),  -- Tomato
(9, 32, 0.030),  -- Onion
(9, 33, 0.008),  -- Garlic
(9, 56, 0.030),  -- Cream
(9, 1, 0.010),   -- Flour
(9, 62, 0.010),  -- Butter
(9, 7, 0.003),   -- Salt
(9, 8, 0.001),   -- Black Pepper

-- 10. Stuffed Mushrooms
(10, 44, 0.150), -- Mushrooms
(10, 60, 0.050), -- Mozzarella
(10, 61, 0.025), -- Cheddar
(10, 33, 0.008), -- Garlic
(10, 62, 0.010), -- Butter
(10, 7, 0.002),  -- Salt
(10, 8, 0.001),  -- Black Pepper


-- =========================================================
-- MAIN COURSES
-- =========================================================

-- 11. Pizza Diablo
(11, 1, 0.180),  -- Flour
(11, 60, 0.090), -- Mozzarella
(11, 30, 0.080), -- Tomato
(11, 15, 0.060), -- Beef Mince
(11, 20, 0.030), -- Bacon
(11, 82, 1.000), -- Hot Sauce
(11, 32, 0.020), -- Onion
(11, 8, 0.002),  -- Black Pepper
(11, 7, 0.003),  -- Salt

-- 12. Margherita Pizza
(12, 1, 0.180),  -- Flour
(12, 60, 0.100), -- Mozzarella
(12, 30, 0.100), -- Tomato
(12, 33, 0.008), -- Garlic
(12, 7, 0.003),  -- Salt
(12, 8, 0.001),  -- Black Pepper

-- 13. Pepperoni Pizza
(13, 1, 0.180),  -- Flour
(13, 60, 0.090), -- Mozzarella
(13, 30, 0.080), -- Tomato
(13, 20, 0.070), -- Bacon
(13, 32, 0.020), -- Onion
(13, 7, 0.003),  -- Salt

-- 14. Chicken Alfredo
(14, 3, 0.120),  -- Pasta
(14, 10, 0.150), -- Chicken Breast
(14, 56, 0.100), -- Cream
(14, 60, 0.050), -- Mozzarella
(14, 62, 0.015), -- Butter
(14, 33, 0.008), -- Garlic
(14, 8, 0.002),  -- Black Pepper
(14, 7, 0.003),  -- Salt

-- 15. Beef Burger
(15, 1, 0.100),  -- Flour
(15, 15, 0.160), -- Beef Mince
(15, 61, 0.030), -- Cheddar
(15, 41, 0.020), -- Lettuce
(15, 30, 0.030), -- Tomato
(15, 32, 0.020), -- Onion
(15, 78, 1.000), -- Ketchup
(15, 80, 1.000), -- Mustard

-- 16. Chicken Burger
(16, 1, 0.100),  -- Flour
(16, 10, 0.160), -- Chicken Breast
(16, 61, 0.030), -- Cheddar
(16, 41, 0.020), -- Lettuce
(16, 30, 0.030), -- Tomato
(16, 79, 1.000), -- Mayonnaise
(16, 80, 1.000), -- Mustard

-- 17. Grilled Salmon
(17, 22, 0.180), -- Salmon
(17, 34, 0.120), -- Potato
(17, 37, 0.060), -- Broccoli
(17, 48, 0.020), -- Lemon
(17, 62, 0.010), -- Butter
(17, 7, 0.003),  -- Salt
(17, 8, 0.002),  -- Black Pepper

-- 18. Beef Steak
(18, 21, 0.220), -- Beef Steak
(18, 34, 0.150), -- Potato
(18, 44, 0.060), -- Mushrooms
(18, 32, 0.020), -- Onion
(18, 62, 0.015), -- Butter
(18, 33, 0.008), -- Garlic
(18, 7, 0.003),  -- Salt
(18, 8, 0.003),  -- Black Pepper

-- 19. Chicken Teriyaki
(19, 10, 0.160), -- Chicken Breast
(19, 2, 0.120),  -- Rice
(19, 36, 0.040), -- Bell Pepper
(19, 37, 0.040), -- Broccoli
(19, 32, 0.020), -- Onion
(19, 81, 1.000), -- Soy Sauce
(19, 33, 0.006), -- Garlic
(19, 8, 0.002),  -- Black Pepper

-- 20. Vegetable Pasta
(20, 3, 0.130),  -- Pasta
(20, 30, 0.060), -- Tomato
(20, 36, 0.040), -- Bell Pepper
(20, 37, 0.040), -- Broccoli
(20, 42, 0.040), -- Zucchini
(20, 44, 0.040), -- Mushrooms
(20, 60, 0.040), -- Mozzarella
(20, 33, 0.006), -- Garlic
(20, 7, 0.003),  -- Salt


-- =========================================================
-- DESSERTS
-- =========================================================

-- 21. Tiramisu
(21, 1, 0.050),  -- Flour
(21, 56, 0.060), -- Cream
(21, 55, 0.030), -- Milk
(21, 6, 0.020),  -- Sugar
(21, 62, 0.010), -- Butter
(21, 8, 0.001),  -- Black Pepper

-- 22. Cheesecake
(22, 1, 0.050),  -- Flour
(22, 60, 0.100), -- Mozzarella
(22, 55, 0.030), -- Milk
(22, 6, 0.030),  -- Sugar
(22, 62, 0.015), -- Butter
(22, 53, 0.020), -- Strawberry

-- 23. Chocolate Brownie
(23, 1, 0.060),  -- Flour
(23, 6, 0.040),  -- Sugar
(23, 55, 0.030), -- Milk
(23, 62, 0.020), -- Butter
(23, 56, 0.020), -- Cream

-- 24. Apple Pie
(24, 1, 0.080),  -- Flour
(24, 45, 0.120), -- Apple
(24, 6, 0.030),  -- Sugar
(24, 62, 0.020), -- Butter
(24, 55, 0.020), -- Milk

-- 25. Panna Cotta
(25, 56, 0.100), -- Cream
(25, 55, 0.040), -- Milk
(25, 6, 0.025),  -- Sugar
(25, 53, 0.030), -- Strawberry
(25, 54, 0.020), -- Blueberry

-- 26. Ice Cream Sundae
(26, 56, 0.080), -- Cream
(26, 55, 0.040), -- Milk
(26, 6, 0.025),  -- Sugar
(26, 46, 0.050), -- Banana
(26, 53, 0.030), -- Strawberry
(26, 61, 0.015), -- Cheddar

-- 27. Chocolate Mousse
(27, 56, 0.080), -- Cream
(27, 55, 0.030), -- Milk
(27, 6, 0.025),  -- Sugar
(27, 62, 0.010), -- Butter
(27, 53, 0.020), -- Strawberry

-- 28. Creme Brulee
(28, 56, 0.100), -- Cream
(28, 55, 0.030), -- Milk
(28, 6, 0.035),  -- Sugar
(28, 62, 0.010), -- Butter

-- 29. Fruit Tart
(29, 1, 0.060),  -- Flour
(29, 45, 0.040), -- Apple
(29, 47, 0.030), -- Orange
(29, 53, 0.030), -- Strawberry
(29, 54, 0.020), -- Blueberry
(29, 6, 0.025),  -- Sugar
(29, 62, 0.015), -- Butter

-- 30. Banana Split
(30, 46, 0.150), -- Banana
(30, 56, 0.080), -- Cream
(30, 55, 0.030), -- Milk
(30, 6, 0.025),  -- Sugar
(30, 53, 0.030), -- Strawberry
(30, 54, 0.020) -- Blueberry
;
-- Negative scenarios to test the constraints


INSERT INTO ua_4778_manual_v2.basic_inventory_ingredients
    (basic_inventory_id, ingredient_id, quantity)
-- Positive scenarios
SELECT bi.basic_inventory_id,
       i.ingredient_id,
       (ROUND((RANDOM() * (3 - 0) + 0)::numeric, 3))
FROM ua_4778_manual_v2.basic_inventory bi
         JOIN ua_4778_manual_v2.ingredients i
              ON i.inventory_type_id = bi.inventory_type_id;
-- Negative scenarios to test the constraints
;

INSERT INTO ua_4778_manual_v2.ingredients_suppliers
    (ingredient_id, supplier_id)
-- Positive scenarios
VALUES

-- 1. Flour
(1, 5),
(1, 14),
(1, 19),
(1, 22),

-- 2. Rice
(2, 5),
(2, 6),
(2, 19),
(2, 22),

-- 3. Pasta
(3, 5),
(3, 6),
(3, 20),

-- 4. Buckwheat
(4, 5),
(4, 6),
(4, 22),

-- 5. Oatmeal
(5, 5),
(5, 14),
(5, 22),

-- 6. Sugar
(6, 5),
(6, 14),
(6, 22),
(6, 23),

-- 7. Salt
(7, 5),
(7, 6),
(7, 22),

-- 8. Black Pepper
(8, 6),
(8, 19),
(8, 20),

-- 9. Breadcrumbs
(9, 5),
(9, 14),
(9, 20),

-- 10. Chicken Breast
(10, 2),
(10, 12),
(10, 16),
(10, 23),

-- 11. Chicken Thigh
(11, 2),
(11, 12),
(11, 16),

-- 12. Chicken Wings
(12, 2),
(12, 12),
(12, 20),

-- 13. Chicken Drumsticks
(13, 2),
(13, 12),
(13, 16),

-- 14. Beef Tenderloin
(14, 2),
(14, 16),
(14, 20),
(14, 23),

-- 15. Beef Mince
(15, 2),
(15, 16),
(15, 20),

-- 16. Pork Tenderloin
(16, 2),
(16, 16),
(16, 20),

-- 17. Pork Ribs
(17, 2),
(17, 16),
(17, 23),

-- 18. Pork Mince
(18, 2),
(18, 16),
(18, 20),

-- 19. Turkey Breast
(19, 2),
(19, 12),
(19, 16),

-- 20. Bacon
(20, 2),
(20, 16),
(20, 19),
(20, 23),

-- 21. Beef Steak
(21, 2),
(21, 16),
(21, 20),
(21, 23),

-- 22. Salmon
(22, 3),
(22, 13),
(22, 19),
(22, 23),

-- 23. Tuna
(23, 3),
(23, 13),
(23, 19),

-- 24. Cod Fillet
(24, 3),
(24, 13),
(24, 20),

-- 25. Hake Fillet
(25, 3),
(25, 13),
(25, 23),

-- 26. Trout
(26, 3),
(26, 13),
(26, 16),

-- 27. Shrimp
(27, 3),
(27, 13),
(27, 19),
(27, 23),

-- 28. Mussels
(28, 3),
(28, 13),
(28, 23),

-- 29. Squid
(29, 3),
(29, 13),
(29, 19),

-- 30. Tomato
(30, 1),
(30, 11),
(30, 16),
(30, 21),

-- 31. Cucumber
(31, 1),
(31, 11),
(31, 16),
(31, 21),

-- 32. Onion
(32, 1),
(32, 11),
(32, 16),
(32, 22),

-- 33. Garlic
(33, 1),
(33, 11),
(33, 16),

-- 34. Potato
(34, 1),
(34, 11),
(34, 16),
(34, 22),

-- 35. Carrot
(35, 1),
(35, 11),
(35, 16),
(35, 21),

-- 36. Bell Pepper
(36, 1),
(36, 11),
(36, 16),
(36, 21),

-- 37. Broccoli
(37, 1),
(37, 11),
(37, 21),

-- 38. Cauliflower
(38, 1),
(38, 11),
(38, 21),

-- 39. Cabbage
(39, 1),
(39, 11),
(39, 16),
(39, 22),

-- 40. Spinach
(40, 1),
(40, 11),
(40, 21),

-- 41. Lettuce
(41, 1),
(41, 11),
(41, 21),

-- 42. Zucchini
(42, 1),
(42, 11),
(42, 16),

-- 43. Eggplant
(43, 1),
(43, 11),
(43, 21),

-- 44. Mushrooms
(44, 1),
(44, 11),
(44, 16),
(44, 22),

-- 45. Apple
(45, 1),
(45, 11),
(45, 16),
(45, 21),

-- 46. Banana
(46, 1),
(46, 11),
(46, 19),
(46, 23),

-- 47. Orange
(47, 1),
(47, 11),
(47, 19),
(47, 23),

-- 48. Lemon
(48, 1),
(48, 11),
(48, 19),
(48, 23),

-- 49. Lime
(49, 1),
(49, 19),
(49, 23),

-- 50. Pear
(50, 1),
(50, 11),
(50, 16),

-- 51. Pineapple
(51, 1),
(51, 19),
(51, 23),

-- 52. Mango
(52, 1),
(52, 19),
(52, 23),

-- 53. Strawberry
(53, 1),
(53, 11),
(53, 21),
(53, 23),

-- 54. Blueberry
(54, 1),
(54, 11),
(54, 21),
(54, 23),

-- 55. Milk
(55, 4),
(55, 15),
(55, 16),
(55, 23),

-- 56. Cream
(56, 4),
(56, 15),
(56, 20),

-- 57. Kefir
(57, 4),
(57, 15),
(57, 16),

-- 58. Yogurt
(58, 4),
(58, 15),
(58, 19),
(58, 23),

-- 59. Sour Cream
(59, 4),
(59, 15),
(59, 16),

-- 60. Mozzarella
(60, 4),
(60, 15),
(60, 19),
(60, 23),

-- 61. Cheddar
(61, 4),
(61, 15),
(61, 19),
(61, 23),

-- 62. Butter
(62, 4),
(62, 15),
(62, 16),
(62, 23),

-- 63. Frozen Peas
(63, 7),
(63, 17),
(63, 20),

-- 64. Frozen Corn
(64, 7),
(64, 17),
(64, 20),

-- 65. Frozen Spinach
(65, 7),
(65, 17),
(65, 23),

-- 66. Frozen Berries
(66, 7),
(66, 17),
(66, 21),
(66, 23),

-- 67. Frozen French Fries
(67, 7),
(67, 17),
(67, 20),

-- 68. Frozen Mixed Vegetables
(68, 7),
(68, 17),
(68, 20),
(68, 23),

-- 69. Frozen Chicken Nuggets
(69, 7),
(69, 17),
(69, 12),

-- 70. Frozen Dumplings
(70, 7),
(70, 17),
(70, 20),

-- 71. Still Water
(71, 8),
(71, 18),
(71, 22),
(71, 23),

-- 72. Sparkling Water
(72, 8),
(72, 18),
(72, 22),

-- 73. Orange Juice
(73, 8),
(73, 18),
(73, 19),
(73, 23),

-- 74. Apple Juice
(74, 8),
(74, 18),
(74, 19),

-- 75. Cola
(75, 8),
(75, 18),
(75, 23),

-- 76. Lemonade
(76, 8),
(76, 18),
(76, 23),

-- 77. Iced Tea
(77, 8),
(77, 18),
(77, 19),

-- 78. Ketchup
(78, 9),
(78, 6),
(78, 23),

-- 79. Mayonnaise
(79, 9),
(79, 6),
(79, 23),

-- 80. Mustard
(80, 9),
(80, 6),
(80, 19),

-- 81. Soy Sauce
(81, 9),
(81, 19),
(81, 23),

-- 82. Hot Sauce
(82, 9),
(82, 19),
(82, 23),

-- 83. Paper Cups
(83, 10),
(83, 20),
(83, 23),

-- 84. Food Containers
(84, 10),
(84, 20),
(84, 23),

-- 85. Paper Bags
(85, 10),
(85, 20),
(85, 23),

-- 86. Plastic Lids
(86, 10),
(86, 20),
(86, 23),

-- 87. Paper Napkins
(87, 10),
(87, 20),
(87, 23)
-- Negative scenarios to test the constraints
;

INSERT INTO ua_4778_manual_v2.basic_inventory_suppliers
    (basic_inventory_id, supplier_id)
-- Positive scenarios
VALUES

-- Location 1
(1, 5),
(1, 14),
(1, 22),
(2, 2),
(2, 12),
(2, 16),
(3, 3),
(3, 13),
(3, 23),
(4, 1),
(4, 11),
(4, 16),
(4, 21),
(5, 1),
(5, 11),
(5, 21),
(6, 4),
(6, 15),
(6, 23),
(7, 7),
(7, 17),
(7, 20),
(8, 8),
(8, 18),
(8, 23),
(9, 9),
(9, 19),
(9, 23),
(10, 10),
(10, 20),
(10, 23),

-- Location 2
(11, 5),
(11, 6),
(11, 22),
(12, 2),
(12, 12),
(12, 16),
(12, 23),
(13, 3),
(13, 13),
(13, 19),
(14, 1),
(14, 11),
(14, 16),
(15, 1),
(15, 11),
(15, 21),
(16, 4),
(16, 15),
(16, 16),
(17, 7),
(17, 17),
(17, 23),
(18, 8),
(18, 18),
(18, 22),
(19, 9),
(19, 6),
(19, 23),
(20, 10),
(20, 20),
(20, 23),

-- Location 3
(21, 5),
(21, 14),
(21, 19),
(21, 22),
(22, 2),
(22, 12),
(22, 20),
(23, 3),
(23, 13),
(23, 23),
(24, 1),
(24, 11),
(24, 21),
(25, 1),
(25, 11),
(25, 16),
(26, 4),
(26, 15),
(26, 19),
(26, 23),
(27, 7),
(27, 17),
(27, 20),
(28, 8),
(28, 18),
(28, 23),
(29, 9),
(29, 19),
(29, 22),
(30, 10),
(30, 20),
(30, 23),

-- Location 4
(31, 5),
(31, 6),
(31, 14),
(32, 2),
(32, 12),
(32, 16),
(33, 3),
(33, 13),
(33, 19),
(34, 1),
(34, 11),
(34, 21),
(35, 1),
(35, 11),
(35, 16),
(36, 4),
(36, 15),
(36, 23),
(37, 7),
(37, 17),
(37, 20),
(38, 8),
(38, 18),
(38, 22),
(39, 9),
(39, 6),
(39, 19),
(40, 10),
(40, 20),
(40, 23),

-- Location 5
(41, 5),
(41, 14),
(41, 22),
(42, 2),
(42, 12),
(42, 16),
(42, 23),
(43, 3),
(43, 13),
(43, 20),
(44, 1),
(44, 11),
(44, 16),
(44, 21),
(45, 1),
(45, 11),
(45, 21),
(46, 4),
(46, 15),
(46, 16),
(47, 7),
(47, 17),
(47, 23),
(48, 8),
(48, 18),
(48, 23),
(49, 9),
(49, 19),
(49, 23),
(50, 10),
(50, 20),
(50, 23),

-- Location 6
(51, 5),
(51, 6),
(51, 22),
(52, 2),
(52, 12),
(52, 20),
(53, 3),
(53, 13),
(53, 23),
(54, 1),
(54, 11),
(54, 16),
(55, 1),
(55, 11),
(55, 21),
(56, 4),
(56, 15),
(56, 19),
(56, 23),
(57, 7),
(57, 17),
(57, 20),
(58, 8),
(58, 18),
(58, 22),
(59, 9),
(59, 6),
(59, 23),
(60, 10),
(60, 20),
(60, 23),

-- Location 7
(61, 5),
(61, 14),
(61, 19),
(61, 22),
(62, 2),
(62, 12),
(62, 16),
(63, 3),
(63, 13),
(63, 19),
(63, 23),
(64, 1),
(64, 11),
(64, 16),
(64, 21),
(65, 1),
(65, 11),
(65, 21),
(66, 4),
(66, 15),
(66, 23),
(67, 7),
(67, 17),
(67, 20),
(68, 8),
(68, 18),
(68, 23),
(69, 9),
(69, 19),
(69, 22),
(70, 10),
(70, 20),
(70, 23),

-- Location 8
(71, 5),
(71, 6),
(71, 14),
(72, 2),
(72, 12),
(72, 16),
(72, 23),
(73, 3),
(73, 13),
(73, 20),
(74, 1),
(74, 11),
(74, 21),
(75, 1),
(75, 11),
(75, 16),
(76, 4),
(76, 15),
(76, 19),
(77, 7),
(77, 17),
(77, 23),
(78, 8),
(78, 18),
(78, 22),
(79, 9),
(79, 6),
(79, 23),
(80, 10),
(80, 20),
(80, 23),

-- Location 9
(81, 5),
(81, 14),
(81, 22),
(82, 2),
(82, 12),
(82, 16),
(83, 3),
(83, 13),
(83, 19),
(83, 23),
(84, 1),
(84, 11),
(84, 16),
(84, 21),
(85, 1),
(85, 11),
(85, 21),
(86, 4),
(86, 15),
(86, 16),
(86, 23),
(87, 7),
(87, 17),
(87, 20),
(88, 8),
(88, 18),
(88, 23),
(89, 9),
(89, 19),
(89, 22),
(90, 10),
(90, 20),
(90, 23),

-- Location 10
(91, 5),
(91, 6),
(91, 14),
(91, 22),
(92, 2),
(92, 12),
(92, 16),
(92, 23),
(93, 3),
(93, 13),
(93, 19),
(94, 1),
(94, 11),
(94, 16),
(94, 21),
(95, 1),
(95, 11),
(95, 21),
(96, 4),
(96, 15),
(96, 19),
(96, 23),
(97, 7),
(97, 17),
(97, 20),
(98, 8),
(98, 18),
(98, 22),
(98, 23),
(99, 9),
(99, 6),
(99, 19),
(99, 23),
(100, 10),
(100, 20),
(100, 23);
-- Negative scenarios to test the constraints
;
