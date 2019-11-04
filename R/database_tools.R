#' Connect to database
#'
#' This function connects to the application database. It needs the database parameters to be entered as environment variables as OANALYSER_DB_HOST, OANALYSER_DB_PASS, OANALYSER_DB_USER, OANALYSER_DB_PORT.
#'
#' @param environment_file the environment variable file to execute
#'
#' @return a connector object to a Postgresql database
#' @export
#'
#' @importFrom DBI dbConnect
#' @importFrom RPostgres Postgres()
#' @examples
#' \dontrun{
#'
#' con <- connect_to_db()
#' }
#'
#'
connect_to_db <- function(){

  host <- Sys.getenv("OANALYSER_DB_HOST")
  pass <- Sys.getenv("OANALYSER_DB_PASS")
  user <- Sys.getenv("OANALYSER_DB_USER")
  port <- Sys.getenv("OANALYSER_DB_PORT")


  con_db <- DBI::dbConnect(RPostgres::Postgres(),
                           host = host,
                           port = port,
                           user = user,
                           password = pass)


  con_db
}
