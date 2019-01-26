#load the library
library(XML)
library(readxl)

#Read the Excel File
df <- read_excel(file.choose(), sheet = 1)

#Create a Data frame the Data
Data <- data.frame()

for (i in 1:length(df$`Facebook Websites`)) {
  url <- df$`Facebook Websites`[i]
  webpage <- readLines(url)
  
  #Algorithm to scrape the Follower
  location <- grep('src=\"https://static.xx.fbcdn.net/rsrc.php/v3/y5/r/dsGlZIZMa30.png\" alt=\"Highlights info row image\" /></div><div class=\"_4bl9\"><div>', webpage)
  begin <- gregexpr('src=\"https://static.xx.fbcdn.net/rsrc.php/v3/y5/r/dsGlZIZMa30.png\" alt=\"Highlights info row image\" /></div><div class=\"_4bl9\"><div>', webpage[location])
  end <- gregexpr('\\xe0\\xb2\\x9c\\xe0\\xb2\\xa8\\xe0\\xb2\\xb0\\xe0\\xb3\\x81 \\xe0\\xb2\\x87\\xe0\\xb2\\xa6\\xe0\\xb2\\xa8\\xe0\\xb3\\x8d\\xe0\\xb2\\xa8\\xe0\\xb3\\x81 \\xe0\\xb2\\x85\\xe0\\xb2\\xa8\\xe0\\xb3\\x81\\xe0\\xb2\\xb8\\xe0\\xb2\\xb0\\xe0\\xb2\\xbf\\xe0\\xb2\\xb8\\xe0\\xb3\\x81\\xe0\\xb2\\xa4\\xe0\\xb3\\x8d\\xe0\\xb2\\xa4\\xe0\\xb2\\xbf\\xe0\\xb2\\xa6\\xe0\\xb3\\x8d\\xe0\\xb2\\xa6\\xe0\\xb2\\xbe\\xe0\\xb2\\xb0\\xe0\\xb3\\x86</div></div></div></div></div><div class=\"_4-u2 _u9q _3xaf _4-u8\"><div class=\"_4-u3 _5dwa _5dwb _g3i\"><span class=\"_38my\">', webpage[location])
  begin <- begin[[1]][1]+131
  end <- end[[1]]-2
  
  followers <- substring(webpage[location], begin, end)
  y <- data.frame(Brands=df$Brands[i],followers)
  Data <- rbind.data.frame(Data,y)
  }
write.csv(Data, "Facebook Metrics.csv")
