library(ggplot2)
nba <- read.csv("nba-elo.csv", header=TRUE)

nba$forecast_cat <- cut(nba$forecast, breaks=c(0,.5,1), labels=c("Will Lose","Will Win"))
game_result_num <- function(value) {
  if("W" == value) {
    return <- 1
  }
  else {
    return <- 0
  }
}

nba$isWin <- lapply(nba$game_result,game_result_num)

nbaWins <- nba[nba$game_result == 'W',]

ggplot(nbaWins, aes(x=game_result, y=forecast, fill=game_result)) + 
  geom_boxplot() + 
  theme_classic() + 
  xlab("Game Result") + 
  ylab("Elo Forecast") + 
  theme(legend.position = "none")

ggplot(nbaWins,aes(x=forecast_cat,fill=forecast_cat)) +
  geom_bar() +
  labs(x="Forecast Category",y="Number of Wins",title="Bar Graph (Number of Wins vs. Forecast Category)") +
  theme_minimal()

nba$point_difference = nba$pts-nba$opp_pts
nbaPosPts = nba[nba$point_difference > 0,]

ggplot(nbaPosPts,aes(x=forecast,y=point_difference,color=forecast_cat)) +
  geom_point() +
  labs(x="Forecast",y="Point Difference",title="Scatter Plot (Point Difference vs. Forecast)") +
  theme_minimal()
