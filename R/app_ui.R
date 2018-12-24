
#' @import shiny
app_ui <- function() {
  fluidPage(
    titlePanel("O analyser"),
    # Sidebar with a slider input for number of bins
      mod_get_competition_paramsInput(),
      mod_get_mistakesInput()
    )
}
