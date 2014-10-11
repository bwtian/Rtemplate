g_legend <-
function(p){
        tmp <- ggplotGrob(p)
        leg <- which(sapply(tmp$grobs, function(x) x$name) == "guide-box")
        legend <- tmp$grobs[[leg]]
        return(legend)}
