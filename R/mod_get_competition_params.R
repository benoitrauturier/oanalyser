mod_get_competition_paramsInput <- function(){
  fluidRow(
    column(4,
           textInput("competition_name", label = h3("Competition Name"), placeholder = "Competition name")
    )
  )
}


mod_get_competition_params <- function(input, output, session){

}
