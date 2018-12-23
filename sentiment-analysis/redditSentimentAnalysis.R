library(RColorBrewer)
library(wordcloud)
library(tm)
library(twitteR)
library(ROAuth)
library(plyr)
library(stringr)
library(base64enc)
library(SnowballC)
library(dplyr)
library(ggplot2)
library(qdap)
library(RCurl)
library(googleLanguageR)
library(googleAuthR)

# read in csv files
democrats = read.csv("subreddit_Democrats.csv", header = TRUE, stringsAsFactors = FALSE)
republicans = read.csv("subreddit_Republicans.csv", header = TRUE, stringsAsFactors = FALSE)
news = read.csv("subreddit_News.csv", header = TRUE, stringsAsFactors = FALSE)
politics = read.csv("subreddit_Politics.csv", header = TRUE, stringsAsFactors = FALSE)
trueReddit = read.csv("subreddit_TrueReddit.csv", header = TRUE, stringsAsFactors = FALSE)
usNews = read.csv("subreddit_USNews.csv", header = TRUE, stringsAsFactors = FALSE)
politicalDiscussion = read.csv("subreddit_PoliticalDiscussion.csv", header = TRUE, stringsAsFactors = FALSE)

# CLEANING THE TEXT
# extract the text
democrats <- democrats$Title
republicans <- republicans$Title
news <- news$Title
politics <- politics$Title
trueReddit <- trueReddit$Title
usNews <- usNews$Title
politicalDiscussion <- politicalDiscussion$Title

# convert emojis
democrats <- iconv(democrats, "latin1", "ASCII", sub="")
republicans <- iconv(republicans, "latin1", "ASCII", sub="")
news <- iconv(news, "latin1", "ASCII", sub="")
politics <- iconv(politics, "latin1", "ASCII", sub="")
trueReddit <- iconv(trueReddit, "latin1", "ASCII", sub="")
usNews <- iconv(usNews, "latin1", "ASCII", sub="")
politicalDiscussion <- iconv(politicalDiscussion, "latin1", "ASCII", sub="")

# converting all text to lowercase
democrats <- tolower(democrats)
republicans <- tolower(republicans)
news <- tolower(news)
politics <- tolower(politics)
trueReddit <- tolower(trueReddit)
usNews <- tolower(usNews)
politicalDiscussion <- tolower(politicalDiscussion)

# authenticate with Google language API services
gl_auth("googleRedditAPI.json")

# NLP SENTIMENT ANALYSIS
nlpDemocrats <- gl_nlp(democrats, Sys.sleep(3))
nlpRepublicans <- gl_nlp(republicans, Sys.sleep(3))
nlpNews <- gl_nlp(news, Sys.sleep(3))
nlpPolitics <- gl_nlp(politics, Sys.sleep(3))
nlpTrueReddit <- gl_nlp(trueReddit, Sys.sleep(3))
nlpUsNews <- gl_nlp(usNews, Sys.sleep(3))
nlpPoliticalDiscussion <- gl_nlp(politicalDiscussion, Sys.sleep(3))

# extract the document sentiment
nlpDemocrats_DocSent <- nlpDemocrats$documentSentiment
nlpRepublicans_DocSent <- nlpRepublicans$documentSentiment
nlpNews_DocSent <- nlpNews$documentSentiment
nlpPolitics_DocSent <- nlpPolitics$documentSentiment
nlpTrueReddit_DocSent <- nlpTrueReddit$documentSentiment
nlpUsNews_DocSent <- nlpUsNews$documentSentiment
nlpPoliticalDiscussion_DocSent <- nlpPoliticalDiscussion$documentSentiment

  # write to csv file
  #write.csv(nlpDemocrats_DocSent, file = 'nlpDemocrats_DocSent.csv')
  #write.csv(nlpRepublicans_DocSent, file = 'nlpRepublicans_DocSent.csv')
  #write.csv(nlpNews_DocSent, file = 'nlpNews_DocSent.csv')
  #write.csv(nlpPolitics_DocSent, file = 'nlpPolitics_DocSent.csv')
  #write.csv(nlpUsNews_DocSent, file = 'nlpUsNews_DocSent.csv')
  #write.csv(nlpPoliticalDiscussion_DocSent, file = 'nlpPoliticalDiscussion_DocSent.csv')
  
  
