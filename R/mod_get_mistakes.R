#' Returns intercontrols parameters
#'
#' @param number_of_controls
#'
#' @return the a character vector sarting with 'Start - 1'
#' @export
#'
#' @examples
#' get_intercontrols(20)
get_intercontrols <- function(number_of_controls = 20) {
  if (!is.numeric(number_of_controls))
    stop("The number of controls must be a number")
  if (number_of_controls == 0)
    number_of_controls = 1
  control_a = c("Start", c(1:number_of_controls))
  control_b = c(c(1:number_of_controls), "Arrival")

  paste(control_a, control_b, sep = " - ")
}

#' This function returns the unvariant mistake form
#'
#' The unvariant mistake form is the type of mistake committed and the tiem lost on that particular mistake
#'
#'
#' @return a list of fluid rows objects
#' @export
#'
#' @examples
get_unvariant_mistake_form <- function() {
  list(fluidRow(
    column(
      4,
      checkboxGroupInput(
        "mistakes_types",
        label = h3("Mistakes committed"),
        choiceNames = mistakes_df$name_en,
        choiceValues = mistakes_df$.id
      )
    ),
    column(
      4,
      shinyTime::timeInput("mistake_time_loss", label = h3("Time lost on that mistake"))
    )
  ),
  fluidRow(actionButton("mistake_submitted", label = h3("Submit mistake"))))
}

#' Mistakes form
#'
#' This function prepares the mistakes forms depending on the number of mistakes
#'
#' @param number_of_controls
#'
#' @return a mistake form
#' @export
#'
#' @examples
mod_get_mistakesInput <-  function() {
  fluidPage(fluidRow(uiOutput("mistake_form")))
}

#' Server side function for the get mistake form
#'
#' This server function helps adapting the lenght of the intercontrols radio group button
#'
#' @param input
#' @param output
#' @param session
#'
#' @return
#' @export
#'
#' @examples
mod_get_mistakes <-
  function(input,
           output,
           session,
           number_of_controls = 20) {
    intercontrols <-
      reactive({
        get_intercontrols(input$course_control_number)
      })
    observeEvent(input$validate_course_params,
                 {
                   output$mistake_form <- renderUI({
                     c(list(fluidRow(
                       shinyWidgets::radioGroupButtons(
                         "mistake_control",
                         label = h3("Control at which mistake append"),
                         choices = intercontrols()
                       )
                     )),
                     get_unvariant_mistake_form())
                   })

                 })
  }
