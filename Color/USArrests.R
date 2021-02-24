library(ggplot2)
library(reshape2)
library(dplyr)  # required for arrange()
library(colorspace)
library(viridis)
library(maps) # for the state map data
library(mapproj)

states_map<-map_data("state") #extracts data from the states map
crimes<-data.frame(state=tolower(rownames(USArrests)),USArrests)
crime_map<-merge(states_map,crimes,by.x="region",by.y="state")
crime_map<-arrange(crime_map,group,order)

ggplot(crime_map,aes(x=long,y=lat,group=group)) + 
  coord_map("polyconic") + 
  geom_polygon(fill=hsv((max(crime_map$Murder)-crime_map$Murder)/(max(crime_map$Murder)-min(crime_map$Murder))/7,(crime_map$Murder-min(crime_map$Murder))/(max(crime_map$Murder)-min(crime_map$Murder)),1))
