library(rgdal)
bay <- readOGR(dsn = "C:/Users/acer/Downloads/bayombong_nuevaviz", 
               layer = "bayombong_nuevaviz")
plot(bay, col = "lightgrey")
Dengue<-c(6,4,9,37,35,9,0,11,5,5,35,13,3,14,10,10,10,6,21,34,6,11,32,6,3)
bay$Dengue<-Dengue
qtm(shp = bay, fill = "Dengue", fill.palette = "Reds")

png("Dplot.png",width=5,height=5, units="in",res=2000)
qtm(shp = bay, fill = "Dengue", fill.palette = "Reds")
dev.off()

mdc<-c(10,4,3,1,0,1,4,24,38,69,0,0)
