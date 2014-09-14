catR2org  <- function(pkgRepo, pkgWD){
                pkgRepo  <- "landsat"
                pkgWD <- getwd()
                pkgDir <- file.path(pkgWD,pkgRepo)
                pkgDir

                des  <- read.csv(file.path(pkgDir,"DESCRIPTION"), sep = ":", header = F)

                pkgVer  <-des[des[,1] == "Version",][,2]
                pkgVer  <-gsub("(^ *)|( *$)", "", pkgVer)
                pkgName  <- des[des[,1] == "Package",][,2]
                pkgName  <-gsub("(^ *)|( *$)", "", pkgName)
                orgName  <- paste0(pkgName, "_", pkgVer, ".org")
                rPath  <- file.path(pkgDir, "/R")
                for (i in list.files(path = rPath, pattern = "\\.[rR]$")){
                        heading  <- paste0("* ", i, "\n")
                        header  <- paste0 ("#+BEGIN_SRC R ", "\n")
                        rfile  <- readLines(i)
                        ender  <- paste0("#+BEGIN_SRC R ", "\n")
                        write.table(rbind(heading, header,rfile, ender), orgName, sep = "\n",  append = T,quote = F, row.names = F)
                }
                message("Porcessing Finished")
}
