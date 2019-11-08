#' Competition params ui
#'
#' @return a form for inputing competition, course and performance parameters
#'
#' @importFrom shinyTime timeInput
#' @export
#'
#' @examples
mod_get_competition_paramsInput <- function() {
  list(
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
#' Registers the competition parameters each time the validate button is clicked on
#' @param input input dialog between server and ui
#' @param output output between serer and ui
#' @param session session object passed to server
#'
#' @return nothing
#' @export
#'
#' @examples
mod_get_competition_params <- function(input, output, session) {
   observeEvent(input$validate_course_params, ({
     competition_params <- list(
       competition_name = input$competition_name,
       competition_place = input$competition_place,
       competition_date = input$course_date,
       course_name = input$course_name,
       course_distance = input$course_distance,
       course_elevation = input$course_elevation,
       course_control_number = input$course_control_number,
       course_type = input$course_type,
       runner_time = input$runner_time,
       winner_time = input$winner_time,
       performance_summary = input$performance_summary,
       performance_strong = input$performance_strong,
       performance_weak = input$performance_weak,
       performance_next_time = input$performance_next_time
     )
  }))
}
