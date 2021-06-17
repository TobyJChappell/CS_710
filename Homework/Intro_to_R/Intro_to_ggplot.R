library(ggplot2)
mtcars <- mtcars
ggplot(mtcars,aes(x=mpg,y=hp,fill=cyl)) +
  geom_point(pch=21) +
  xlab("Miles per gallon") +
  ylab("Horsepower")

Loblolly <- Loblolly
library(reshape2)

Loblolly.wide <- dcast(Loblolly,Seed~age,value.var="height") #Convert to wide format with dcast
Loblolly.long <- melt(Loblolly.wide) #Convert to long format with melt

ggplot(mtcars,aes(x=mpg,y=hp,color=cyl)) +
  geom_point() #Correct
ggplot(mtcars,aes(x=mpg,y=hp)) +
  geom_point(color=cyl) #Incorrect
ggplot(mtcars,aes(x=mpg,y=hp)) +
  geom_point(aes(color=cyl)) #Correct

p <- ggplot(mtcars,aes(x=mpg,y=hp))
p + geom_point(color="red")
p + geom_point(color="red", size = 4)
p + geom_point(color="red", shape = 21)
p + geom_point(color="red", alpha = 0.5)

# geom_point()
# geom_line()
# geom_boxplot()
# geom_violin()
# geom_bar()
# geom_contour()
# geom_density()
# geom_map()
# geom_raster() / geom_tile()
# geom_qq_line()
# geom_dotplot()
# geom_histogram()

ggplot(mtcars,aes(x=mpg,y=hp,color=factor(cyl))) +
  geom_point()

faithfuld <-faithfuld  
p2 <- ggplot(faithfuld,aes(x=eruptions,y=waiting)) +
  geom_raster(aes(fill=density), interpolate=TRUE)
p2
p2 + scale_fill_viridis_c(option="E")

library(RColorBrewer)
p2 + scale_fill_distiller(palette = "OrRd")

p + geom_point(aes(color=cyl)) +
  scale_x_continuous(breaks=c(10,20,30),labels=c("OK","Good","Great!"))

#Remove legend
p + geom_point(aes(color=cyl)) + guides(color=FALSE)
p + geom_point(aes(color=cyl)) + theme(legend.position = "none")

