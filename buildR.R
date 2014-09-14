### http://pjnewcombe.wordpress.com/2014/06/02/how-to-develop-an-r-package-in-rstudio-with-roxygen-comments/
package.name <- "ExamplePackage"
package.dir <- paste("~/Dropbox/Projects/R Packages/",package.name,sep="")
setwd(package.dir)
### --- Use Roxygenise to generate .RD files from my comments
# #####################################################################
# # 
# #####################################################################



system(command=paste("R CMD INSTALL '",package.dir,"'",sep=""))
buildR <- function(pkgDir, pkgName) {
        pkgDir = getwd()
        
        if(!require("roxygen2")) {
                install.packages("roxygen2")
        } else {
                roxygenise(package.dir=package.dir)
        }


}
