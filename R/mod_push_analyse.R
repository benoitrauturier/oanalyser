mod_push_analyse <- function(){
  uiOutput("push_result")
}

mod_get_push_button <- function(input,
                                output,
                                session){
  observeEvent(input$mistake_submitted, {
    output$push_result <- renderUI({
      fluidRow(column(4,
                      actionButton(inputId = "push_result",
                                   label = "Register race")))
    })
  })
}
