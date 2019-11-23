
#' @import shiny
#' @import shinythemes
app_ui <- function() {


  navbarPage("O analyser",
             theme = shinytheme("united"),
             tabPanel("Enter course analyse",
                      fluidPage(
                        mod_get_competition_paramsInput("competition_info"),
                        mod_get_mistakesInput(),
                        mod_print_mistakes_committed("renderer_dt_mistakes"),
                        mod_push_analyse())
             ))

}
