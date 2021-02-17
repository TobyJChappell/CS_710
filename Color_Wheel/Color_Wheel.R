library(ggplot2)
d=expand.grid(h=seq(0,1,1/11.9), s=seq(0.2,1,1/7), v=seq(0.2,1,1/7))
ggplot() +
  coord_polar(theta="x") +
  scale_x_continuous(breaks=NULL) +
  scale_y_continuous(breaks=NULL) +
  scale_fill_identity() +
  geom_rect(data=d, mapping=aes(xmin=h, xmax=h+resolution(h), ymin=s, ymax=s+resolution(s), fill=hsv(h,s,v)))

ggplot() +
  coord_polar(theta="x") +
  scale_x_continuous(breaks=NULL) +
  scale_y_continuous(breaks=NULL) +
  scale_fill_identity() +
  geom_rect(data=d, mapping=aes(xmin=h, xmax=h+resolution(h), ymin=v, ymax=v+resolution(v), fill=hsv(h,s,v)))






library(ggplot2)
d=expand.grid(h=seq(0,0.95,0.05), s=seq(0,0.95,0.05), v=seq(0,1,0.2))
ggplot() +
  coord_polar(theta="x") +
  facet_wrap(~v) +
  scale_x_continuous(name="hue", limits=c(0,1), breaks=seq(0.025,0.925,0.1), labels=seq(0,0.9,0.1)) +
  scale_y_continuous(name="saturation", breaks=seq(0, 1, 0.2)) +
  scale_fill_identity() +
  geom_rect(data=d, mapping=aes(xmin=h, xmax=h+resolution(h), ymin=s, ymax=s+resolution(s), fill=hsv(h,s,v)), color="white", size=0.1)
