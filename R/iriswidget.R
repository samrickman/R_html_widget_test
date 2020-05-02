#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
iriswidget <- function(message, width = NULL, height = NULL, elementId = NULL) {

  # forward options using x
  x = list(
    message = message
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'iriswidget',
    x,
    width = width,
    height = height,
    package = 'iriswidget',
    elementId = elementId
  )
}



#' Shiny bindings for iriswidget
#'
#' Output and render functions for using iriswidget within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a iriswidget
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name iriswidget-shiny
#'
#' @export
iriswidgetOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'iriswidget', width, height, package = 'iriswidget')
}

#' @rdname iriswidget-shiny
#' @export
renderIriswidget <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, iriswidgetOutput, env, quoted = TRUE)
}
