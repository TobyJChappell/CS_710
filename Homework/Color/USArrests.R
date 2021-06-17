library(ggplot2)
library(reshape2)
library(dplyr)  # required for arrange()
library(colorspace)
library(viridis)
library(maps) # for the state map data
library(mapproj)

murder_rates <- read.csv(file = 'MurderRate.csv')
murder_rates$state <- tolower(murder_rates$state)
states_map<-map_data("state") #extracts data from the states map
crimes<-data.frame(state=tolower(rownames(USArrests)),USArrests)
crimes<-merge(crimes,murder_rates,by="state")
crime_map<-merge(states_map,crimes,by.x="region",by.y="state")
crime_map<-arrange(crime_map,group,order)
c = hsv((max(crime_map$Murder)-crime_map$Murder)/(max(crime_map$Murder)-min(crime_map$Murder))/7,(crime_map$rate-min(crime_map$rate))/(max(crime_map$rate)-min(crime_map$rate)),.95)

#Hue determined by Murder Arrest Rate and Saturation determined by Murder Rate
ggplot(crime_map,aes(x=long,y=lat,group=group)) + 
  coord_map("polyconic") + 
  geom_polygon(fill=c)

#Hue determined by Murder Arrest Rate and Brightness determined by Murder Rate
ggplot(crime_map) +
  coord_map("polyconic") + 
  geom_polygon(aes(x=long, y=lat, group=group, fill=Murder)) +
  geom_polygon(aes(x=long, y=lat, group=group, alpha=rate))
