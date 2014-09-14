package.name <- "ExamplePackage"
package.dir <- paste("~/Dropbox/Projects/R Packages/",package.name,sep="")
setwd(package.dir)
### --- Use Roxygenise to generate .RD files from my comments
library(roxygen2)
roxygenise(package.dir=package.dir)
system(command=paste("R CMD INSTALL '",package.dir,"'",sep=""))
