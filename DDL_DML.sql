##SQL to create database, tables, and import csv files into the tables

CREATE DATABASE redditproject;

USE redditproject;

#Subreddits scraped: Politics, Political Discussion, News, Republicans, Democrats, TruePolitics, USNews

------------------ CREATE TABLES AND LOAD CSVS ----------------------


## DONE
CREATE TABLE subreddit_Politics(
	title VARCHAR(255),
	score INT,
	author VARCHAR(255),
	down_votes INT,
	up_votes INT,
	url VARCHAR(255)
);

LOAD DATA INFILE '/var/lib/mysql-files/subreddit_Politics.csv'
INTO TABLE subreddit_Politics
FIELDS TERMINATED BY ','
ENCLOSED BY '\"'
IGNORE 1 LINES;

TRUNCATE TABLE subreddit_Politics;

## DONE
CREATE TABLE subreddit_PoliticalDiscussion(
	title VARCHAR(255),
	score INT,
	author VARCHAR(255),
	down_votes INT,
	up_votes INT,
	url VARCHAR(255)
);

LOAD DATA INFILE '/var/lib/mysql-files/subreddit_PoliticalDiscussion.csv'
INTO TABLE subreddit_PoliticalDiscussion
FIELDS TERMINATED BY ','
ENCLOSED BY '\"'
IGNORE 1 LINES;

TRUNCATE TABLE subreddit_PoliticalDiscussion;

## DONE
CREATE TABLE subreddit_News(
	title VARCHAR(255),
	score INT,
	author VARCHAR(255),
	down_votes INT,
	up_votes INT,
	url VARCHAR(255)
);

LOAD DATA INFILE '/var/lib/mysql-files/subreddit_News.csv'
INTO TABLE subreddit_News
FIELDS TERMINATED BY ','
ENCLOSED BY '\"'
IGNORE 1 LINES;

TRUNCATE TABLE subreddit_News;

## DONE
CREATE TABLE subreddit_Republicans(
	title VARCHAR(255),
	score INT,
	author VARCHAR(255),
	down_votes INT,
	up_votes INT,
	url VARCHAR(255)
);

LOAD DATA INFILE '/var/lib/mysql-files/subreddit_Republicans.csv'
INTO TABLE subreddit_Republicans
FIELDS TERMINATED BY ','
ENCLOSED BY '\"'
IGNORE 1 LINES;

TRUNCATE TABLE subreddit_Republicans;

## DONE
CREATE TABLE subreddit_Democrats(
	title VARCHAR(255),
	score INT,
	author VARCHAR(255),
	down_votes INT,
	up_votes INT,
	url VARCHAR(255)
);

LOAD DATA INFILE '/var/lib/mysql-files/subreddit_Democrats.csv'
INTO TABLE subreddit_Democrats
FIELDS TERMINATED BY ','
ENCLOSED BY '\"'
IGNORE 1 LINES;

TRUNCATE TABLE subreddit_Democrats;

## DONE
CREATE TABLE subreddit_TruePolitics(
	title VARCHAR(255),
	score INT,
	author VARCHAR(255),
	down_votes INT,
	up_votes INT,
	url VARCHAR(255)
);

LOAD DATA INFILE '/var/lib/mysql-files/subreddit_TrueReddit.csv'
INTO TABLE subreddit_TruePolitics
FIELDS TERMINATED BY ','
ENCLOSED BY '\"'
IGNORE 1 LINES;

TRUNCATE TABLE subreddit_TruePolitics;

## DONE
CREATE TABLE subreddit_USNews(
	title VARCHAR(255),
	score INT,
	author VARCHAR(255),
	down_votes INT,
	up_votes INT,
	url VARCHAR(255)
);

LOAD DATA INFILE '/var/lib/mysql-files/subreddit_USNews.csv'
INTO TABLE subreddit_USNews
FIELDS TERMINATED BY ','
ENCLOSED BY '\"'
IGNORE 1 LINES;

TRUNCATE TABLE subreddit_USNews;

-------- UPDATE TABLES TO ADD COLUMNS FOR SENTIMENT ANALYSIS ------------
#Subreddits scraped: Politics, Political Discussion, News, Republicans, Democrats, TruePolitics, USNews

ALTER TABLE subreddit_Politics ADD COLUMN magnitude DECIMAL(4,2);
ALTER TABLE subreddit_Politics ADD COLUMN sentiment_score DECIMAL(4,2);

ALTER TABLE subreddit_PoliticalDiscussion ADD COLUMN magnitude DECIMAL(4,2);
ALTER TABLE subreddit_PoliticalDiscussion ADD COLUMN sentiment_score DECIMAL(4,2);

