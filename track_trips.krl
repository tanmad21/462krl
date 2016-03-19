ruleset track_trips {
  meta {
    name "Track Trips"
    description <<
      The second ruleset required b the lab.
    >>
    author "Tanner Madsen"
    logging on
    sharing on
  }
  
  rule process_trip is active {
    select when echo message mileage "(.*)" setting(m)
    send_directive("trip") with
      trip_length = m;
    always {
      log "mileage rule ran"
    }
  }
}