CREATE TABLE `Entry` (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`concept`	TEXT NOT NULL,
	`entry`	TEXT NOT NULL,
	`date`	TEXT NOT NULL,
	`moodId`	INTEGER NOT NULL,
	FOREIGN KEY(`moodId`) REFERENCES `Mood`(`id`)
);

SELECT * FROM `Entry`;

DROP TABLE `Journal_Entries`;
DROP TABLE `Mood`;

CREATE TABLE `Mood` (
    `id`    INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `label`    TEXT NOT NULL
);

INSERT INTO `Entry` VALUES (null, "First Journal", "test..", '04/15/2021', 1);
INSERT INTO `Entry` VALUES (null, "Second Journal", "test..2", '04/15/2021', 2);
INSERT INTO `Entry` VALUES (null, "Third Journal", "test..3", '04/15/2021', 3);
INSERT INTO `Entry` VALUES (null, "Fourth Journal", "test..4", '04/15/2021', 4);

INSERT INTO `Mood` VALUES (null, "Elated");
INSERT INTO `Mood` VALUES (null, "Happy");
INSERT INTO `Mood` VALUES (null, "Cheerful");
INSERT INTO `Mood` VALUES (null, "Romantic");
INSERT INTO `Mood` VALUES (null, "Whimsical");
INSERT INTO `Mood` VALUES (null, "Lighthearted");
INSERT INTO `Mood` VALUES (null, "Hopeful");
INSERT INTO `Mood` VALUES (null, "Humorous");
INSERT INTO `Mood` VALUES (null, "Calm");
INSERT INTO `Mood` VALUES (null, "Melancholy");
INSERT INTO `Mood` VALUES (null, "Reflective");
INSERT INTO `Mood` VALUES (null, "Gloomy");
INSERT INTO `Mood` VALUES (null, "Angry");
INSERT INTO `Mood` VALUES (null, "Ominous");
INSERT INTO `Mood` VALUES (null, "Clinical Depression");
-- INSERT INTO `Mood` VALUES (null, "Depression");
