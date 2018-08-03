# This function will pull entries from the Das1_Trip_Summary tablw
#
#'
#' @param con PostgreSQL db connection object
#' @param tba
#' @return Dataframe containing Das1_Trip_Summary table entries
#' @examples
#' connect_to_database("MyUserName","MyPassword")
#

fetch_das1_trip_summary <- function(con, deviceID, startdate)
{
   queryStringApr <- "SELECT * FROM spmd.ex_tripsummary_datawsu_april";
   counter <- 0;
   if(!missing(deviceID)||!missing(startdate))
   {
     queryStringApr <- paste(queryStringApr, "WHERE");
     if(!missing(deviceID)) {
       queryStringApr <- paste(queryStringApr, "deviceid =", deviceID);
       counter <- 1;
     }
     if(!missing(startdate)) {
       if(counter == 1)
       {
         queryString <- paste(queryString, "AND")
       }
       startstring <- paste("'", startdate, "'", sep="")
       queryString <- paste(queryString, "startdate =", startstring);
       counter <- 1;
     }
   }

   return_df <- dbGetQuery(con, queryString)

   return(return_df);
}
