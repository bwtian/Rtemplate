catR2org  <- function(pkgName, pkgWD){
                pkgWD <- getwd()
                pkgDir <- file.path(pkgWD,pkgName)
                des  <- read.csv(file.path(pkgDir,"DESCRIPTION"), sep = ":", header = F)

                pkgVer  <-des[des[,1] == "Version",][,2]
                pkgVer  <-gsub("(^ *)|( *$)", "", ver)


                catR2org() {
                        echo "Usage: R2org PATTERN(regex) outfile"
                        package=$(cat ../DESCRIPTION | grep "Package:" | awk '{print $2}' | sed -e 's/^[ \t]*//')
                        version=$(cat ../DESCRIPTION | grep "version:" | awk '{print $2}' | sed -e 's/^[ \t]*//')
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
