catR2org  <- function(pkgRepo, pkgWD){
                pkgRepo  <- "landsat"
                pkgWD <- getwd()
                pkgDir <- file.path(pkgWD,pkgRepo)
                des  <- readLines(file.path(pkgDir,"DESCRIPTION"))
                des1 = gsub(pattern="(^[^:]+):(.+$)",
                                  replacement="\\1,\\2",
                                  x=des)


                pkgVer  <-des[des[,1] == "Version",][,2]
                pkgVer  <-gsub("(^ *)|( *$)", "", pkgVer)
                pkgName  <- des[des[,1] == "Package",][,2]
                pkgName  <-gsub("(^ *)|( *$)", "", pkgName)
                AuthorName  <- des[des[,1] == "Package",][,2]
                orgName  <- paste0(pkgName, "_", pkgVer, ".org")
                write.table(des, orgName, sep = ":",  append = T,quote = F, row.names = F, col.names = F)
                rPath  <- file.path(pkgDir, "/R")
                rFiles  <- list.files(path = rPath, pattern = "[rR]$")
                for (i in c(rFiles)){
                        heading  <- paste0("* ", i)
                        header  <- "#+BEGIN_SRC R "
                        rfile  <- read.table(file = file.path(rPath,i), sep = "\n")
                        ender  <- "#+END_SRC"
                        write.table(rbind(heading, header,rfile, ender), orgName, sep = "\n",  append = T,quote = F, row.names = F, col.names = F)
                }

                message("Wrap R code files to Emacs Org-mode babel file Finished")
}
setwd("~/Dropbox/7src/R/landsat/0_Landsat_R")
catR2org("landsat")
