mod_get_competition_paramsInput <- function(){
  fluidPage(fluidRow(
    column(4,
           textInput("competition_name", label = h3("Competition Name"), placeholder = "Competition name")
    ),
    column(4,
           textInput("competition_place", label = h3("place"), placeholder = "Competition place")
    )
  ),
  fluidRow(
    column(4,
           actionButton("validate_competition_params", label = h3("validate")))
  )
  )

}


mod_get_competition_params <- function(input, output, session){

}
