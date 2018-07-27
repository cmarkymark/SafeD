# This file will handle connecting to the database
#
#' Connects to the database and returns a database connection object
#' @param username Username being used to access database
#' @param password Password beig used to access database
#' @return Database connection object
#' @examples
#' connect_to_database("MyUserName","MyPassword")
#
connect_to_database <- function(username, password) {

  # Load the database driver
  drv <- dbDriver("PostgreSQL")

  # Load the database connection
  # If connection established, then will return object representing the connection
  # If connection not established, then...
  con <- dbConnect(drv, dbname = "safed",
                   host = "130.191.118.107", port = 5432,
                   user = username, password = password)

  return(con)
}
