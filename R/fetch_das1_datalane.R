#fetch_das1_datalane
# This function will pull entries from the das1_datalane table
#
#' @title Fetch Das1 Lane Data
#' @param con PostgreSQL db connection object
#' @param deviceID optional search parameter, Device ID
#' @param tripID optional search parameter, trip ID
#' @return
#' @examples
#' fetch_das1_datalane(con, deviceID = 17103, tripID = 68)
#

fetch_das1_datalane <- function(con, deviceID, tripID)
{
  queryString <- "SELECT * FROM spmd.das1_datalane";
  counter <- 0; #counter for inserting AND statement into 'WHERE' of search query if necessary
  if(!missing(deviceID)||!missing(tripID)) #check for optional arguments
  {
    queryString <- paste(queryString, "WHERE");
    if(!missing(deviceID)) { #insert deviceid into search query
      queryString <- paste(queryString, "device =", deviceID);

      counter <- 1;
    }
    if(!missing(tripID)) { #insert tripID
      if(counter == 1)
      {
        queryString <- paste(queryString, "AND");

      }
      queryString <- paste(queryString, "trip =", tripID);

      counter <- 1;
    }
  }
  queryString <- paste(queryString, "LIMIT 3000;");
  df <- dbGetQuery(con, queryString);

  return(df); #return
}
