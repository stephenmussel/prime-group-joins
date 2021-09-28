CREATE TABLE "person" (
	"id" SERIAL PRIMARY KEY,
	"first_name" VARCHAR(25)
);

INSERT INTO "person" ("first_name")
VALUES
	('Chris'), 
	('Jess'), 
	('Ahmed'), 
	('Danny'), 
	('Ian'), 
	('Anwar'), 
	('Phaydara');
	
CREATE TABLE "hobby" (
	"id" SERIAL PRIMARY KEY,
	"description" VARCHAR(100)
);

INSERT INTO "hobby" ("description")
VALUES
	('rock climbing'), 
	('soccer'), 
	('sewing'),
	('music');

-- junction table; example is like review of a product 
CREATE TABLE "person_hobby" (
	"id" SERIAL PRIMARY KEY, -- optional on junction tables
	"person_id" INT REFERENCES "person", -- FK
	"hobby_id" INT REFERENCES "hobby", -- FK
	"skill" INT -- optional to have additional column(s)
);

INSERT INTO "person_hobby" ("person_id", "hobby_id", "skill")
VALUES
	(1, 1, 3), 
	(1, 2, 1), 
	(2, 3, 5),
	(2, 2, 1),
	(3, 2, 5),
	(1, 1, 1),
	(4, 2, 4),
	(4, 1, 2),
	(5, 2, 3),
	(5, 1, 3);

-- 'as' is an Alias (e.g. "p"."first_name")
-- shows first_name, description, skill
SELECT "p"."first_name", "h"."description", "ph"."skill" 
FROM "person" as "p"
JOIN "person_hobby" as "ph" ON "p"."id" = "ph"."person_id"
JOIN "hobby" as "h" ON "h"."id" = "ph"."hobby_id";

-- shows AVG skill level of person w/hobby
SELECT "h"."description", AVG("ph"."skill")
FROM "person" as "p"
JOIN "person_hobby" as "ph" ON "p"."id" = "ph"."person_id"
JOIN "hobby" as "h" ON "h"."id" = "ph"."hobby_id"
GROUP BY "h"."description";

-- shows AVG skill level of person w/hobby and how may have that hobby
-- AVG, COUNT, MIN, MAX, SUM are aggregate functions
-- example: "h"."description" has to be in GROUP BY
SELECT "h"."description", AVG("ph"."skill"), COUNT("p"."id")
FROM "person" as "p"
JOIN "person_hobby" as "ph" ON "p"."id" = "ph"."person_id"
JOIN "hobby" as "h" ON "h"."id" = "ph"."hobby_id"
GROUP BY "h"."description" LIMIT 100;

-- GROUP BY is what you want to display one-time

