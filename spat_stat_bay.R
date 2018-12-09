library(rgdal)
bay <- readOGR(dsn = "C:/Users/acer/Downloads/bayombong_nuevaviz", 
               layer = "bayombong_nuevaviz")
plot(bay, col = "lightgrey")
Dengue<-c(6,4,10,37,9,9,0,11,5,5,35,13,3,14,10,10,35,6,21,34,6,11,32,6,3)
bay$Cases<-Dengue
qtm(shp = bay, fill = "Cases", fill.palette = "Reds", text = "Labs",
    text.col = "black", fill.title = "", text.size = 0.7,
    title = "2018 Dengue Cases in Bayombong, Nueva Vizcaya")

png("Dplot.png",width=7,height=7, units="in",res=2500)
qtm(shp = bay, fill = "Dengue", fill.palette = "Reds", text = "Labs",
    text.col = "black", text.size = 0.7)
dev.off()

mdc<-c(10,4,3,1,0,1,4,24,38,69,0,0)

Labs<-c("Cabuaan","DMM","DDM","IV","DTM","SR","Ipil-Cuneg","Casat",
        "LTN","L","BP","Magsaysay","Masoc","BW","BE","SN","DMP",
        "LTS","S","Busilac","Paitan","VA","Buenavista","Magapuy",
        "Bansing")

bay$Labs<-Labs

