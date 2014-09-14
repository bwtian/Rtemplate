catR2org  <- function(pkgRepo, pkgWD){
                pkgRepo  <- "landsat"
                pkgWD <- getwd()
                pkgDir <- file.path(pkgWD,pkgRepo)
                des  <- read.csv(file.path(pkgDir,"DESCRIPTION"), sep = ":", header = F)

                pkgVer  <-des[des[,1] == "Version",][,2]
                pkgVer  <-gsub("(^ *)|( *$)", "", pkgVer)
                pkgName  <- des[des[,1] == "Package",][,2]
                pkgName  <-gsub("(^ *)|( *$)", "", pkgName)
                orgName  <- paste0(pkgName, "_", pkgVer, ".org")
                rPath  <- file.path(pkgDir, "/R")
                rfiles  <- list.files(path = rPath, pattern = "\\.[rR]$")
                 readLines(file.path(rPath, "BSL.R"))
                readLines(file.path(rPath,rfiles[1]),
                rfiles[1]
                for (i in 1:length(rfiles)){
                        rfile  <- cat("* ", rfiles[i], "\n", "#+BEGIN_SRC R \n", readLines(file.path(rPath,rfiles[i])), "\n", "#+END_SRC \n")
                write.table(rfile, orgName, sep = "\n",  append = TRUE,quote = FALSE, col.names = FALSE,row.names = FALSE)
                }
                rfile

                message("Porcessing Finished")
}
catR2org("landsat")