ALTER TABLE subreddit_News ADD COLUMN magnitude DECIMAL(4,2);
ALTER TABLE subreddit_News ADD COLUMN sentiment_score DECIMAL(4,2);

ALTER TABLE subreddit_Republicans ADD COLUMN magnitude DECIMAL(4,2);
ALTER TABLE subreddit_Republicans ADD COLUMN sentiment_score DECIMAL(4,2);

ALTER TABLE subreddit_Democrats ADD COLUMN magnitude DECIMAL(4,2);
ALTER TABLE subreddit_Democrats ADD COLUMN sentiment_score DECIMAL(4,2);

ALTER TABLE subreddit_TruePolitics ADD COLUMN magnitude DECIMAL(4,2);
ALTER TABLE subreddit_TruePolitics ADD COLUMN sentiment_score DECIMAL(4,2);

ALTER TABLE subreddit_USNews ADD COLUMN magnitude DECIMAL(4,2);
ALTER TABLE subreddit_USNews ADD COLUMN sentiment_score DECIMAL(4,2);

------------- CREATE TEMP TABLES FOR SENTIMENT ANALYSIS --------------

## DONE
CREATE TABLE temp_sentiment_Politics(
	id INT,
	title VARCHAR(255),
	magnitude DECIMAL(4,2),
	score DECIMAL(4,2),
	url VARCHAR(255)
);

LOAD DATA INFILE '/var/lib/mysql-files/politicsScores.csv'
INTO TABLE temp_sentiment_Politics
FIELDS TERMINATED BY ','
ENCLOSED BY '\"'
IGNORE 1 LINES;

## DONE
CREATE TABLE temp_sentiment_PoliticalDiscussion(
	id INT,
	title VARCHAR(255),
	magnitude DECIMAL(4,2),
	score DECIMAL(4,2),
	url VARCHAR(255)
);

LOAD DATA INFILE '/var/lib/mysql-files/politicalDiscussionScores.csv'
INTO TABLE temp_sentiment_PoliticalDiscussion
FIELDS TERMINATED BY ','
ENCLOSED BY '\"'
IGNORE 1 LINES;

## DONE
CREATE TABLE temp_sentiment_News(
	id INT,
	title VARCHAR(255),
	magnitude DECIMAL(4,2),
	score DECIMAL(4,2),
	url VARCHAR(255)
);

LOAD DATA INFILE '/var/lib/mysql-files/newsScores.csv'
INTO TABLE temp_sentiment_News
FIELDS TERMINATED BY ','
ENCLOSED BY '\"'
IGNORE 1 LINES;

## DONE
CREATE TABLE temp_sentiment_Republicans(
	id INT,
	title VARCHAR(255),
	magnitude DECIMAL(4,2),
	score DECIMAL(4,2),
	url VARCHAR(255)
);

LOAD DATA INFILE '/var/lib/mysql-files/republicanScores.csv'
INTO TABLE temp_sentiment_Republicans
FIELDS TERMINATED BY ','
ENCLOSED BY '\"'
IGNORE 1 LINES;

## DONE
CREATE TABLE temp_sentiment_Democrat(
	id INT,
	title VARCHAR(255),
	magnitude DECIMAL(4,2),
	score DECIMAL(4,2),
	url VARCHAR(255)
);

LOAD DATA INFILE '/var/lib/mysql-files/democratScores.csv'
INTO TABLE temp_sentiment_Democrat
FIELDS TERMINATED BY ','
ENCLOSED BY '\"'
IGNORE 1 LINES;

## DONE
CREATE TABLE temp_sentiment_TruePolitics(
	id INT,
	title VARCHAR(255),
	magnitude DECIMAL(4,2),
	score DECIMAL(4,2),
	url VARCHAR(255)
);

LOAD DATA INFILE '/var/lib/mysql-files/truePoliticsScores.csv'
INTO TABLE temp_sentiment_TruePolitics
FIELDS TERMINATED BY ','
ENCLOSED BY '\"'
IGNORE 1 LINES;

## DONE
CREATE TABLE temp_sentiment_USNews(
	id INT,
	title VARCHAR(255),
	magnitude DECIMAL(4,2),
	score DECIMAL(4,2),
	url VARCHAR(255)
);

LOAD DATA INFILE '/var/lib/mysql-files/usNewsScores.csv'
INTO TABLE temp_sentiment_USNews
FIELDS TERMINATED BY ','
ENCLOSED BY '\"'
IGNORE 1 LINES;


