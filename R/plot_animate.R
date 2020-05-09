# 1 May 2020

#if(!require(magick)) install.packages('magick')
#library(magick)
#' Iris widget
#'
#' This calls the javascript bit for the mouseover
#'
#' @import magick
#'
#' @export
# Plotting function
plot_animate <- function(data = NULL, x = NULL, y = NULL, z = NULL, add = TRUE,
                         xrange = c(min(data[[x]], na.rm = T), max(data[[x]], na.rm = T)),
                         yrange = c(min(data[[y]], na.rm = T), max(data[[y]], na.rm = T)),
                         w=500, h=500, r=96,
                         fps = 2, morph = FALSE,
                         plot_type = "points", ...){

    img <- magick::image_graph(w, h, res = r)
    Z <- unique(data[[z]])


    for (i in seq_along(Z)){
        if (add == TRUE){
            d <- data[data[[z]] %in% Z[1:i],]
        } else {
            d <- data[data[[z]] == Z[i],]
        }
        plot.new(); plot.window(xlim = xrange, ylim = yrange); axis(1); axis(2)
        do.call(plot_type, list(d[[x]], d[[y]], ...))
    }



    if (morph){
        img <- magick::image_morph(img)
        fps <- 10
    }

    dev.off()
    animation <- magick::image_animate(img, fps = fps, optimize = TRUE)

    # Write it out
    if(!dir.exists("img")) dir.create("img")
    magick::image_write(animation, "iris.gif")

    return(animation)
}

``
