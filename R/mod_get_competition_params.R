#' Competition params ui
#'
#' @return
#' @export
#'
#' @examples
mod_get_competition_paramsInput <- function() {
  fluidPage(
    fluidRow(h2("Competition Information")),
    fluidRow(
      column(
        4,
        textInput(
          "competition_name",
          label = h3("Name"),
          placeholder = "Competition name"
        )
      ),
      column(
        4,
        textInput(
          "competition_place",
          label = h3("Place"),
          placeholder = "Competition place"
        )
      ),
      column(4,
             dateInput("competition_date", label = h3("Date")))
    ),
    fluidRow(h2("Course information")),
    fluidRow(textInput("course_name", label = h3("Course name"), placeholder = "Course A")),
    column(4,
           actionButton(
             "validate_competition_params", label = h3("validate")
           ))

  )

}


#' Competition params server side
#'
#' Deals with the values of the comptetion parameters
#' @param input
#' @param output
#' @param session
#'
#' @return
#' @export
#'
#' @examples
mod_get_competition_params <- function(input, output, session) {

}
