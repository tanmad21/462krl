ruleset echo {
  meta {
    name "echo"
    description <<
      Playing with an echo endpoint
    >>
    author "Tanner Madsen"
    logging on
  }

  rule hello is active {
    select when echo hello
    send_directive("say") with
      something = "Hello World";
    always {
      log "hello rule should have responded with a say directive"
    }
  }
  
  rule message is active {
    select when echo message input re#(.*)# setting(m)
    send_directive("say") with
      something = m;
  }
}