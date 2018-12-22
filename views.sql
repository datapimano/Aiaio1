------------------- CREATE VIEWS -----------------
#Subreddits scraped: Politics, Political Discussion, News, Republicans, Democrats, TruePolitics, USNews

#Displays all titles and their scores
CREATE VIEW all_Scores AS
SELECT title, sentiment_score, magnitude
FROM subreddit_Politics
UNION ALL
SELECT title, sentiment_score, magnitude
FROM subreddit_PoliticalDiscussion
UNION ALL
SELECT title, sentiment_score, magnitude
FROM subreddit_News
UNION ALL
SELECT title, sentiment_score, magnitude
FROM subreddit_Republicans
UNION ALL
SELECT title, sentiment_score, magnitude
FROM subreddit_Democrats
UNION ALL
SELECT title, sentiment_score, magnitude
FROM subreddit_TruePolitics
UNION ALL
SELECT title, sentiment_score, magnitude
FROM subreddit_USNews;

#Displays all titles and their scores ordered from lowest sentiment score to highest
CREATE VIEW scores_Ordered_ASC AS
SELECT title, sentiment_score, magnitude
FROM all_Scores
ORDER BY sentiment_score;

#Displays all titles and their scores ordered from highest sentiment score to lowest
CREATE VIEW scores_Ordered_DESC AS
SELECT title, sentiment_score, magnitude
FROM all_Scores
ORDER BY sentiment_score DESC;

#Displays score with their tables
CREATE VIEW all_Scores_with_Table AS
SELECT 'subreddit_Politics', title, sentiment_score, magnitude
FROM subreddit_Politics
UNION ALL
SELECT 'subreddit_PoliticalDiscussion', title, sentiment_score, magnitude
FROM subreddit_PoliticalDiscussion
UNION ALL
SELECT 'subreddit_News', title, sentiment_score, magnitude
FROM subreddit_News
UNION ALL
SELECT 'subreddit_Republicans', title, sentiment_score, magnitude
FROM subreddit_Republicans
UNION ALL
SELECT 'subreddit_Democrats', title, sentiment_score, magnitude
FROM subreddit_Democrats
UNION ALL
SELECT 'subreddit_TruePolitics', title, sentiment_score, magnitude
FROM subreddit_TruePolitics
UNION ALL
SELECT 'subreddit_USNews', title, sentiment_score, magnitude
FROM subreddit_USNews;

#Displays aggregate scores of subreddits
CREATE VIEW total_sentiment_by_subreddit AS
SELECT 'subreddit_Politics' AS 'Subreddits', SUM(sentiment_score) AS 'Sentiment Score'
FROM subreddit_Politics
UNION
SELECT 'subreddit_PoliticalDiscussion', SUM(sentiment_score)
FROM subreddit_PoliticalDiscussion
UNION
SELECT 'subreddit_News', SUM(sentiment_score)
FROM subreddit_News
UNION
SELECT 'subreddit_Republicans', SUM(sentiment_score)
FROM subreddit_Republicans
UNION
SELECT 'subreddit_Democrats', SUM(sentiment_score)
FROM subreddit_Democrats
UNION
SELECT 'subreddit_TruePolitics', SUM(sentiment_score)
FROM subreddit_TruePolitics
UNION
SELECT 'subreddit_USNews', SUM(sentiment_score)
FROM subreddit_USNews;

#Displays aggregate magnitude scores of subreddits
CREATE VIEW total_magnitude_by_subreddit AS
SELECT 'subreddit_Politics' AS 'Subreddits', SUM(magnitude) AS 'Magnitude'
FROM subreddit_Politics
UNION
SELECT 'subreddit_PoliticalDiscussion', SUM(magnitude)
FROM subreddit_PoliticalDiscussion
UNION
SELECT 'subreddit_News', SUM(magnitude)
FROM subreddit_News
UNION
SELECT 'subreddit_Republicans', SUM(magnitude)
FROM subreddit_Republicans
UNION
SELECT 'subreddit_Democrats', SUM(magnitude)
FROM subreddit_Democrats
UNION
SELECT 'subreddit_TruePolitics', SUM(magnitude)
FROM subreddit_TruePolitics
UNION
SELECT 'subreddit_USNews', SUM(magnitude)
FROM subreddit_USNews;

#Displays post impact
CREATE VIEW post_impact AS
SELECT title, sentiment_score, magnitude, sentiment_score * magnitude AS 'impact'
FROM all_Scores;

#Displays average impact of posts within subreddit
CREATE VIEW subreddit_average_impact AS
SELECT 'subreddit_Politics' AS 'Subreddits', AVG(magnitude * sentiment_score) AS 'Impact'
FROM subreddit_Politics
UNION
SELECT 'subreddit_PoliticalDiscussion', SUM(magnitude * sentiment_score)
FROM subreddit_PoliticalDiscussion
UNION
SELECT 'subreddit_News', SUM(magnitude * sentiment_score)
FROM subreddit_News
UNION
SELECT 'subreddit_Republicans', SUM(magnitude * sentiment_score)
FROM subreddit_Republicans
UNION
SELECT 'subreddit_Democrats', SUM(magnitude * sentiment_score)
FROM subreddit_Democrats
UNION
SELECT 'subreddit_TruePolitics', SUM(magnitude * sentiment_score)
FROM subreddit_TruePolitics
UNION
SELECT 'subreddit_USNews', SUM(magnitude * sentiment_score)
FROM subreddit_USNews;
