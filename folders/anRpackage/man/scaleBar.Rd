\name{scaleBar}
\alias{scaleBar}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
scaleBar(lon, lat, distanceLon, distanceLat, distanceLegend, distanceUnit, dist.unit = "km", rec.fill = "white", rec.colour = "black", rec2.fill = "black", rec2.colour = "black", legend.colour = "black", legend.size = 3, orientation = TRUE, arrow.length = 500, arrow.distance = 300, arrow.colour = "black", arrow.size = 1, arrow.North.size = 6, arrow.North.color = "black")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{lon}{
%%     ~~Describe \code{lon} here~~
}
  \item{lat}{
%%     ~~Describe \code{lat} here~~
}
  \item{distanceLon}{
%%     ~~Describe \code{distanceLon} here~~
}
  \item{distanceLat}{
%%     ~~Describe \code{distanceLat} here~~
}
  \item{distanceLegend}{
%%     ~~Describe \code{distanceLegend} here~~
}
  \item{distanceUnit}{
%%     ~~Describe \code{distanceUnit} here~~
}
  \item{dist.unit}{
%%     ~~Describe \code{dist.unit} here~~
}
  \item{rec.fill}{
%%     ~~Describe \code{rec.fill} here~~
}
  \item{rec.colour}{
%%     ~~Describe \code{rec.colour} here~~
}
  \item{rec2.fill}{
%%     ~~Describe \code{rec2.fill} here~~
}
  \item{rec2.colour}{
%%     ~~Describe \code{rec2.colour} here~~
}
  \item{legend.colour}{
%%     ~~Describe \code{legend.colour} here~~
}
  \item{legend.size}{
%%     ~~Describe \code{legend.size} here~~
}
  \item{orientation}{
%%     ~~Describe \code{orientation} here~~
}
  \item{arrow.length}{
%%     ~~Describe \code{arrow.length} here~~
}
  \item{arrow.distance}{
%%     ~~Describe \code{arrow.distance} here~~
}
  \item{arrow.colour}{
%%     ~~Describe \code{arrow.colour} here~~
}
  \item{arrow.size}{
%%     ~~Describe \code{arrow.size} here~~
}
  \item{arrow.North.size}{
%%     ~~Describe \code{arrow.North.size} here~~
}
  \item{arrow.North.color}{
%%     ~~Describe \code{arrow.North.color} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (lon, lat, distanceLon, distanceLat, distanceLegend, 
    distanceUnit, dist.unit = "km", rec.fill = "white", rec.colour = "black", 
    rec2.fill = "black", rec2.colour = "black", legend.colour = "black", 
    legend.size = 3, orientation = TRUE, arrow.length = 500, 
    arrow.distance = 300, arrow.colour = "black", arrow.size = 1, 
    arrow.North.size = 6, arrow.North.color = "black") 
{
    laScaleBar <- createScaleBar(lon = lon, lat = lat, distanceLon = distanceLon, 
        distanceLat = distanceLat, distanceLegend = distanceLegend, 
        dist.unit = dist.unit)
    rectangle1 <- geom_polygon(data = laScaleBar$rectangle, aes(x = lon, 
        y = lat), fill = rec.fill, colour = rec.colour)
    rectangle2 <- geom_polygon(data = laScaleBar$rectangle2, 
        aes(x = lon, y = lat), fill = rec2.fill, colour = rec2.colour)
    t <- laScaleBar$legend[, "text"]
    scaleBarLegend <- annotate("text", label = c(t[-length(t)], 
        paste(t[length(t)], dist.unit, sep = " ")), x = laScaleBar$legend[, 
        "long"], y = laScaleBar$legend[, "lat"], size = legend.size, 
        colour = legend.colour, family = "Times")
    kmLegend <- annotate("text", label = dist.unit, x = lon, 
        y = lat, size = legend.size, colour = legend.colour, 
        family = "Times")
    res <- list(rectangle1, rectangle2, scaleBarLegend)
    if (orientation) {
        coordsArrow <- createOrientationArrow(scaleBar = laScaleBar, 
            length = arrow.length, distance = arrow.distance, 
            dist.unit = dist.unit)
        arrow <- list(geom_segment(data = coordsArrow$res, aes(x = x, 
            y = y, xend = xend, yend = yend), colour = arrow.colour, 
            size = arrow.size), annotate("text", label = "N", 
            x = coordsArrow$coordsN[1, "x"], y = coordsArrow$coordsN[1, 
                "y"], size = arrow.North.size, colour = arrow.North.color, 
            family = "Times"))
        res <- c(res, arrow)
    }
    return(res)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
