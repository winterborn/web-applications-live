-- -------------------------------------------------------------
-- TablePlus 4.8.2(436)
--
-- https://tableplus.com/
--
-- Database: music_library
-- Generation Time: 2022-09-01 10:47:01.4650
-- -------------------------------------------------------------


DROP TABLE IF EXISTS "public"."artists";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS artists_id_seq1;

-- Table Definition
CREATE TABLE "public"."artists" (
    "id" int4 NOT NULL DEFAULT nextval('artists_id_seq1'::regclass),
    "name" text,
    "genre" text,
    PRIMARY KEY ("id")
);

INSERT INTO "public"."artists" ("id", "name", "genre") VALUES
(1, 'Pixies', 'Alternative'),
(2, 'ABBA', 'Pop'),
(3, 'Taylor Swift', 'Pop'),
(4, 'Nina Simone', 'Pop'),
(5, 'Blink-182', 'Alternative'),
(6, 'Toto', 'Alternative'),
(7, 'The Cure', 'Alternative'),
(8, 'Angels & Airwaves', 'Alternative'),
(9, 'Wild Nothing', 'Indie'),
(10, '+44', 'Alternative'),
(11, 'Box Car Racer', 'Post-Hardcore');
