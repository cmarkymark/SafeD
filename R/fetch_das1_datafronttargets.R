#fetch_das1_datafronttargets
# This function will pull entries from the das1_datafronttargets table
#
#' @title Fetch Das1 Front Targets Data
#' @param con PostgreSQL db connection object
#' @param deviceID optional search parameter, Device ID
#' @param tripID optional search parameter, trip ID
#' @return
#' @examples
#' fetch_das1_datafronttargets(con, deviceID = 17103, tripID = 68)
#

fetch_das1_datafronttargets <- function(con, deviceID, noLimit = FALSE)
{
  queryString <- "SELECT * FROM spmd.das1_datafronttargets";
  counter <- 0; #counter for inserting AND statement into 'WHERE' of search query if necessary
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
