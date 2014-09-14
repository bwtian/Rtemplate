
buildRpkg <- function( pkgName, pkgWD) {
        pkgWD <- getwd()
        pkgDir <- file.path(pkgWD,pkgName)
        if(!require("roxygen2")) {
                install.packages("roxygen2")
        } else {
                roxygenise(package.dir=package.dir)
        }
system(command=paste("R CMD INSTALL '", pkgDir,"'",sep=""))

}
