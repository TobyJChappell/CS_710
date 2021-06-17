library(ggplot2)
library(reshape2)
volcano2 <- melt(volcano)
ggplot(volcano2,aes(x=Var1,y=Var2,fill=value)) + geom_tile() #Shouldn't only use luminance but better than gray scale
ggplot(volcano2,aes(x=Var1,y=Var2,fill=value)) + geom_tile()+scale_fill_gradient(low="gray10",high="gray90") #BAD!! Mach banding
ggplot(volcano2,aes(x=Var1,y=Var2,fill=value)) + geom_tile()+scale_fill_viridis_c() #Uses both color and luminance

ggplot(volcano2,aes(x=Var1,y=Var2,fill=value,z=value)) + geom_tile() + geom_contour() + scale_fill_gradient(low="gray10",high="gray90")
ggplot(volcano2,aes(x=Var1,y=Var2,fill=value,z=value)) + geom_tile() + geom_contour(breaks=seq(0,200,by=8)) + scale_fill_gradient(low="gray10",high="gray90")

