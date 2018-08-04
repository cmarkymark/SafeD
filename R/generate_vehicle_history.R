#Generate vehicle history -- DOESNT WORK YET, GOING TO DEFINE CLASS OBJECTS

generate_vehicle_history <- function(con, deviceID)
{
  Vehicle <- new("Vehicle")

  print("Preparing to load DAS1 Trip Summaries");
  das1_trip_summaries <- fetch_das1_trip_summary(con, deviceID);
  i <- 0;
  x <- list();
  for(tripid in das1_trip_summaries$tripid){
    #print(tripid);
    tp <- new("Trip");
    tp@id <- tripid;
    x[i] <- tp;
     i <- i+1;
  }
  print(typeof(x));
  Vehicle@Trips<-x;
  return(Vehicle);
  #print("Loaded DAS1 Trip Summaries");
  #print("Preparing to load DAS1 WSU tables");
  #das1_datawsu <- fetch_das1_datawsu(con, deviceID, noLimit = TRUE);
  #print("Loaded DAS1 WSU"); #4 minutes-ish
  #print("Preparing to load DAS1 DataLane tables");
  #das1_datalane <- fetch_das1_datalane(con, deviceID, noLimit = TRUE);
  #print("Loaded DAS1 DataLane"); #5 minutes-ish
  #print("Loading DAS1 Front Targets");
  #das1_datafronttargets <- fetch_das1_datafronttargets(con, deviceID, noLimit = TRUE);
  #print("Loaded DAS1 Front Targets");
  #print("Formatting Data");

  #split the datasets by trip
  #split_datawsu <- split(das1_datawsu, das1_datawsu$trip);
  #split_datalane <- split(das1_datalane, das1_datalane$trip);
  #split_fronttargets <- split(das1_datalane, das1_datafronttargets$trip);

  #create columns in das1_trip_summaries
  #das1_trip_summaries$datawsu <- 0;
  #das1_trip_summaries$datalane <- 0;
  #das1_trip_summaries$fronttargets <- 0;

  #for (trip in das1_trip_summaries$tripid) {
    #print("Trip started");
    #for(split in split_datawsu) {
     # tripId <- split$trip[1];
      #if(trip == tripId) {
       # das1_trip_summaries$datawsu <- split;
      #}
    #}
    #for(split in split_datalane) {
    #  tripId <- split$trip[1];
     # if(trip == tripId) {
      #  das1_trip_summaries$datalane <- split;
      #}
    #}
    #for(split in split_fronttargets) {
     # tripId <- split$trip[1];
      #if(trip == tripId) {
      #  das1_trip_summaries$fronttargets <- split;
      #}
    #}
    #print("Trip Completed");
#  }
 # print("Data organized");
  #ret <- das1_trip_summaries;
  #return(ret);
}
