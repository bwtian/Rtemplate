buildR <- function(pkgName, pkgWD) {
        WD <- getwd()
        pkgwd()  <- paste0("../", WD)
        pkgDir <- file.path(pkgWD,pkgName)
        if(!require("roxygen2")) {
                install.packages("roxygen2")
        } else {
                roxygenise(package.dir=pkgDir)
        }
system(command=paste0("R CMD INSTALL '", pkgDir,"'"))
# R CMD build package1
# R CMD check package1_0.0.1.tar.gz
# R CMD INSTALL package1_0.0.1.tar.gz

}
