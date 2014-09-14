catR2org  <- function(pkgRepo, pkgWD){
                pkgWD <- getwd()
                pkgDir <- file.path(pkgWD,pkgRepo)
                des  <- read.csv(file.path(pkgDir,"DESCRIPTION"), sep = ":", header = F)

                pkgVer  <-des[des[,1] == "Version",][,2]
                pkgVer  <-gsub("(^ *)|( *$)", "", pkgVer)
                pkgName  <- des[des[,1] == "Package",][,2]
                pkgName  <-gsub("(^ *)|( *$)", "", pkgName)
                orgName  <- paste0(pkgName, "_", pkgVer, ".org")

                for (i in list.files(pattern = "\.[rR]$")){
                        heading  <- paste0("* " i, "\n")
                        header  <- paste0 ("#+BEGIN_SRC R ", "\n")
                        rfile  <- readLines(i)
                        ender  <- paste0("#+BEGIN_SRC R ", "\n")
                        write.table(rbind(heading, header,rfile, ender), orgName, sep = "\n",  append = T,quote = F, row.names = F)
                }
                write.table(df, csvName, sep = ",",  append = T,quote = F, row.names = F)
                        for i in $(\ls | grep ${1:-.R}); do
                        echo "* $i"  # subtree header title
                        echo "#+BEGIN_SRC R :session" # R session
                        cat "$i"                      # Content
                        echo "#+END_SRC"              # R session
                        done > ${2:-$(echo $package$version.org)}                     # output
                        mv *.org ~/Dropbox/ebooks/02_Rcode_pkgs
                        echo "Porcessing Finished"
                }

}
