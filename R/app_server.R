#' @import shiny
#' @importFrom graphics hist
#' @importFrom stats rnorm
#'
app_server <- function(input, output,session) {

  if ( app_prod() ){message("prod mode")}else{message("dev mode")}

  input_val <- callModule(setup, "the_setup")
  comp_inputs <- callModule(mod_get_competition_params,
                            id = "competition_info",
                            val_comp_param = reactive(input$validate_course_params),
                            input_val = reactive(reactiveValuesToList(input)))
  #reactive({print(comp_inputs())})
  #print(comp_params$race_params)
  mod_get_competition_params(input, output, session)
  mod_get_mistakes(input, output, session)
  mistakes_data <- callModule(mod_register_mistake,
                             id = 'mistakes_data_gen',
                             mistake_submitted = reactive(input$mistake_submitted),
                             input_val = reactive(reactiveValuesToList(input)))

  dt_mistakes <- callModule(mod_render_dt_mistakes,
                            id = "renderer_dt_mistakes",
                            mistakes = mistakes_data)

  mod_get_push_button(input, output, session)
  #mod_push_to_db(input, output, session, comp_params = comp_params)
  callModule(mod_push_to_db,
             id = "competition_info",
             is_pushed = reactive(input$push_result),
             comp_in = comp_inputs(),
             mistakes = mistakes_data)
}