---------------------- ADD DATA FROM SENTIMENT CSV ----------------------
#Subreddits scraped: Politics, Political Discussion, News, Republicans, Democrats, TruePolitics, USNews

UPDATE subreddit_Politics SR
	JOIN temp_sentiment_Politics TEMP
	ON SR.url = TEMP.url
	SET SR.magnitude = TEMP.magnitude,
	SR.sentiment_score = TEMP.score
	WHERE SR.url = TEMP.url;

UPDATE subreddit_PoliticalDiscussion SR
	JOIN temp_sentiment_PoliticalDiscussion TEMP
	ON SR.url = TEMP.url
	SET SR.magnitude = TEMP.magnitude,
	SR.sentiment_score = TEMP.score
	WHERE SR.url = TEMP.url;

UPDATE subreddit_News SR
	JOIN temp_sentiment_News TEMP
	ON SR.url = TEMP.url
	SET SR.magnitude = TEMP.magnitude,
	SR.sentiment_score = TEMP.score
	WHERE SR.url = TEMP.url;

UPDATE subreddit_Republicans SR
	JOIN temp_sentiment_Republicans TEMP
	ON SR.url = TEMP.url
	SET SR.magnitude = TEMP.magnitude,
	SR.sentiment_score = TEMP.score
	WHERE SR.url = TEMP.url;

UPDATE subreddit_Democrats SR
	JOIN temp_sentiment_Democrat TEMP
	ON SR.url = TEMP.url
	SET SR.magnitude = TEMP.magnitude,
	SR.sentiment_score = TEMP.score
	WHERE SR.url = TEMP.url;

UPDATE subreddit_TruePolitics SR
	JOIN temp_sentiment_TruePolitics TEMP
	ON SR.url = TEMP.url
	SET SR.magnitude = TEMP.magnitude,
	SR.sentiment_score = TEMP.score
	WHERE SR.url = TEMP.url;

UPDATE subreddit_USNews SR
	JOIN temp_sentiment_USNews TEMP
	ON SR.url = TEMP.url
	SET SR.magnitude = TEMP.magnitude,
	SR.sentiment_score = TEMP.score
	WHERE SR.url = TEMP.url;

---------------------- DROP PRIMARY KEYS ---------------------------
#Subreddits scraped: Politics, Political Discussion, News, Republicans, Democrats, TruePolitics, USNews

ALTER TABLE subreddit_Politics DROP PRIMARY KEY;
ALTER TABLE subreddit_PoliticalDiscussion DROP PRIMARY KEY;
ALTER TABLE subreddit_News DROP PRIMARY KEY;
ALTER TABLE subreddit_Republicans DROP PRIMARY KEY;
ALTER TABLE subreddit_Democrats DROP PRIMARY KEY;
ALTER TABLE subreddit_TruePolitics DROP PRIMARY KEY;
ALTER TABLE subreddit_USNews DROP PRIMARY KEY;

ALTER TABLE temp_sentiment_Politics DROP PRIMARY KEY;
ALTER TABLE temp_sentiment_PoliticalDiscussion DROP PRIMARY KEY;
ALTER TABLE temp_sentiment_News DROP PRIMARY KEY;
ALTER TABLE temp_sentiment_Republicans DROP PRIMARY KEY;
ALTER TABLE temp_sentiment_Democrat DROP PRIMARY KEY;
ALTER TABLE temp_sentiment_TruePolitics DROP PRIMARY KEY;
ALTER TABLE temp_sentiment_USNews DROP PRIMARY KEY;

-------------------- TRUNCATE COMMANDS -------------------
#Subreddits scraped: Politics, Political Discussion, News, Republicans, Democrats, TruePolitics, USNews

TRUNCATE TABLE subreddit_Politics;
TRUNCATE TABLE subreddit_PoliticalDiscussion;
TRUNCATE TABLE subreddit_News;
TRUNCATE TABLE subreddit_Republicans;
TRUNCATE TABLE subreddit_Democrats;
TRUNCATE TABLE subreddit_TruePolitics;
TRUNCATE TABLE subreddit_USNews;

TRUNCATE TABLE temp_sentiment_Politics;
TRUNCATE TABLE temp_sentiment_PoliticalDiscussion;
TRUNCATE TABLE temp_sentiment_News;
TRUNCATE TABLE temp_sentiment_Republicans;
TRUNCATE TABLE temp_sentiment_Democrat;
TRUNCATE TABLE temp_sentiment_TruePolitics;
TRUNCATE TABLE temp_sentiment_USNews;
