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

INSERT INTO `Journal_Entries` VALUES (null, '04/15/2021', "First Journal", "test..", "Elated");
INSERT INTO `Journal_Entries` VALUES (null, '04/15/2021', "Second Journal", "test..2", "Sad");
INSERT INTO `Journal_Entries` VALUES (null, '04/15/2021', "Third Journal", "test..3", "Happy");
INSERT INTO `Journal_Entries` VALUES (null, '04/15/2021', "Fourth Journal", "test..4", "Melancholy");

INSERT INTO `Moods` VALUES (null, "Elated");
INSERT INTO `Moods` VALUES (null, "Happy");
INSERT INTO `Moods` VALUES (null, "Cheerful");
INSERT INTO `Moods` VALUES (null, "Romantic");
INSERT INTO `Moods` VALUES (null, "Whimsical");
INSERT INTO `Moods` VALUES (null, "Lighthearted");
INSERT INTO `Moods` VALUES (null, "Hopeful");
INSERT INTO `Moods` VALUES (null, "Humorous");
INSERT INTO `Moods` VALUES (null, "Calm");
INSERT INTO `Moods` VALUES (null, "Melancholy");
INSERT INTO `Moods` VALUES (null, "Reflective");
INSERT INTO `Moods` VALUES (null, "Gloomy");
INSERT INTO `Moods` VALUES (null, "Angry");
INSERT INTO `Moods` VALUES (null, "Ominous");
INSERT INTO `Moods` VALUES (null, "Clinical Depression");
