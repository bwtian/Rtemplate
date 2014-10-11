\name{createScaleBar}
\alias{createScaleBar}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
createScaleBar(lon, lat, distanceLon, distanceLat, distanceLegend, dist.units = "km")
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
  \item{dist.units}{
%%     ~~Describe \code{dist.units} here~~
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
    dist.units = "km") 
{
    require("maptools")
    bottomRight <- gcDestination(lon = lon, lat = lat, bearing = 90, 
        dist = distanceLon, dist.units = dist.units, model = "WGS84")
    topLeft <- gcDestination(lon = lon, lat = lat, bearing = 0, 
        dist = distanceLat, dist.units = dist.units, model = "WGS84")
    rectangle <- cbind(lon = c(lon, lon, bottomRight[1, "long"], 
        bottomRight[1, "long"], lon), lat = c(lat, topLeft[1, 
        "lat"], topLeft[1, "lat"], lat, lat))
    rectangle <- data.frame(rectangle, stringsAsFactors = FALSE)
    bottomRight2 <- gcDestination(lon = lon, lat = lat, bearing = 90, 
        dist = distanceLon * 2, dist.units = dist.units, model = "WGS84")
    rectangle2 <- cbind(lon = c(bottomRight[1, "long"], bottomRight[1, 
        "long"], bottomRight2[1, "long"], bottomRight2[1, "long"], 
        bottomRight[1, "long"]), lat = c(lat, topLeft[1, "lat"], 
        topLeft[1, "lat"], lat, lat))
    rectangle2 <- data.frame(rectangle2, stringsAsFactors = FALSE)
    onTop <- gcDestination(lon = lon, lat = lat, bearing = 0, 
        dist = distanceLegend, dist.units = dist.units, model = "WGS84")
    onTop2 <- onTop3 <- onTop
    onTop2[1, "long"] <- bottomRight[1, "long"]
    onTop3[1, "long"] <- bottomRight2[1, "long"]
    legend <- rbind(onTop, onTop2, onTop3)
    legend <- data.frame(cbind(legend, text = c(0, distanceLon, 
        distanceLon * 2)), stringsAsFactors = FALSE, row.names = NULL)
    return(list(rectangle = rectangle, rectangle2 = rectangle2, 
        legend = legend))
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
