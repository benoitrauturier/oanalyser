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

    df_race <- data.frame(name = comp_in$competition_name,
                          place = comp_in$competition_place,
                          map = NA,
                          lon = NA,
                          lat = NA,
                          date = comp_in$competition_date,#
                          race_type_id = comp_in$course_type
    )
    df_results <- data.frame(global_time = comp_in$runner_time,
                             time_from_winner = comp_in$winner_time,
                             category = comp_in$course_name,
                             number_controls = comp_in$course_control_number,
                             comments = comp_in$performance_summary,
                             distance = comp_in$course_distance,
                             elevation = comp_in$course_elevation)

    df_mistake <- mistakes$mistakes_commited
    con <- connect_to_db()
    request_race <- DBI::dbSendQuery(con, "INSERT INTO races (name, place, map, lon, lat, date, race_type_id)
                                          VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING id")
    DBI::dbBind(request_race, unname(as.list(df_race)))
    res_race <- DBI::dbFetch(request_race)
    DBI::dbClearResult(request_race)

    df_results$race_id = res_race$id

    request_result <- DBI::dbSendQuery(con, "INSERT INTO results (global_time, time_from_winner, category, number_controls, comments, distance, elevation, race_id)
                                       VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING id")
    DBI::dbBind(request_result, unname(as.list(df_results)))
    res_result <- DBI::dbFetch(request_result)
    DBI::dbClearResult(request_result)

    df_mistake$result_id = res_result$id

    result_final = DBI::dbWriteTable(con, "mistakes", df_mistake, append = T, row.names = F)


  })

}
