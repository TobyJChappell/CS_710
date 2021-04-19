download.file(url = "https://ndownloader.figshare.com/files/2292169",
              destfile = "/Users/tobychappell/Documents/CS_Courses/CS_710/Intro_to_R/portal_data_joined.csv")
library(tidyverse)
surveys <- read_csv("/Users/tobychappell/Documents/CS_Courses/CS_710/Intro_to_R/portal_data_joined.csv")
head(surveys)
view(surveys)
str(surveys)
# first element in the first column of the data frame (as a vector)
surveys[1, 1]   
# first element in the 6th column (as a vector)
surveys[1, 6]   
# first column of the data frame (as a vector)
surveys[, 1]    
# first column of the data frame (as a data.frame)
surveys[1]      
# first three rows of the 6th column (as a vector)
surveys[1:3, 6] 
# the 3rd row of the data frame (as a data.frame)
surveys[3, ]    
# equivalent to head_surveys <- head(surveys)
head_surveys <- surveys[1:6, ]
surveys[, -1]          # The whole data frame, except the first column
surveys[-(7:34786), ] # Equivalent to head(surveys)
surveys["species_id"]       # Result is a data.frame
surveys[, "species_id"]     # Result is a vector
surveys[["species_id"]]     # Result is a vector
surveys$species_id          # Result is a vector

surveys_200 <- surveys[200,]
surveys_last <- surveys[nrow(surveys),]
surveys_middle <- surveys[nrow(surveys)/2,]
surveys_first_six <- surveys[-(7:nrow(surveys)),]
surveys$sex <- factor(surveys$sex)
summary(surveys$sex)
sex <- factor(c("male", "female", "female", "male"))
levels(sex)
nlevels(sex)
sex <- factor(sex, levels = c("male", "female"))
sex
surveys$taxa <-factor(surveys$taxa)
surveys$genus <-factor(surveys$genus)
summary(surveys$taxa)
nlevels(surveys$genus)
as.character(sex)
year_fct <- factor(c(1990, 1983, 1977, 1998, 1990))
as.numeric(year_fct)               # Wrong! And there is no warning...
as.numeric(as.character(year_fct)) # Works...
as.numeric(levels(year_fct))[year_fct]    # The recommended way.
## bar plot of the number of females and males captured during the experiment:
plot(surveys$sex)
sex <- surveys$sex
levels(sex)
sex <- addNA(sex)
levels(sex)
head(sex)
levels(sex)[3] <- "undetermined"
levels(sex)
head(sex)
plot(sex)
levels(sex)[1:2] <- c("female", "male")
sex <- factor(sex, levels = c("undetermined", "female", "male"))
plot(sex)
str(surveys)
library(lubridate)
my_date <- ymd("2015-01-01")
str(my_date)
# sep indicates the character to use to separate each component
my_date <- ymd(paste("2015", "1", "1", sep = "-")) 
str(my_date)
paste(surveys$year, surveys$month, surveys$day, sep = "-")
ymd(paste(surveys$year, surveys$month, surveys$day, sep = "-"))
surveys$date <- ymd(paste(surveys$year, surveys$month, surveys$day, sep = "-"))
str(surveys) # notice the new column, with 'date' as the class
summary(surveys$date)
missing_dates <- surveys[is.na(surveys$date), c("year", "month", "day")]

head(missing_dates)
