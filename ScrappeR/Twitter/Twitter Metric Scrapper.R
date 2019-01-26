#Scraping counts of Tweet,Followers,Following,Likes,Location,Listed

install.packages(c("readxl", "twitteR"))

library('readxl')
library('twitteR')




# Change the next four lines based on your own consumer_key, consume_secret, access_token, and access_secret. 
consumer_key <- "WdwupK3sVu1bxNO2JJMqQKUXl"
consumer_secret <- "kw1LSuqZzkqmEtyGt7AUgYFm6qqhu4mmqg8WzotdIkpDDdBqGn"
access_token <- "1008957653102366725-y9qt09LxWRLsqfLB37dIUAjBIl7J00"
access_secret <- "WTRHTN7xZOJNbqaq0mcl7P1G7jJF8kG7CQZPaFshVq7NG"
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)


#Read Excel File

df <-  read_excel(file.choose(), sheet = 1)



#Specifying the url for desired website to be scraped

Data <- data.frame()

for (i in 1:length(df$`Twitter Handle Name`)) {
  temp <- getUser(df$`Twitter Handle Name`[i])
  Tweets <- temp$statusesCount
  Followers <- temp$followersCount
  Following <- temp$friendsCount
  Likes <- temp$favoritesCount
  Location <- temp$location
  Listed <- temp$listedCount
  y <- data.frame(Brands=df$Brands[i],Tweets,Following,Followers,Likes,Location,Listed)
  Data <- rbind.data.frame(Data,y)
}
write.csv(Data, "Twitter Metrics.csv")
