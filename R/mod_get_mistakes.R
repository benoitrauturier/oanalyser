#' Returns intercontrols parameters
#'
#' Thus function takes the number of controls and return a character vector for displaying the intercontrols to the user.
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
#' The unvariant mistake form is the type of mistake committed and the time lost on that particular mistake
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
      radioButtons(
        "mistakes_types",
        label = h3("Mistakes committed"),
        choiceNames = mistakes_df$name,
        choiceValues = mistakes_df$code
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
    observeEvent({
      input$validate_course_params
      input$mistake_submitted
      }, ignoreNULL = F,
      ignoreInit = T,
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

#' Register mistakes server module
#'
#' This module register the mistakes in a reactive value data frame each time the ruse presses the mistake_submitted button. It also prepares the data frame to be displayed to the user and reintialize the form.
#' TODO : Refacto this functio for single responsability and functionalize the rendering of the mistake form.
#'
#' @param input
#' @param output
#' @param session
#'
#' @return
#' @export
#'
#' @examples
mod_register_mistake <- function(input,
                                 output,
                                 session,
                                 mistake_submitted,
                                 input_val) {
  rv <- reactiveValues(mistakes_commited = data.frame())

  observeEvent(mistake_submitted(), {
    mistake_entered <- data.frame(control = input_val()$mistake_control,
                                  time_lost = strftime(input_val()$mistake_time_loss,"%T"),
                                  mistake_type_id = input_val()$mistakes_types)

    rv$mistakes_commited  <- dplyr::bind_rows(mistake_entered, rv$mistakes_commited)


    })

  return(rv)
}

#' Print mistakes committed
#'
#' This module prints the mistakes committed by the user dynamically as the user enters them.
#'
#' @return
#' @export
#'
#' @examples
#' \dontrun{
#' mod_print_mistakes_commited
#' }
#'
mod_print_mistakes_committed <- function(id){
  ns <- NS(id)

  fluidPage(fluidRow(DT::dataTableOutput(ns("mistakes_commited"))))
}

mod_render_dt_mistakes <- function(input,
                                   output,
                                   session,
                                   mistakes){

  output$mistakes_commited <- DT::renderDataTable(mistakes$mistakes_commited,
                                                  server = FALSE,
                                                  selection = "none",
                                                  options = list(searching = FALSE))

}
