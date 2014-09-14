package.dir <- paste("~/Dropbox/Projects/R Packages/",package.name,sep="")
setwd(package.dir)
### --- Use Roxygenise to generate .RD files from my comments
# #####################################################################
# # 
# #####################################################################



system(command=paste("R CMD INSTALL '",package.dir,"'",sep=""))
buildRpkg <- function(pkgWD, pkgName) {
        pkgWD <- getwd()
        pkgFull <- file.path(pkgDir,pkgName)
        if(!require("roxygen2")) {
                install.packages("roxygen2")
        } else {
                roxygenise(package.dir=package.dir)
        }


}
