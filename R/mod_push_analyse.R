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
                           comp_in,
                           mistakes){



  observeEvent(is_pushed(),{
    #browser()
    df_race <- data.frame(name = comp_in$competition_name,
                          place = comp_in$competition_place,
                          map = NA,
                          lon = NA,
                          lat = NA,
                          date = comp_in$competition_date,
                          race_type_id = comp_in$course_type
    )
    df_results <- data.frame(global_time = comp_in$runner_time,
                             time_from_winner = comp_in$winner_time,
                             category = comp_in$course_name,
                             number_controls = comp_in$course_control_number,
                             comments = comp_in$performance_summary,
                             distance = comp_in$course_distance,
                             elevation = comp_in$course_elevation)


    print(df_results)


  })

}
