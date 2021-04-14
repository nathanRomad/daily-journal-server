CREATE TABLE `Journal_Entries` (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`date`	TEXT NOT NULL,
	`topic`	TEXT NOT NULL,
	`journalEntry`	TEXT NOT NULL,
	`mood`	TEXT NOT NULL
);

CREATE TABLE `Moods` (
    `id`    INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `mood`    TEXT NOT NULL
);