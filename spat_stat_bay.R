#mapping dengue cases

library(rgdal)
library(tmap)

#Importing shp file
bay <- readOGR(dsn = "C:/Users/acer/Downloads/bayombong_nuevaviz", 
               layer = "bayombong_nuevaviz")

#simple plot
plot(bay, col = "lightgrey")

#adding dengue cases variable
Dengue<-c(6,4,10,37,9,9,0,11,5,5,35,13,3,14,10,10,35,6,21,34,6,11,32,6,3)
bay$Cases<-Dengue

#adding labels variable
Labs<-c("Cabuaan","DMM","DDM","IV","DTM","SR","Ipil-Cuneg","Casat",
        "LTN","L","BP","Magsaysay","Masoc","BW","BE","SN","DMP",
        "LTS","S","Busilac","Paitan","VA","Buenavista","Magapuy",
        "Bansing")
bay$Labs1<-Labs1

Labs1<-c("Cabuaan","Don Mariano Marcos","Don Domingo Madella",
        "District IV","Don Tomas Madella","Santa Rosa","Ipil-Cuneg",
        "Casat","La Torre North","Luyang","Bonfal Proper","Magsaysay",
        "Masoc","Bonfal West","Bonfal East","San Nicolas",
        "Don Mariano Perez","La Torre South","Salvacion","Busilac",
        "Paitan","Vista Alegre","Buenavista","Magapuy","Bansing")
#the map

tmap_mode("view")

qtm(shp = bay, fill = "Cases", fill.palette = "Reds", text = "Labs",
    text.col = "black", fill.title = "", text.size = 0.7,
    title = "2018 Dengue Cases in Bayombong, Nueva Vizcaya")
    
map1 <- tm_shape(bay) +
  tm_polygons('Cases', title = "",palette = 'Reds', alpha = 0.7, id="Labs1")
map1 + tm_layout(basemaps = c('OpenStreetMap'), title = "2018 Dengue Cases in Bayombong, Nueva Vizccaya", title.size = 10)



#editing saved file
png("Dplot.png",width=7,height=7, units="in",res=2500)
qtm(shp = bay, fill = "Cases", fill.palette = "Reds", text = "Labs",
    text.col = "black", fill.title = "", text.size = 0.7,
    title = "2018 Dengue Cases in Bayombong, Nueva Vizcaya")
dev.off()

#TS of dengue cases

library(tidyverse)
library(lubridate)

# the data
mdc<-c(10,4,3,1,0,1,4,24,38,69,0,0)
a<-make_date(year = 2018, month = 1:12)
dengs<-data.frame(a,mdc)

#plot
b<-ggplot(dengs, aes(a, mdc)) +
  geom_line()
b + xlab("Months") + ylab("Number of Dengue Cases") + ggtitle("2018 Monthly Dengue Cases of Bayombong, Nueva Vizcaya")

png("Dplot_ts.png",width=8.37,height=4.89, units="in",res=2500)
b + xlab("Months") + ylab("Number of Dengue Cases") + ggtitle("2018 Monthly Dengue Cases of Bayombong, Nueva Vizcaya")
dev.off()
