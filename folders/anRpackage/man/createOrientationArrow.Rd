\name{createOrientationArrow}
\alias{createOrientationArrow}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
createOrientationArrow(scaleBar, length, distance = 1, dist.units = "km")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{scaleBar}{
%%     ~~Describe \code{scaleBar} here~~
}
  \item{length}{
%%     ~~Describe \code{length} here~~
}
  \item{distance}{
%%     ~~Describe \code{distance} here~~
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
function (scaleBar, length, distance = 1, dist.units = "km") 
{
    lon <- scaleBar$rectangle2[1, 1]
    lat <- scaleBar$rectangle2[1, 2]
    begPoint <- gcDestination(lon = lon, lat = lat, bearing = 0, 
        dist = distance, dist.units = dist.units, model = "WGS84")
    lon <- begPoint[1, "long"]
    lat <- begPoint[1, "lat"]
    onTop <- gcDestination(lon = lon, lat = lat, bearing = 0, 
        dist = length, dist.units = dist.units, model = "WGS84")
    leftArrow <- gcDestination(lon = onTop[1, "long"], lat = onTop[1, 
        "lat"], bearing = 225, dist = length/5, dist.units = dist.units, 
        model = "WGS84")
    rightArrow <- gcDestination(lon = onTop[1, "long"], lat = onTop[1, 
        "lat"], bearing = 135, dist = length/5, dist.units = dist.units, 
        model = "WGS84")
    res <- rbind(cbind(x = lon, y = lat, xend = onTop[1, "long"], 
        yend = onTop[1, "lat"]), cbind(x = leftArrow[1, "long"], 
        y = leftArrow[1, "lat"], xend = onTop[1, "long"], yend = onTop[1, 
            "lat"]), cbind(x = rightArrow[1, "long"], y = rightArrow[1, 
        "lat"], xend = onTop[1, "long"], yend = onTop[1, "lat"]))
    res <- as.data.frame(res, stringsAsFactors = FALSE)
    coordsN <- cbind(x = lon, y = (lat + onTop[1, "lat"])/2)
    return(list(res = res, coordsN = coordsN))
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
