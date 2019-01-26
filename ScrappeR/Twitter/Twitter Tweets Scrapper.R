#Scraping TWeets

library(twitteR)

# Change the next four lines based on your own consumer_key, consume_secret, access_token, and access_secret. 
consumer_key <- "api"
consumer_secret <- "api"
access_token <- "api"
access_secret <- "api"
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)

aprilla <- userTimeline("@ApriliaIndia", n = 315, excludeReplies = T,includeRts = F)

Uniquepost <- length(aprilla)

aprilla <- userTimeline("@ApriliaIndia", n = 315, excludeReplies = F,includeRts = T)

Comments <- length(aprilla) - Uniquepost

Engagement <- 
  
  df <- twListToDF(aprilla)
View(df[,c(1,12,3)])


tw <- searchTwitter('from:ApriliaIndia', n=100000, since = '2019-01-15',until = '2019-01-22')
d <- twListToDF(tw)
