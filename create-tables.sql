CREATE TABLE "sphere" (
	"name"	TEXT,
	"rating"	INTEGER,
	CHECK(rating IN (-1, 0, 1)),
	PRIMARY KEY("name")
);

CREATE TABLE "event" (
	"id"	INTEGER,
	"sphere_id"	TEXT,
	"date"	TEXT NOT NULL,
	"name"	TEXT,
	"description"	TEXT,
	FOREIGN KEY("sphere_id") REFERENCES "sphere"("name"),
	PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE "character" (
	"id"	INTEGER,
	"first_name"	TEXT,
	"last_name"	TEXT,
	"alias"	TEXT,
	"email"	TEXT,
	"phone"	TEXT,
	"sphere_id"	TEXT,
	"employer"	TEXT,
	"occupation"	TEXT,
	"location"	TEXT,
	FOREIGN KEY("sphere_id") REFERENCES "sphere"("name"),
	PRIMARY KEY("id" AUTOINCREMENT)
)

CREATE TABLE "impression" (
	"id"	INTEGER,
	"event_id"	INTEGER,
	"character_id"	INTEGER,
	"content"	TEXT NOT NULL,
	"date_recorded"	TEXT NOT NULL,
	"rating"	INTEGER,
	CHECK(rating >= -5 AND rating <= 5),
	FOREIGN KEY("event_id") REFERENCES "event"("id"),
	FOREIGN KEY("character_id") REFERENCES "character"("id"),
	PRIMARY KEY("id")
);

CREATE TABLE "character_to_event" (
	"character_id"	INTEGER NOT NULL,
	"event_id"	INTEGER NOT NULL,
	FOREIGN KEY("character_id") REFERENCES "character"("id"),
	FOREIGN KEY("event_id") REFERENCES "event"("id"),
	PRIMARY KEY("event_id","character_id")
);