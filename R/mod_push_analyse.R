mod_push_analyse <- function(){
  uiOutput("push_result")
}

setupInput <- function( id ){
  ns<-NS(id)

}

setup <- function(input, output, session){
  return(input)
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

mod_push_to_db <- function(input,
                           output,
                           session,
                           is_pushed,
                           comp_in){



  observeEvent(is_pushed(),{
    #browser()
    df_race <- data.frame(name = comp_in$competition_name,
                          place = comp_in$competition_place,
                          map = "",
                          lon = "",
                          lat ="",
                          date = comp_in$competition_date,
                          race_type_id = comp_in$course_type
    )


    print(df_race)


  })

}
