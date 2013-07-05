module.exports = (container, get) ->
  container.unless "pingResponse", "pong"

  container.set "pingReply", (pingResponse, logger) ->
    ->
      logger.info "ping response", message: pingResponse
      "Response is \"#{pingResponse}\""

  get "/ping", (pingReply) ->
    (req, res) ->
      res.send 200, pingReply()
