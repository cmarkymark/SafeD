# fetch_das1_datawsu
# This function will pull entries from the das1_datawsu table
#
#' @title Fetch Das1 WSU Data
#' @param con PostgreSQL db connection object
#' @param deviceID optional search parameter, Device ID
#' @return data frame representing data from the datawsu table
#' @examples
#' fetch_das1_datawsu(con, deviceID = 17103)
#

fetch_das1_datawsu <- function(con, deviceID, noLimit = FALSE)
{
  queryString <- "SELECT * FROM spmd.das1_datawsu";
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
