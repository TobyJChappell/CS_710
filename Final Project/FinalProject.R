library(waffle)
library(magrittr)
library(hrbrthemes)
library(ggplot2)
library(dplyr)
library(tidyr)
library(tidyquant)

# DISNEY
disney <- read.csv(file = 'disney_plus_shows.csv')

disney$date_added <- as.Date(disney$added_at,"%B %d, %Y")
disney <- disney[!is.na(disney$date_added),]
disney$date_released <- as.Date(disney$released_at,"%d %b %Y")
disney <- disney[!is.na(disney$date_released),]
disney$imdb_score <- as.numeric(disney$imdb_rating)
disney <- disney[!is.na(disney$imdb_score),]

ggplot(disney,aes(x=imdb_score)) + geom_histogram()

df <- separate(data = disney, col = genre, into = c("genre_1"), sep = ",")
df <- df[!(df$genre_1=="N/A"|df$genre_1=="History"|df$genre_1=="Music"|df$genre_1=="Musical"|df$genre_1=="Reality-TV"|df$genre_1=="Short"),]
ggplot(df,aes(x=date_released,y=imdb_score,color=genre_1)) + 
  geom_point() +
  geom_smooth(method = "loess", se = FALSE, color = "#111E4F") +
  theme_classic() +
  scale_color_brewer()

# NETFLIX
netflix <- read.csv(file = 'netflix_titles.csv')
ggplot(netflix,aes(x=imdb_score))+geom_histogram()



# BOTH
streaming <- read.csv(file = 'streaming_platforms.csv')
streaming <- streaming%>%mutate(platform=case_when(
  Netflix==1 & Disney.==0 ~ "Netflix",
  Netflix==0 & Disney.==1 ~ "Disney+",
  Netflix==1 & Disney.==1 ~ "Both"
))
streaming <- streaming[!is.na(streaming$platform),]
streaming <- streaming[!streaming$platform=="Both",]
streaming <- streaming[!is.na(streaming$IMDb),]
mu<-streaming %>% group_by(p=platform) %>% summarise(m=mean(IMDb)) 
ggplot(streaming,aes(x=IMDb,color=platform,fill=platform)) + 
  geom_histogram(alpha=.5,position="identity") + 
  #geom_density(alpha=0.5) +
  geom_vline(data=mu, aes(xintercept=m, color=p), linetype="dashed") +
  theme_classic() +
  scale_color_manual(values=c("#111E4F","#AF0C19")) +
  scale_fill_manual(values=c("#111E4F","#AF0C19"))

# Waffle plot
streaming %>% count(platform) # get counts of streaming platforms
platform <- c('Netflix' = 3550,'Both'=10,'Disney+'=554)
waffle(
  platform/2, rows = 17, size =0.125, 
  colors = c("#AF0C19","#601534","#111E4F"), legend_pos = "bottom"
)
