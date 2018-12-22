import praw
import csv

r = praw.Reddit('bot1')

subreddit = r.subreddit('PoliticalDiscussion')

with open('subreddit_PoliticalDiscussion.csv', 'w') as csv_file:
    writer = csv.writer(csv_file)

    for submission in subreddit.hot(limit=50):
        Author = submission.author
        Ups = submission.ups
        Downs = submission.downs
        Title = submission.title
        Score = submission.score
        Url = submission.url
        print("Title: ", submission.title)
        print("Score: ", submission.score)
        print("Author: ", submission.author)
        print("Downs: ", submission.downs)
        print("Ups: ", submission.ups)
        print("Url: ", submission.url)
        print("---------------------------------\n")

        writer.writerow([Title, Score, Author, Downs, Ups, Url])
    
