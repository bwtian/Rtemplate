catR2org  <- function(pkgRepo, pkgWD){
                #pkgRepo  <- "landsat"
                pkgWD <- getwd()
                pkgDir <- file.path(pkgWD,pkgRepo)
                des  <- read.csv(file.path(pkgDir,"DESCRIPTION"), sep = ":", header = F)

                pkgVer  <-des[des[,1] == "Version",][,2]
                pkgVer  <-gsub("(^ *)|( *$)", "", pkgVer)
                pkgName  <- des[des[,1] == "Package",][,2]
                pkgName  <-gsub("(^ *)|( *$)", "", pkgName)
                orgName  <- paste0(pkgName, "_", pkgVer, ".org")
                rPath  <- file.path(pkgDir, "/R")
                #readLines(file.path(rPath, "BSL.R"))
                for (i in list.files(path = rPath, pattern = "[rR]$")){
                        heading  <- paste0("* ", i)
                        header  <- "#+BEGIN_SRC R"
                        rfile  <- readLines(file.path(rPath,i))
                        ender  <- "#+BEGIN_SRC R"
                        write.table(rbind(heading, header,rfile, ender), orgName, sep = "\n",  append = TRUE,quote = FALSE, col.names = FALSE,row.names = FALSE)
                }

                message("Porcessing Finished")
}
catR2org("landsat")
