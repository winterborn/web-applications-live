-- -------------------------------------------------------------
-- TablePlus 4.8.2(436)
--
-- https://tableplus.com/
--
-- Database: music_library
-- Generation Time: 2022-09-01 10:46:24.3820
-- -------------------------------------------------------------


DROP TABLE IF EXISTS "public"."albums";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS albums_id_seq1;

-- Table Definition
CREATE TABLE "public"."albums" (
    "id" int4 NOT NULL DEFAULT nextval('albums_id_seq1'::regclass),
    "title" text,
    "release_year" int4,
    "artist_id" int4,
    PRIMARY KEY ("id")
);

INSERT INTO "public"."albums" ("id", "title", "release_year", "artist_id") VALUES
(1, 'Doolittle', 1989, 1),
(2, 'Surfer Rosa', 1988, 1),
(3, 'Waterloo', 1974, 2),
(4, 'Super Trouper', 1980, 2),
(5, 'Bossanova', 1990, 1),
(6, 'Lover', 2019, 3),
(7, 'Folklore', 2020, 3),
(8, 'I Put a Spell on You', 1965, 4),
(9, 'Baltimore', 1978, 4),
(10, 'Here Comes the Sun', 1971, 4),
(11, 'Fodder on My Wings', 1982, 4),
(12, 'Ring Ring', 1973, 2),
(13, 'Neighborhoods', 2011, 5),
(14, 'Take off Your Pants and Jacket', 2001, 5),
(15, 'Toto IV', 1982, 6),
(16, 'OK Computer', 1997, 1),
(17, 'Lifeforms', 2022, 8),
(18, 'Wish', 1992, 7),
(19, 'Voyage', 2022, 2);
