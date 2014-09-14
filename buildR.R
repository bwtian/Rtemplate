### http://pjnewcombe.wordpress.com/2014/06/02/how-to-develop-an-r-package-in-rstudio-with-roxygen-comments/
package.name <- "ExamplePackage"
package.dir <- paste("~/Dropbox/Projects/R Packages/",package.name,sep="")
setwd(package.dir)
### --- Use Roxygenise to generate .RD files from my comments
# #####################################################################
# # 
# #####################################################################

library("roxygen2")
roxygenise(package.dir=package.dir)
# #####################################################################
# # Build and 
# #####################################################################

system(command=paste("R CMD INSTALL '",package.dir,"'",sep=""))
buildR <- function(pkgName){


}
