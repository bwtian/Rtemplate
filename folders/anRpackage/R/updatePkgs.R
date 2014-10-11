updatePkgs <-
function() {
        update.packages(checkBuilt=TRUE, ask = FALSE, dependencies = c('Suggests'))
}