# convert text files to dataframes to prepare for merging
democrats_df <- as.data.frame(democrats)
republicans_df <- as.data.frame(republicans)
news_df <- as.data.frame(news)
politics_df <- as.data.frame(politics)
trueReddit_df <- as.data.frame(trueReddit)
usNews_df <- as.data.frame(usNews)
politicalDiscussion_df <- as.data.frame(politicalDiscussion)

# make ID columns in the document sentiment and dataframes 
democrats_df$ID <- seq.int(nrow(democrats_df))
republicans_df$ID <- seq.int(nrow(republicans_df))
news_df$ID <- seq.int(nrow(news_df))
politics_df$ID <- seq.int(nrow(politics_df))
trueReddit_df$ID <- seq.int(nrow(trueReddit_df))
usNews_df$ID <- seq.int(nrow(usNews_df))
politicalDiscussion_df$ID <- seq.int(nrow(politicalDiscussion_df))

nlpDemocrats_DocSent$ID <- seq.int(nrow(nlpDemocrats_DocSent))
nlpRepublicans_DocSent$ID <- seq.int(nrow(nlpRepublicans_DocSent)) 
nlpNews_DocSent$ID <- seq.int(nrow(nlpNews_DocSent))
nlpPolitics_DocSent$ID <- seq.int(nrow(nlpPolitics_DocSent))
nlpTrueReddit_DocSent$ID <- seq.int(nrow(nlpTrueReddit_DocSent))
nlpUsNews_DocSent$ID <- seq.int(nrow(nlpUsNews_DocSent))
nlpPoliticalDiscussion_DocSent$ID <- seq.int(nrow(nlpPoliticalDiscussion_DocSent))

head(democrats_df)
head(nlpDemocrats_DocSent)

# merge document sentiment and dataframe for each subreddit
democratScores <- merge(democrats_df, nlpDemocrats_DocSent, by = 'ID')
republicanScores <- merge(republicans_df, nlpRepublicans_DocSent, by = 'ID')
newsScores <- merge(news_df, nlpNews_DocSent, by = 'ID')
politicsScores <- merge(politics_df, nlpPolitics_DocSent, by = 'ID')
trueRedditScores <- merge(trueReddit_df, nlpTrueReddit_DocSent, by = 'ID')
usNewsScores <- merge(usNews_df, nlpUsNews_DocSent, by = 'ID')
politicalDiscussionScores <- merge(politicalDiscussion_df, nlpPoliticalDiscussion_DocSent, by = 'ID')

# write tweets with sentiment results to csv
#write.csv(democratScores, file = 'democratScores.csv')
#write.csv(republicanScores, file = 'republicanScores.csv')
#write.csv(newsScores, file = 'newsScores.csv')
#write.csv(politicsScores, file = 'politicsScores.csv')
#write.csv(trueRedditScores, file = 'trueRedditScores.csv')
#write.csv(usNewsScores, file = 'usNewsScores.csv')
#write.csv(politicalDiscussionScores, file = 'politicalDiscussionScores.csv')

#### ENTITY ANALYSIS
democratEntityAnalysis <- gl_nlp(democrats, nlp_type = c("analyzeEntitySentiment"), Sys.sleep(3))
str(democratEntityAnalysis)

democratEntityAnalysis <- gl_nlp(democrats, nlp_type = c("analyzeEntities"), Sys.sleep(3))
democratEntities <- democratEntityAnalysis$entities
str(democratEntities)
head(democratEntities)

democratEntities[1:50][2]


#write dataframes to csv for python analysis
  #write.csv(democrats_df, file = 'democrats_df.csv')
  #write.csv(republicans_df, file = 'republicans_df.csv')
  #write.csv(news_df, file = 'news_df.csv')
  #write.csv(politics_df, file = 'politics_df.csv')
  #write.csv(trueReddit_df, file = 'trueReddit_df.csv')
  #write.csv(usNews_df, file = 'usNews_df.csv')
  #write.csv(politicalDiscussion_df, file = 'politicalDiscussion_df.csv')


