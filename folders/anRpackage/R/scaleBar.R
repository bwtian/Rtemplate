scaleBar <-
function(lon, lat, distanceLon, distanceLat, distanceLegend, distanceUnit, dist.unit = "km", rec.fill = "white", rec.colour = "black", rec2.fill = "black", rec2.colour = "black", legend.colour = "black", legend.size = 3, orientation = TRUE, arrow.length = 500, arrow.distance = 300, arrow.colour = "black", arrow.size = 1, arrow.North.size = 6, arrow.North.color = "black"){
        laScaleBar <- createScaleBar(lon = lon, lat = lat, distanceLon = distanceLon, distanceLat = distanceLat, distanceLegend = distanceLegend, dist.unit = dist.unit)
        # First rectangle
        rectangle1 <- geom_polygon(data = laScaleBar$rectangle, aes(x = lon, y = lat), fill = rec.fill, colour = rec.colour)

        # Second rectangle
        rectangle2 <- geom_polygon(data = laScaleBar$rectangle2, aes(x = lon, y = lat), fill = rec2.fill, colour = rec2.colour)

        # Legend
#         scaleBarLegend <- annotate("text", label = paste(laScaleBar$legend[,"text"], dist.unit, sep=""), x = laScaleBar$legend[,"long"], y = laScaleBar$legend[,"lat"], size = legend.size, colour = legend.colour)
        t  <- laScaleBar$legend[,"text"]
        scaleBarLegend <- annotate("text", label = c(t[-length(t)], paste(t[length(t)],  dist.unit, sep = " ")), x = laScaleBar$legend[,"long"], y = laScaleBar$legend[,"lat"], size = legend.size, colour = legend.colour, family="Times")
       kmLegend <- annotate("text", label = dist.unit,  x = lon, y = lat, size = legend.size, colour = legend.colour, family="Times")

        res <- list(rectangle1, rectangle2, scaleBarLegend)

        if(orientation){# Add an arrow pointing North
                coordsArrow <- createOrientationArrow(scaleBar = laScaleBar, length = arrow.length, distance = arrow.distance, dist.unit = dist.unit)
                arrow <- list(geom_segment(data = coordsArrow$res, aes(x = x, y = y, xend = xend, yend = yend),colour = arrow.colour, size = arrow.size), annotate("text", label = "N", x = coordsArrow$coordsN[1,"x"], y = coordsArrow$coordsN[1,"y"], size = arrow.North.size, colour = arrow.North.color, family="Times"))
                res <- c(res, arrow)
        }
        return(res)
}
