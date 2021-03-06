# This function will pull entries from the Das1_Trip_Summary tablw
#
#' @title Fetch Trip Summaries
#' @param con PostgreSQL db connection object
#' @param deviceID optional search parameter, Device ID
#' @param startdate optional search parameter, trip date, format 'YYYY-MM-DD'
#' @return Dataframe containing Das1_Trip_Summary table entries
#' @examples
#' fetch_das1_trip_summary(con, deviceID = 10107, startdate = '2012-10-01')
#

fetch_das1_trip_summary <- function(con, deviceID, startdate)
{
  #because there are two databases we must query from both of them
  queryString1 <- "SELECT * FROM spmd.ex_tripsummary_datawsu_april";
  queryString2 <- "SELECT * FROM spmd.ex_tripsummary_datawsu_october";
  counter <- 0; #counter is being used to insert 'AND' into query 'WHERE' clause if necessary
  if(!missing(deviceID)||!missing(startdate)) #checking if the optional fields have been utilized
  {
    queryString1 <- paste(queryString1, "WHERE");
    queryString2 <- paste(queryString2, "WHERE");
    if(!missing(deviceID)) { #insert deviceID into search query
      queryString1 <- paste(queryString1, "deviceid =", deviceID);
      queryString2 <- paste(queryString2, "deviceid =", deviceID);
      counter <- 1;
    }
    if(!missing(startdate)) { #insert date into search query
      if(counter == 1)
      {
        queryString1 <- paste(queryString1, "AND");
        queryString2 <- paste(queryString2, "AND");
      }
      startstring <- paste("'", startdate, "'", sep="")
      queryString1 <- paste(queryString1, "startdate =", startstring);
      queryString2 <- paste(queryString2, "startdate =", startstring);
      counter <- 1;
    }
  }

  #queryString1 <- paste(queryString1, "LIMIT 3000;");
  #queryString2 <- paste(queryString2, "LIMIT 1000;");
  df1 <- dbGetQuery(con, queryString1);
  df2 <- dbGetQuery(con, queryString2);

  return_df <- rbind(df1,df2); #combine the two returned data frames
  return(return_df); #return
}
