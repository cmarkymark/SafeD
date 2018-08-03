#fetch_das1_datalane
# This function will pull entries from the das1_datalane table
#
#' @title Fetch Das1 Lane Data
#' @param con PostgreSQL db connection object
#' @param deviceID optional search parameter, Device ID
#' @return Entries from the das1_datatable
#' @examples
#' fetch_das1_datalane(con, deviceID = 17103, tripID = 68)
#

fetch_das1_datalane <- function(con, deviceID, noLimit = FALSE)
{
  queryString <- "SELECT * FROM spmd.das1_datalane";
  if(!missing(deviceID)) #check for optional arguments
  {
    queryString <- paste(queryString, "WHERE");
    queryString <- paste(queryString, "device =", deviceID);
  }
  if(noLimit == FALSE)
  {
    queryString <- paste(queryString, "LIMIT 2000;");
  }
  df <- dbGetQuery(con, queryString);

  return(df); #return
}
