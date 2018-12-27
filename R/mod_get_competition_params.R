#' Competition params ui
#'
#' @return a form for inputing competition, course and performance parameters
#'
#' @importFrom shinyTime timeInput
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
    fluidRow(
      column(
        2,
        textInput(
          "course_name",
          label = h3("Name"),
          placeholder = "Course A"
        )
      ),
      column(
        2,
        sliderInput(
          "course_distance",
          label = h3("Distance"),
          min = 0,
          max = 20,
          value = 10,
          step = 0.1
        )
      ),
      column(
        2,
        numericInput(
          "course_elevation",
          label = h3("Elevation"),
          value = 0,
          step = 5
        )
      ),
      column(
        2,
        numericInput(
          "course_control_number",
          label = h3("Number of controls"),
          value = 0,
          step = 1
        )
      ),
      column(
        2,
        shinyWidgets::radioGroupButtons(
          "course_type",
          label = h3("Course type"),
          choices = c("Sprint", "Middle", "Long")
        )
      )
    ),
    fluidRow(h2("Performance data")),
    fluidRow(
      column(4, shinyTime::timeInput("runner_time", label = h3("Your time"))),
      column(4, shinyTime::timeInput("winner_time", label = h3("Winner's time")))

    ),
    fluidRow(h3("Global performance analysis")),
    fluidRow(
      textAreaInput(
        "performance_summary",
        label = h3("performance summary"),
        placeholder = "Summary of your race"
      )
    ),
    fluidRow(column(
      6,
      textAreaInput(
        "performance_strong",
        label = h3("Strong points"),
        placeholder = "Strong points during your race"
      )
    ),
    column(
      6,
      textAreaInput(
        "performance_weak",
        label = h3("Weak points"),
        placeholder = "Weak points during your race"
      )
    )),
    fluidRow(
      textAreaInput(
        "performance_next_time",
        label = h3("Point of attention for next time"),
        placeholder = "I must be careful about ..."
      )
    ),
    fluidRow(
      actionButton("validate_course_params", label = h3("Validate course parameters"))
    )

  )

}


#' Competition params server side
#'
#' Deals with the values of the comptetion parameters
#' @param input input dialog between server and ui
#' @param output output between serer and ui
#' @param session session object passed to server
#'
#' @return nothing
#' @export
#'
#' @examples
mod_get_competition_params <- function(input, output, session) {

}
