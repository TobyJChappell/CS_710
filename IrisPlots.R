library(ggplot2)
#PART 1
Is_Versicolor <- iris$Species == "versicolor"
iris_plot <- ggplot(iris,aes(x=Sepal.Width,y=Sepal.Length))

#Shape
iris_plot + geom_point(aes(shape=Is_Versicolor))

#Brightness
iris_plot + geom_point(aes(color=Is_Versicolor)) +
  scale_color_manual(breaks = c(FALSE, TRUE), values=c(hsv(.5,1,.25), hsv(.5,1,.75)))

#remotes::install_github("coolbutuseless/ggecho")
library(ggecho)

#Blur
blur <- ggplot(iris[Is_Versicolor, ],aes(x=Sepal.Width,y=Sepal.Length)) + geom_point(size=2.5)
blur + geom_point() + stat_echo(data=iris[!Is_Versicolor, ],size=.1)

#PART 2
#Hue and Brightness
iris_plot + geom_point(aes(color=Species)) +
  scale_color_manual(breaks = c("setosa", "versicolor", "virginica"), values=c(hsv(.15,1,.15), hsv(.5,1,.5), hsv(.85,1,.85)))

#Shape and Brightness
iris_plot + geom_point(aes(color=Species,shape=Species)) +
  scale_color_manual(breaks = c("setosa", "versicolor", "virginica"), values=c(hsv(.5,1,.15), hsv(.5,1,.5), hsv(.5,1,.85)))
